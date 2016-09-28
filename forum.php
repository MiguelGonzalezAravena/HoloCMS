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

$page = isset($_GET['page']) ? (int) $_GET['page'] : 0;
$pagename = 'Discussion Board';
$pageid = 'forum';
$body_id = 'viewmode';

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');


$threads = mysqli_evaluate("SELECT COUNT(*) FROM cms_forum_threads WHERE forumid = '0'");
$pages = ceil(($threads + 0) / 10);
$page = ($page > $pages || $page < 1) ? 1 : $page;
$key = 0;
?>
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="mypage-wrapper" class="cbb blue">
        <div class="box-tabs-container box-tabs-left clearfix">
          <div class="myhabbo-view-tools">
          </div>
          <h2 class="page-owner">Discussion Board</h2>
          <ul class="box-tabs">
            <li class="selected">
              <a href="<?php echo $path; ?>forum.php">Discussion Board</a>
              <span class="tab-spacer"></span>
            </li>
          </ul>
        </div>
        <div id="mypage-content">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" class="content-1col">
            <tr>
              <td valign="top" style="width: 750px;" class="habboPage-col rightmost">
                <div id="discussionbox">
                  <div id="group-topiclist-container">
                    <div class="topiclist-header clearfix">
                      <input type="hidden" id="email-verfication-ok" value="1" />
                      <?php echo ($logged_in ? '<a href="#" id="newtopic-upper" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : ''); ?>
                      <div class="page-num-list">
                        View page:
                        <?php
                          for ($i = 1; $i <= $pages; $i++) {
                            if($page == $i) {
                              echo $i . "\n";
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

                        $sql = mysqli_query($connection, "SELECT * FROM cms_forum_threads WHERE type > 2 AND forumid = '0' ORDER BY unix DESC") or die(mysqli_error($connection));
                        $stickies = mysqli_num_rows($sql);
                        $query_min = ($page * 10) - 10;
                        $query_max = 10;
                        $query_max = $query_max - $stickies;
                        $query_min = $query_min - $stickies;
                        $query_min = ($query_min < 0) ? 0 : $query_min;
                        while($row = mysqli_fetch_assoc($sql)) {
                          $key++;
                          $date_bits = explode(' ', $row['date']);
                          $date = $date_bits[0];
                          $time = $date_bits[1];
                          $lastpost_date_bits = explode(' ', $row['lastpost_date']);
                          $lastpost_date = $lastpost_date_bits[0];
                          $lastpost_time = $lastpost_date_bits[1];
                          $x = (IsEven($key)) ? 'odd' : 'even';
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
                            <span><a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['author']; ?>"><?php echo $row['author']; ?></a></span>
                            &nbsp;<span class="latestpost"><?php echo $date; ?></span>
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

                        $sql = mysqli_query($connection, "SELECT * FROM cms_forum_threads WHERE type < 3 AND forumid='0' ORDER BY unix DESC LIMIT {$query_min}, {$query_max}") or die(mysqli_error($connection));
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
                            <span><a class="topiclist-row-openername" href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['author']; ?>"><?php echo $row['author']; ?></a></span>
                            &nbsp;<span class="latestpost"><?php echo $date; ?></span>
                            <span class="latestpost">(<?php echo $time; ?>)</span>
                          </div>
                        </td>
                        <td class="topiclist-lastpost" valign="top">
                          <a class="lastpost-page-link" href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>&sp=JumpToLast">
                            <span class="lastpost"><?php echo $lastpost_date; ?></span>
                            <span class="lastpost">(<?php echo $lastpost_time; ?>)</span></a>
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
                      <?php echo ($logged_in ? '<a href="#" id="newtopic-lower" class="new-button verify-email newtopic-icon" style="float:left"><b><span></span>New Thread</b><i></i></a>' : 'You must be logged in to reply or post new threads.'); ?>
                      <div class="page-num-list">
                        View page:
                        <?php
                          for ($i = 1; $i <= $pages; $i++) {
                            if($page == $i) {
                              echo $i . "\n";
                            } else {
                        ?>
                        <a href="<?php echo $path; ?>forum.php?page=<?php echo $i; ?>" class="topiclist-page-link"><?php echo $i; ?></a>
                        <?php
                            }
                          }
                        ?>
                      </div>
                    </div>
                  </div>
                  <script type="text/javascript" language="JavaScript">
                    L10N.put('myhabbo.discussion.error.topic_name_empty', 'Topic title may not be empty');
                    Discussions.initialize('0', 'forum.php', null);
                  </script>
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
        <a href="<?php echo $path; ?>privacy.php" target="_self">Privacy Policy</a></p>
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