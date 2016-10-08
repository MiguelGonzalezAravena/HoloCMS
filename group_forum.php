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
$allow_guests = true;

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');
(getContent('forum-enabled') != 1) ? header('Location: index.php') : '';

$pagename = 'Discussion Board';
$pageid = 'forum';
$body_id = 'viewmode';
$edit_mode = false;
$member_rank = 0;
$searchString = isset($_POST['searchString']) ? FilterText($_POST['searchString']) : '';
$groupid = isset($_GET['id']) ? (int) $_GET['id'] : 0;
$page = isset($_GET['page']) ? (int) $_GET['page'] : 0;

if(!empty($searchString)) {
  $check = mysqli_query($connection, "SELECT id FROM groups_details WHERE name LIKE '{$searchString}' LIMIT 1") or die(mysqli_error($connection));
  $found = mysqli_num_rows($check);
  if($found > 0) {
    $tmp = mysqli_fetch_assoc($check);
    header('Location: group_profile.php?id=' . $tmp['id']);
  }
}

if(!empty($groupid)) {
  $check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    $error = false;
    $groupdata = mysqli_fetch_assoc($check);
    $pagename = $groupdata['name'];
    $ownerid = $groupdata['ownerid'];
    $members = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '0'");
    $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND is_pending = '0' LIMIT 1");
    $is_member = mysqli_num_rows($check);
    if($is_member > 0 && $logged_in) {
      $is_member = true;
      $my_membership = mysqli_fetch_assoc($check);
      $member_rank = $my_membership['member_rank'];
    } else {
      $is_member = false;
    }
  } else {
    $error = true;
  }
} else {
  $error = true;
}

