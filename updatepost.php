<?php
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided 'as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/
require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

(getContent('forum-enabled') != 1) ? header('Location: index.php') : '';

$postId = isset($_POST['postId']) ? (int) $_POST['postId'] : 0;
$message = isset($_POST['message']) ? FilterText($_POST['message']) : '';
$topicId = isset($_POST['topicId']) ? (int) $_POST['topicId'] : 0;
$page = isset($_POST['page']) ? (int) $_POST['page'] : 1;

if(!empty($postId) && !empty($topicId)) {
  $check = mysqli_query($connection, "SELECT * FROM cms_forum_threads WHERE id = '{$topicId}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    $thread = mysqli_fetch_assoc($check);
    $check = mysqli_query($connection, "SELECT * FROM cms_forum_posts WHERE id = '{$postId}' LIMIT 1") or die(mysqli_error($connection));
    $exists = mysqli_num_rows($check);
    $valid_thread = true;
      if($exists > 0) {
        $xpostdata = mysqli_fetch_assoc($check);
        if($user_rank > 5 || $xpostdata['author'] == $name) {
          mysqli_query($connection, "UPDATE cms_forum_posts SET edit_author = '{$name}', edit_date = '{$date_full}', message = '{$message}' WHERE id = '{$postId}' LIMIT 1") or die(mysqli_error($connection));
        } else {
          exit;
        }
      } else {
        exit;
      }
  } else {
    exit;
  }
} else {
  exit;
}

(empty($topicId)) ? exit : '';

$posts = mysqli_evaluate("SELECT COUNT(*) FROM cms_forum_posts WHERE threadid = '{$topicId}'");
$pages = ceil(($posts + 0) / 10);
$page = ($page > $pages || $page < 1) ? 1 : $page;

switch($thread['type']) {
  case 1:
    $topic_open = true;
    break;
  case 2:
    $topic_open = false;
    break;
  case 3:
    $topic_open = true;
    break;
  case 4:
    $topic_open = false;
    break;
}

