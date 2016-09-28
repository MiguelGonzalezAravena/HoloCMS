<?php
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/
require_once(dirname(__FILE__) . '/../core.php'); 
$x = isset($_GET['x']) ? FilterText($_GET['x']) : '';

(getContent('forum-enabled') != 1) ? header('Location: index.php') : '';
(!isset($_SESSION['username'])) ? exit : '';
($x != 'topic' && $x !== 'post') ? exit : '';

$message = isset($_POST['message']) ? FilterText($_POST['message']) : '';
$topicName = isset($_POST['topicName']) ? FilterText($_POST['topicName']) : 'Post preview';
?>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class="group-postlist-list" id="group-postlist-list">
    <tr class="post-list-index-preview">
      <td class="post-list-row-container">
        <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $myrow['name']; ?>" class="post-list-creator-link post-list-creator-info"><?php echo $myrow['name']; ?></a>
        <br />&nbsp;&nbsp;
        <img alt="offline" src="<?php echo $web_gallery; ?>images/myhabbo/habbo_online_anim.gif" />
        <div class="post-list-posts post-list-creator-info">Messages: <?php echo $myrow['postcount']; ?></div>
        <div class="clearfix">
          <div class="post-list-creator-avatar">
            <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $myrow['figure']; ?>&size=b&direction=2&head_direction=2&gesture=sml" alt="<?php echo $myrow['name']; ?>" />
          </div>
          <div class="post-list-group-badge">
            <?php echo (GetUserGroup($my_id) != false ? '<a href="' . $path . 'group_profile.php?id=' . GetUserGroup($my_id) . '"><img src="' . $path . 'habbo-imaging/badge.php?badge=' . GetUserGroupBadge($my_id) . '" /></a>' : ''); ?>
          </div>
          <div class="post-list-avatar-badge">
            <?php echo (GetUserBadge($my_id) != false ? '<img src="http://images.habbohotel.co.uk/c_images/album1584/' . GetUserBadge($my_id) . '.gif" />' : ''); ?>
          </div>
        </div>
        <div class="post-list-motto post-list-creator-info">
          <?php echo $myrow['mission']; ?>
        </div>
      </td>
      <td class="post-list-message" valign="top" colspan="2">
        <a href="#" id="edit-post-message" class="resume-edit-link">&laquo; Modify</a>
        <span class="post-list-message-header"><?php echo $topicName; ?></span>
        <br />
        <span class="post-list-message-time"><?php echo $date_full; ?></span>
        <div class="post-list-report-element">
        </div>
        <div class="post-list-content-element">
          <?php echo HoloText($message, true); ?>
        </div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div>
          <?php if($x == 'topic') { ?>
          <a id="topic-form-cancel-preview" class="new-button red-button cancel-icon" href="#"><b><span></span>Cancel</b><i></i></a>
          <a id="topic-form-save-preview" class="new-button green-button save-icon" href="#"><b><span></span>Save</b><i></i></a> 
          <?php } else { ?>
          <a id="post-form-cancel" class="new-button red-button cancel-icon" href="#"><b><span></span>Cancel</b><i></i></a>
          <a id="post-form-save" class="new-button green-button save-icon" href="#"><b><span></span>Save</b><i></i></a>
          <?php } ?>
        </div>
      </td>
    </tr>
  </table>