if($error != true) {
  require_once(dirname(__FILE__) . '/templates/community/subheader.php');
  require_once(dirname(__FILE__) . '/templates/community/header.php');

  mysqli_query($connection, "UPDATE groups_details SET views = views + 1 WHERE id = '{$groupid}' LIMIT 1");
  $viewtools = '<div class="myhabbo-view-tools">';
  $threads = mysqli_evaluate("SELECT COUNT(*) FROM cms_forum_threads WHERE forumid = '{$groupid}'");
  $pages = ceil(($threads + 0) / 10);
  $page = ($page > $pages || $page < 1) ? 1 : $page;
  $key = 0;
?>
    <div id="container">
      <div id="content" style="position: relative" class="clearfix">
        <div id="mypage-wrapper" class="cbb blue">
          <div class="box-tabs-container box-tabs-left clearfix">
            <?php echo ($member_rank > 1 && $edit_mode ? '<a href="' . $path . 'group_profile.php?id=' . $groupid . '&do=edit" class="new-button dark-button edit-icon" style="float:left"><b><span></span>Edit</b><i></i></a>' : ''); ?>
            <h2 class="page-owner">
              <?php echo HoloText($groupdata['name']); ?>&nbsp;
              <?php echo ($groupdata['type'] == 2 ? '<img src="' . $web_gallery . 'images/status_closed_big.gif" alt="Closed Group" title="Closed Group" />' : ''); ?>
              <?php echo ($groupdata['type'] == 1 ? '<img src="' . $web_gallery . 'images/status_exclusive_big.gif" alt="Moderated Group" title="Moderated Group" />' : ''); ?>
            </h2>
            <ul class="box-tabs">
              <li>
                <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>">Front Page</a><span class="tab-spacer"></span>
              </li>
              <li class="selected">
                <a href="<?php echo $path; ?>group_forum.php?id=<?php echo $groupid; ?>">
                  Discussion Forum <?php echo ($groupdata['pane'] > 0 ? '<img src="' . $web_gallery . 'images/grouptabs/privatekey.png" alt="Private">' : ''); ?>
                </a>
                <span class="tab-spacer"></span>
              </li>
              <?php
                if($logged_in && !$is_member && $groupdata['type'] != 2 && $my_membership['is_pending'] != 1) {
                  $viewtools .= '<a href="' . $path . 'joingroup.php?groupId=' . $groupid . '" id="join-group-button">';
                  $viewtools .= ($groupdata['type'] == 0 || $groupdata['type'] == 3 ? 'Join' : 'Request membership');
                  $viewtools .= '</a>';
                }

                $viewtools .= ($logged_in && $my_membership['is_current'] != 1 && $is_member ? '<a href="#" id="select-favorite-button">Make favourite</a>' : '');
                $viewtools .= ($logged_in && $my_membership['is_current'] == 1 && $is_member ? '<a href="#" id="deselect-favorite-button">Remove favourite</a>' : '');
                $viewtools .= ($logged_in && $is_member && $my_id != $ownerid ? '<a href="' . $path . 'leavegroup.php?groupId=' . $groupid . '" id="leave-group-button">Leave group</a>' : '');
                $viewtools .= ' </div>';
              ?>
            </ul>
          </div>
          <div id="mypage-content">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="content-1col">
              <tr>
                <td valign="top" style="width: 750px;" class="habboPage-col rightmost">
                  <div id="discussionbox">
                    <?php
                      if($groupdata['pane'] > 0) {
                        $sql = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND is_pending != '1' AND groupid = '{$groupid}'");
                        $member = mysqli_fetch_assoc($sql);
                        if(mysqli_num_rows($sql) > 0) {
                    ?>
                    <div id="group-topiclist-container">
                      <div class="topiclist-header clearfix">
                        <?php
                          $sql = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
                          $row = mysqli_fetch_assoc($sql);
                          if($row['topics'] == 0) {
                        ?>
                        <input type="hidden" id="email-verfication-ok" value="1" />
                        <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                        <?php
                          } else if($row['topics'] == 1) {
                            $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND is_pending != '1' LIMIT 1");
                            if(mysqli_num_rows($check) > 0) {
                        ?>
                        <input type="hidden" id="email-verfication-ok" value="1" />
                        <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                        <?php
                            }
                          } else if($row['topics'] == 2) {
                          $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank = '2' AND is_pending != '1' LIMIT 1");
                            if(mysqli_num_rows($check) > 0) {
                        ?>
                        <input type="hidden" id="email-verfication-ok" value="1" />
                        <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                        <?php
                            }
                          }
                        ?>
                        <div class="page-num-list">
                          View page:
                          <?php
                            for ($i = 1; $i <= $pages; $i++) {
                              if($page == $i) {
                                echo $i;
                              } else {
                          ?>
                          <a href="<?php echo $path; ?>forum.php?page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a>
                          <?php
                              }
                            } 
                          ?>
                        </div>
                      </div>
                      <table class="group-topiclist" border="0" cellpadding="0" cellspacing="0" id="group-topiclist-list">
                        <tr class="topiclist-columncaption">
                          <td class="topiclist-columncaption-topic">Topic</td>
                          <td class="topiclist-columncaption-lastpost">Last post</td>
                          <td class="topiclist-columncaption-replies">Replies</td>
                          <td class="topiclist-columncaption-views">Views</td>
                        </tr>
                        <?php if($threads == 0) { ?>
                        <tr class="topiclist-row-1">
                          <td class="topiclist-rowtopic" valign="top">
                            No threads to display.
                          </td>
                        </tr>
                        <?php
                          }

                          $sql = mysqli_query($connection, "SELECT * FROM cms_forum_threads WHERE type > 2 AND forumid = '{$groupid}' ORDER BY unix DESC") or die(mysqli_error($connection));
                          $stickies = mysqli_num_rows($sql);

                          $query_min = ($page * 10) - 10;
                          $query_max = 10;
                          $query_max = $query_max - $stickies;
                          $query_min = $query_min - $stickies;
                          $query_min = ($query_min < 0) ? 0 : $query_min;
                          while($row = mysqli_fetch_assoc($sql)) {
                            $key++;
                            $x = (IsEven($key)) ? 'odd' : 'even';
                            $date_bits = explode(' ', $row['date']);
                            $date = $date_bits[0];
                            $time = $date_bits[1];
                            $lastpost_date_bits = explode(' ', $row['lastpost_date']);
                            $lastpost_date = $lastpost_date_bits[0];
                            $lastpost_time = $lastpost_date_bits[1];
                        ?>
                        <tr class="topiclist-row-<?php echo $x; ?>">
                          <td class="topiclist-rowtopic" valign="top">
                            <div class="topiclist-row-content">
                              <a class="topiclist-link icon icon-sticky" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>"><?php echo HoloText($row['title']); ?></a>
                              <?php echo ($row['type'] == 4 ? '&nbsp;<span class="topiclist-row-topicsticky"><img src="' . $web_gallery . 'images/groups/status_closed.gif" title="Closed Thread" alt="Closed Thread"></span>' : ''); ?>
                              &nbsp;(page 
                              <?php
                                $thread_pages = ceil(($row['posts'] + 1) / 10);
                                for ($i = 1; $i <= $thread_pages; $i++) {
                              ?>
                              <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a><?php } ?>)
                              <br />
                              <span>
                                <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['author'];; ?>"><?php echo $row['author']; ?></a>
                              </span>&nbsp;
                              <span class="latestpost"><?php echo $date; ?></span>
                              <span class="latestpost">(<?php echo $time; ?>)</span>
                            </div>
                          </td>
                          <td class="topiclist-lastpost" valign="top">
                            <a class="lastpost-page-link" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&sp=JumpToLast">
                              <span class="lastpost"><?php echo $lastpost_date; ?></span>
                              <span class="lastpost">(<?php echo $lastpost_time; ?>)</span>
                            </a>
                            <br />
                            <span class="topiclist-row-writtenby">by:</span>
                            <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['lastpost_author']; ?>"><?php echo $row['lastpost_author']; ?></a>&nbsp;
                          </td>
                          <td class="topiclist-replies" valign="top"><?php echo $row['posts']; ?></td>
                          <td class="topiclist-views" valign="top"><?php echo $row['views']; ?></td>
                        </tr>
                        <?php
                          }

                          $sql = mysqli_query($connection, "SELECT * FROM cms_forum_threads WHERE type < 3 AND forumid = '{$groupid}' ORDER BY unix DESC LIMIT {$query_min}, {$query_max}") or die(mysqli_error($connection));
                          while($row = mysqli_fetch_assoc($sql)) {
                            $key++;
                            $x = (IsEven($key)) ? 'odd' : 'even';
                            $date_bits = explode(' ', $row['date']);
                            $date = $date_bits[0];
                            $time = $date_bits[1];
                            $lastpost_date_bits = explode(' ', $row['lastpost_date']);
                            $lastpost_date = $lastpost_date_bits[0];
                            $lastpost_time = $lastpost_date_bits[1];
                        ?>
                        <tr class="topiclist-row-<?php echo $x; ?>">
                          <td class="topiclist-rowtopic" valign="top">
                            <div class="topiclist-row-content">
                              <a class="topiclist-link" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>"><?php echo HoloText($row['title']); ?></a>
                              <?php echo ($row['type'] == 2 ? '&nbsp;<span class="topiclist-row-topicsticky"><img src="' . $web_gallery . 'images/groups/status_closed.gif" title="Closed Thread" alt="Closed Thread"></span>' : ''); ?>
                              &nbsp;(page 
                              <?php
                                $thread_pages = ceil(($row['posts'] + 1) / 10);
                                for ($i = 1; $i <= $thread_pages; $i++) {
                              ?>
                              <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a><?php } ?>)
                              <br />
                              <span>
                                <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['author']; ?>"><?php echo $row['author']; ?></a>
                              </span>&nbsp;
                              <span class="latestpost"><?php echo $date; ?></span>
                              <span class="latestpost">(<?php echo $time; ?>)</span>
                            </div>
                          </td>
                          <td class="topiclist-lastpost" valign="top">
                            <a class="lastpost-page-link" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&sp=JumpToLast">
                              <span class="lastpost"><?php echo $lastpost_date; ?></span>
                              <span class="lastpost">(<?php echo $lastpost_time; ?>)</span>
                            </a>
                            <br />
                            <span class="topiclist-row-writtenby">by:</span>
                            <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['lastpost_author']; ?>"><?php echo $row['lastpost_author']; ?></a>&nbsp;
                          </td>
                          <td class="topiclist-replies" valign="top"><?php echo $row['posts']; ?></td>
                          <td class="topiclist-views" valign="top"><?php echo $row['views']; ?></td>
                        </tr>
                        <?php } ?>
                      </table>
                      <div class="topiclist-footer clearfix">
                        <?php
                          $sql = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
                          $row = mysqli_fetch_assoc($sql);

                          if($row['topics'] == 0) {
                        ?>
                        <input type="hidden" id="email-verfication-ok" value="1" />
                        <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                        <?php
                          } else if($row['topics'] == 1) {
                            $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' LIMIT 1");
                            if(mysqli_num_rows($check) > 0) {
                        ?>
                        <input type="hidden" id="email-verfication-ok" value="1" />
                        <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                        <?php
                            }
                          } else if($row['topics'] == 2) {
                            $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank = '2' LIMIT 1");
                            if(mysqli_num_rows($check) > 0) {
                        ?>
                        <input type="hidden" id="email-verfication-ok" value="1" />
                        <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                        <?php
                            }
                          }
                        ?>
                        <div class="page-num-list">
                          View page:
                          <?php
                            for ($i = 1; $i <= $pages; $i++) {
                              if($page == $i) {
                                echo $i;
                              } else {
                          ?>
                          <a href="<?php echo $path; ?>forum.php?page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a>
                          <?php
                              }
                            }
                          ?>
                        </div>
                        <?php } else { ?>
                        <h1>Oops...</h1>
                        <p>
                          You can't acces this discussion forum, you need to be a member!<br />
                        </p>
                        <?php
                            }
                          } else {
                        ?>
                        <div id="group-topiclist-container">
                          <div class="topiclist-header clearfix">
                            <input type="hidden" id="email-verfication-ok" value="1" />
                            <?php
                              $sql = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
                              $row = mysqli_fetch_assoc($sql);

                              if($row['topics'] == 0) {
                            ?>
                            <input type="hidden" id="email-verfication-ok" value="1" />
                            <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                            <?php
                              } else if($row['topics'] == 1) {
                                $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' LIMIT 1");
                                if(mysqli_num_rows($check) > 0) {
                            ?>
                            <input type="hidden" id="email-verfication-ok" value="1" />
                            <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                            <?php
                                }
                              } else if($row['topics'] == 2) {
                                $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank = '2' LIMIT 1");
                                if(mysqli_num_rows($check) > 0) {
                            ?>
                            <input type="hidden" id="email-verfication-ok" value="1" />
                            <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                            <?php
                                }
                              }
                            ?>
                            <div class="page-num-list">
                              View page:
                              <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                  if($page == $i) {
                                    echo $i ;
                                  } else {
                              ?>
                              <a href="<?php echo $path; ?>forum.php?page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a>
                              <?php
                                  }
                                } 
                              ?>
                            </div>
                          </div>
                          <table class="group-topiclist" border="0" cellpadding="0" cellspacing="0" id="group-topiclist-list">
                            <tr class="topiclist-columncaption">
                              <td class="topiclist-columncaption-topic">Topic</td>
                              <td class="topiclist-columncaption-lastpost">Last post</td>
                              <td class="topiclist-columncaption-replies">Replies</td>
                              <td class="topiclist-columncaption-views">Views</td>
                            </tr>
                            <?php if($threads == 0) { ?>
                            <tr class="topiclist-row-1">
                              <td class="topiclist-rowtopic" valign="top">
                                No threads to display.
                              </td>
                            </tr>
                            <?php
                              }

                              $sql = mysqli_query($connection, "SELECT * FROM cms_forum_threads WHERE type > 2 AND forumid = '{$groupid}' ORDER BY unix DESC") or die(mysqli_error($connection));
                              $stickies = mysqli_num_rows($sql);
                              $query_min = ($page * 10) - 10;
                              $query_max = 10;
                              $query_max = $query_max - $stickies;
                              $query_min = $query_min - $stickies;
                              $query_min = ($query_min < 0) ? 0 : $query_min;
                              while($row = mysqli_fetch_assoc($sql)) {
                                $key++;
                                $x = (IsEven($i)) ? 'odd' : 'even';
                                $date_bits = explode(' ', $row['date']);
                                $date = $date_bits[0];
                                $time = $date_bits[1];
                                $lastpost_date_bits = explode(' ', $row['lastpost_date']);
                                $lastpost_date = $lastpost_date_bits[0];
                                $lastpost_time = $lastpost_date_bits[1];
                            ?>
                            <tr class="topiclist-row-<?php echo $x; ?>">
                              <td class="topiclist-rowtopic" valign="top">
                                <div class="topiclist-row-content">
                                <a class="topiclist-link icon icon-sticky" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>"><?php echo HoloText($row['title']); ?></a>
                                <?php echo ($row['type'] == 4 ? '&nbsp;<span class="topiclist-row-topicsticky"><img src="' . $web_gallery . 'images/groups/status_closed.gif" title="Closed Thread" alt="Closed Thread"></span>' : ''); ?>
                                &nbsp;(page 
                                <?php
                                  $thread_pages = ceil(($row['posts'] + 1) / 10);
                                  for ($i = 1; $i <= $thread_pages; $i++) {
                                ?>
                                <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?> . "&page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a><?php } ?>)
                                <br />
                                <span>
                                  <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['author']; ?>"><?php echo $row['author']; ?></a>
                                </span>&nbsp;
                                <span class="latestpost"><?php echo $date; ?></span>
                                <span class="latestpost">(<?php echo $time; ?>)</span>
                                </div>
                              </td>
                              <td class="topiclist-lastpost" valign="top">
                                <a class="lastpost-page-link" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&sp=JumpToLast">
                                  <span class="lastpost"><?php echo $date; ?></span>
                                  <span class="lastpost">(<?php echo $time; ?>)</span>
                                </a><br />
                                <span class="topiclist-row-writtenby">by:</span>
                                <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['lastpost_author']; ?>"><?php echo $row['lastpost_author']; ?></a>&nbsp;
                              </td>
                              <td class="topiclist-replies" valign="top"><?php echo $row['posts']; ?></td>
                              <td class="topiclist-views" valign="top"><?php echo $row['views']; ?></td>
                            </tr>
                            <?php
                              }

                              $sql = mysqli_query($connection, "SELECT * FROM cms_forum_threads WHERE type < 3 AND forumid = '{$groupid}' ORDER BY unix DESC LIMIT {$query_min}, {$query_max}") or die(mysqli_error($connection));
                              while($row = mysqli_fetch_assoc($sql)) {
                                $key++;
                                $x = (IsEven($key)) ? 'odd' : 'even';
                                $date_bits = explode(' ', $row['date']);
                                $date = $date_bits[0];
                                $time = $date_bits[1];
                                $lastpost_date_bits = explode(' ', $row['lastpost_date']);
                                $lastpost_date = $lastpost_date_bits[0];
                                $lastpost_time = $lastpost_date_bits[1];
                            ?>
                            <tr class="topiclist-row-<?php echo $x; ?>">
                              <td class="topiclist-rowtopic" valign="top">
                                <div class="topiclist-row-content">
                                <a class="topiclist-link " href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>"><?php echo HoloText($row['title']); ?></a>
                                <?php echo ($row['type'] == 2 ? '&nbsp;<span class="topiclist-row-topicsticky"><img src="' . $web_gallery . 'images/groups/status_closed.gif" title="Closed Thread" alt="Closed Thread"></span>' : ''); ?>
                                &nbsp;(page 
                                <?php
                                  $thread_pages = ceil(($row['posts'] + 1) / 10);
                                  for ($i = 1; $i <= $thread_pages; $i++) {
                                ?>
                                <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a><?php } ?>)
                                <br />
                                <span>
                                  <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['author']; ?>"><?php echo $row['author']; ?></a>
                                </span>&nbsp;
                                <span class="latestpost"><?php echo $date; ?></span>
                                <span class="latestpost">(<?php echo $time; ?>)</span>
                                </div>
                              </td>
                              <td class="topiclist-lastpost" valign="top">
                                <a class="lastpost-page-link" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&sp=JumpToLast">
                                  <span class="lastpost"><?php echo $lastpost_date; ?></span>
                                  <span class="lastpost">(<?php echo $lastpost_time; ?>)</span>
                                </a>
                                <br />
                                <span class="topiclist-row-writtenby">by:</span>
                                <a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['lastpost_author']; ?>"><?php echo $row['lastpost_author']; ?></a>&nbsp;
                              </td>
                              <td class="topiclist-replies" valign="top"><?php echo $row['posts']; ?></td>
                              <td class="topiclist-views" valign="top"><?php echo $row['views']; ?></td>
                            </tr>
                            <?php } ?>
                          </table>
                          <div class="topiclist-footer clearfix">
                            <?php
                              $sql = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
                              $row = mysqli_fetch_assoc($sql);

                              if($row['topics'] == 0) {
                            ?>
                            <input type="hidden" id="email-verfication-ok" value="1" />
                            <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                            <?php
                              } else if($row['topics'] == 1) {
                                $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND is_pending != '1' LIMIT 1");
                                if(mysqli_num_rows($check) > 0) {
                            ?>
                            <input type="hidden" id="email-verfication-ok" value="1" />
                            <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                            <?php
                                }
                              } else if($row['topics'] == 2) {
                                $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid='".$my_id."' AND groupid='".$groupid."' AND member_rank='2' AND is_pending <> '1' LIMIT 1");
                                if(mysqli_num_rows($check) > 0) {
                            ?>
                            <input type="hidden" id="email-verfication-ok" value="1" />
                            <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                            <?php
                                }
                              }
                            ?>
                            <div class="page-num-list">
                              View page:
                              <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                  if($page == $i) {
                                    echo $i;
                                  } else {
                              ?>
                              <a href="<?php echo $path; ?>forum.php?page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a>
                              <?php
                                  }
                                }
                              ?>
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                        <script type="text/javascript" language="JavaScript">
                          L10N.put('myhabbo.discussion.error.topic_name_empty', 'Topic title may not be empty');
                          Discussions.initialize('<?php echo $groupid; ?>', 'forum.php', null);
                        </script>
                      </div>
                    </div>
                  </div>
                </td>
                <td style="width: 4px;"></td>
                <td valign="top" style="width: 164px;">
                  <div class="habblet"></div>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <script type="text/javascript">
          Event.observe(window, 'load', observeAnim);
          document.observe('dom:loaded', initDraggableDialogs);
        </script>
      </div>
      <div id="footer">
        <p>
          <a href="<?php echo $path; ?>index.php" target="_self">Homepage</a> | 
          <a href="<?php echo $path; ?>disclaimer.php" target="_self">Terms of Service</a> | 
          <a href="<?php echo $path; ?>privacy.php" target="_self">Privacy Policy</a>
        </p>
        <?php /*@@* DO NOT EDIT OR REMOVE THE LINE BELOW WHATSOEVER! *@@*/ ?>
        <p>
          Powered by <a href="https://github.com/MiguelGonzalezAravena/HoloCMS" target="_blank">HoloCMS</a> &copy; 2016 Miguel González Aravena.<br />
        </p>
        <?php /*@@* DO NOT EDIT OR REMOVE THE LINE ABOVE WHATSOEVER! *@@*/ ?>
      </div>
    </div>
  </div>
  <div class="cbb topdialog black" id="dialog-group-settings">
    <div class="box-tabs-container">
      <ul class="box-tabs">
        <li class="selected" id="group-settings-link-group"><a href="#">Groepsinstellingen</a><span class="tab-spacer"></span></li>
        <li id="group-settings-link-forum"><a href="#">Foruminstellingen</a><span class="tab-spacer"></span></li>
        <li id="group-settings-link-room"><a href="#">Kamersettings</a><span class="tab-spacer"></span></li>
      </ul>
    </div>
    <a class="topdialog-exit" href="#" id="dialog-group-settings-exit">X</a>
    <div class="topdialog-body" id="dialog-group-settings-body">
      <p style="text-align:center"><img src="<?php echo $web_gallery; ?>images/progress_bubbles.gif" alt="" width="29" height="6" /></p>
    </div>
  </div>
  <script language="JavaScript" type="text/javascript">
    Event.observe('dialog-group-settings-exit', 'click', function(e) {
      Event.stop(e);
      closeGroupSettings();
    }, false);
  </script>
  <div class="cbb topdialog" id="postentry-verifyemail-dialog">
    <h2 class="title dialog-handle">Bevestig e-mailadres</h2>
    <a class="topdialog-exit" href="#" id="postentry-verifyemail-dialog-exit">X</a>
    <div class="topdialog-body" id="postentry-verifyemail-dialog-body">
      <p>Je moet je mailadres invullen voor je een reactie kunt plaatsen.</p>
      <p><a href="<?php echo $path; ?>profile.php?tab=3">Activeer je mailadres</a></p>
      <p class="clearfix">
        <a href="#" id="postentry-verifyemail-ok" class="new-button"><b>OK</b><i></i></a>
      </p>
    </div>
  </div>
  <script type="text/javascript">
    HabboView.run();
  </script>
  </body>
</html>
<?php
  } else {
    $pagename = 'Page not found';
    require_once(dirname(__FILE__) . '/templates/community/subheader.php');
    require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix red">
            <h2 class="title">Page not found!</h2>
            <div id="notfound-content" class="box-content">
              <p class="error-text">Sorry, but the page you were looking for was not found.</p>
              <img id="error-image" src="<?php echo $web_gallery; ?>v2/images/error.gif" />
              <p class="error-text">Please use the 'Back' button to get back to where you started.</p>
              <p class="error-text"><b>Search for group</b></p>
              <?php echo (!empty($searchString) ? '<p class="error-text">Sorry, but no results were found for <strong>\'' . $searchString . '\'.</strong></p>' : ''); ?>
              <p class="error-text">
                <form method="post">
                  Group Name:<br />
                  <input type="text" name="searchString" maxlength="25" size="25" value="<?php echo $searchString; ?>">
                  <input type="submit" class="submit" value="Submit">
                </form>
              </p>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <div id="column2" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix green">
            <h2 class="title">Were you looking for...</h2>
            <div id="notfound-looking-for" class="box-content">
              <p>
                <b>A friend's group or personal page?</b><br />
                See if it is listed on the <a href="<?php echo $path; ?>community.php">Community</a> page.
              </p>
              <p>
                <b>Rooms that rock?</b><br />
                Browse the <a href="<?php echo $path; ?>community.php">Recommended Rooms</a> list.
              </p>
              <p>
                <b>What other users are in to?</b><br />
                Check out the <a href="<?php echo $path; ?>tags.php">Top Tags</a> list.
              </p>
              <p>
                <b>How to get Credits?</b><br />
                Have a look at the <a href="<?php echo $path; ?>credits.php">Credits</a> page.
              </p>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
<?php
    require_once(dirname(__FILE__) . '/templates/community/footer.php'); 
  }
?>