(!isset($topic_open)) ? exit : '';
?>
  <div id="group-postlist-container">
    <div class="postlist-header clearfix">
      <?php echo ($topic_open ? '<a href="#" id="create-post-message" class="create-post-link verify-email">Post reply</a>' : ''); ?>
      <input type="hidden" id="email-verfication-ok" value="1" />
      <?php echo ($user_rank > 5 ? '<a href="#" id="edit-topic-settings" class="edit-topic-settings-link">Moderation Tools &raquo;</a><input type="hidden" id="settings_dialog_header" value="Moderation Tools" />' : ''); ?>
      <div class="page-num-list">
        <input type="hidden" id="current-page" value="<?php echo $page; ?>" />
        View page:
        <?php
          for ($i = 1; $i <= $pages; $i++) {
            if($page == $i) {
              echo $i . "\n";
            } else {
        ?>
        <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $topicId; ?>&page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a>
        <?php
            }
          } 
        ?>
      </div>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="group-postlist-list" id="group-postlist-list">
      <?php
        // Post view handler & echoer
        $query_min = ($page * 10) - 10;
        $query_min = ($query_min < 0) ? 0 : $query_min;
        $get_em = mysqli_query($connection, "SELECT * FROM cms_forum_posts WHERE threadid = '{$topicId}' ORDER BY id ASC LIMIT {$query_min}, 10") or die(mysqli_error($connection));
        $dynamic_id = 0;
        while($row = mysqli_fetch_assoc($get_em)) {
          $dynamic_id++;
          $oddeven = (IsEven($dynamic_id)) ? 'odd' : 'even';
          $userquery = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$row['author']}' LIMIT 1");
          $userdata = mysqli_fetch_assoc($userquery);
          $userid = $userdata['id'];
      ?>
      <tr class="post-list-index-<?php echo $oddeven; ?>">
        <a id='post-<?php echo $row['id']; ?>'>
        <td class="post-list-row-container">
          <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $userdata['name']; ?>" class="post-list-creator-link post-list-creator-info"><?php echo $userdata['name']; ?></a><br />&nbsp;
          <?php echo (IsUserOnline($userid) ? '<img alt="Online" src="' . $web_gallery . 'images/myhabbo/habbo_online_anim.gif" />' : '<img alt="Offline" src="' . $web_gallery . 'images/myhabbo/habbo_offline.gif" />'); ?>
          <div class="post-list-posts post-list-creator-info">Messages: <?php echo $userdata['postcount']; ?></div>
          <div class="clearfix">
            <div class="post-list-creator-avatar">
              <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userdata['figure']; ?>&size=b&direction=2&head_direction=2&gesture=sml" alt="<?php echo $userdata['name']; ?>" />
            </div>
            <div class="post-list-group-badge">
              <?php echo (GetUserGroup($userid) ? '<a href="' . $path . 'group_profile.php?id=' . GetUserGroup($userid) . '"><img src="' . $path . 'habbo-imaging/badge.php?badge=' . GetUserGroupBadge($userid) . '" /></a>' : ''); ?>
            </div>
            <div class="post-list-avatar-badge">
              <?php echo (GetUserBadge($userid) ? '<img src="http://images.habbohotel.co.uk/c_images/album1584/' . GetUserBadge($userid) . '.gif" />' : ''); ?>
            </div>
          </div>
          <div class="post-list-motto post-list-creator-info"><?php echo HoloText($userdata['mission']); ?></div>
        </td>
        <td class="post-list-message" valign="top" colspan="2">
          <a href="#" class="quote-post-link verify-email" id="quote-post-<?php echo $row['id']; ?>-message">Quote</a>
          <?php echo ($user_rank > 5 || $my_id == $userdata['id'] ? '<a href="#" class="edit-post-link verify-email" id="edit-post-' . $row['id'] . '-message">Modify</a>' : ''); ?>
          <span class="post-list-message-header">
            <?php echo  ($dynamic_id !== 1 || $page > 1 ? 'RE: ' : ''); ?>
            <?php echo HoloText($thread['title']); ?>
          </span>
          <br />
          <span class="post-list-message-time"><?php echo $row['date']; ?></span>
          <div class="post-list-report-element">
            <?php echo  ($user_rank > 5 || $my_id == $userdata['id'] ? '<a href="#" id="delete-post-' . $row['id'] . '" class="delete-button delete-post"></a>' : ''); ?>
            <?php echo ($my_id !== $userdata['id'] ? '<div class="post-list-report-element"><a href="' . $path . 'iot/go.php?do=report&post=' . $row['id'] . '&page=' . $page . '" class="create-report-button" title="Report this post" target="habbohelp" onclick="openOrFocusHelp(this); return false"></a></div>' : ''); ?>
          </div>
          <?php echo (!empty($row['edit_date']) && !empty($row['edit_author']) ? '<br /><br /><font size="1"><strong>Last modified ' . $row['edit_date'] . ' by ' . $row['edit_author'] . '</strong></font>' : ''); ?>
          <div class="post-list-content-element">
            <?php echo HoloText($row['message'], true); ?>
            <input type="hidden" id="<?php echo $row['id']; ?>-message" value="<?php echo HoloText($row['message']); ?>" />
          </div>
          <div>
          </div>
        </td>
      </tr>
      <?php } ?>
      <tr id="new-post-entry-message" style="display:none;">
        <td class="new-post-entry-label">
          <div class="new-post-entry-label" id="new-post-entry-label">Message:</div>
        </td>
        <td colspan="2">
          <table border="0" cellpadding="0" cellspacing="0" style="margin: 5px; width: 98%;">
            <tr>
              <td>
                <input type="hidden" id="edit-type" />
                <input type="hidden" id="post-id" />
                <a href="#" class="preview-post-link" id="post-form-preview">Preview &raquo;</a>
                <input type="hidden" id="spam-message" value="Spam-alarm!" />
                <textarea id="post-message" class="new-post-entry-message" rows="5" name="message"></textarea>
                <script type="text/javascript">
                  bbcodeToolbar = new Control.TextArea.ToolBar.BBCode('post-message');
                  bbcodeToolbar.toolbar.toolbar.id = 'bbcode_toolbar';
                  var colors = {
                    'red': ['#d80000', 'Red'],
                    'orange': ['#fe6301', 'Orange'],
                    'yellow': ['#ffce00', 'Yellow'],
                    'green': ['#6cc800', 'Green'],
                    'cyan': ['#00c6c4', 'Cyan'],
                    'blue': ['#0070d7', 'Blue'],
                    'gray': ['#828282', 'Grey'],
                    'black': ['#000000', 'Black']
                  };
                  bbcodeToolbar.addColorSelect('Color', colors, false);
                </script>
                <br />
                <br />
                <a id="post-form-cancel" class="new-button red-button cancel-icon" href="#"><b><span></span>Cancel</b><i></i></a>
                <a id="post-form-save" class="new-button green-button save-icon" href="#"><b><span></span>Save</b><i></i></a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <div id="new-post-preview" style="display:none;"></div>
    <div class="postlist-footer clearfix">
      <?php echo ($topic_open ? '<a href="#" id="create-post-message-lower" class="create-post-link verify-email">Post reply</a>' : ''); ?>
      <div class="page-num-list">
        View page:
        <?php
          for ($i = 1; $i <= $pages; $i++) {
            if($page == $i) {
              echo $i . "\n";
            } else {
        ?>
        <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $topicId; ?>&page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a>
        <?php
            }
          } 
        ?>
      </div>
    </div>
  </div>
  <a id="page-bottom"></a>
  <script type="text/javascript" language="JavaScript">
    L10N.put('myhabbo.discussion.error.topic_name_empty', 'Topic title may not be empty');
    Discussions.initialize('DiscussionBoard', 'forum.php', '<?php echo $topicId; ?>');
  </script>