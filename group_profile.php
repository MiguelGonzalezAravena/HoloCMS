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

$edit_mode = false;
$found_profile = false;
$searchString = isset($_POST['searchString']) ? FilterText($_POST['searchString']) : '';
$groupid = isset($_GET['id']) ? (int) $_GET['id'] : 0;
$page = isset($_GET['page']) ? (int) $_GET['page'] : 0;
$do = isset($_GET['do']) ? FilterText($_GET['do']) : '';
$x = isset($_GET['x']) ? FilterText($_GET['x']) : '';

// Search function
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

if($do == 'edit' && $logged_in) {
  if($is_member && $member_rank > 1) {
    $edit_mode = true;
    $check = mysqli_query($connection, "SELECT * FROM cms_homes_group_linker WHERE userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    $linkers = mysqli_num_rows($check);
    if($linkers > 0) {
      mysqli_query($connection, "UPDATE cms_homes_group_linker SET active = '1', groupid = '{$groupid}' WHERE userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    } else {
      mysqli_query($connection, "INSERT INTO cms_homes_group_linker(userid, groupid, active) VALUES('{$my_id}', '{$groupid}', '1')") or die(mysqli_error($connection));
    }
  } else {
    $edit_mode = false;
    header('Location: group_profile.php?do=bounce&id=' . $groupid);
  }
} else {
  $edit_mode = false;
}

if(!$error) {
  $body_id = ($edit_mode) ? 'editmode' : 'viewmode';
} else {
  $body_id = 'home';
}

$pageid = 'profile';

if($groupdata['type'] != 1 && $is_member != true) {
  // If the group type is NOT exclusive/moderated, we have to delete any pending requests
  // this user has, simply because there's no longer need to put the user in the waiting list.
  $remove_pending = mysqli_query($connection, "DELETE FROM groups_memberships WHERE is_pending = '1' AND userid = '{$my_id}' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
}

$viewtools = '<div class="myhabbo-view-tools">';

if($logged_in && !$is_member && $groupdata['type'] != 2 && $my_membership['is_pending'] != 1) {
  $viewtools .= '<a href="' . $path . 'joingroup.php?groupId=' . $groupid . '" id="join-group-button">';
  $viewtools .= ($groupdata['type'] == 0 || $groupdata['type'] == 3) ? 'Join' : 'Request membership';
  $viewtools .= '</a>';
}

$viewtools .= ($logged_in && $my_membership['is_current'] != 1 && $is_member) ? '<a href="#" id="select-favorite-button">Make favourite</a>' : '';
$viewtools .= ($logged_in && $my_membership['is_current'] == 1 && $is_member) ? '<a href="#" id="deselect-favorite-button">Remove favourite</a>' : '';
$viewtools .= ($logged_in && $is_member && $my_id != $ownerid) ? '<a href="' . $path . 'leavegroup.php?groupId=' . $groupid . '" id="leave-group-button">Leave group</a>' : '';
$viewtools .= '</div>';


$bg_fetch = mysqli_query($connection, "SELECT data FROM cms_homes_stickers WHERE type = '4' AND groupid = '{$groupid}' LIMIT 1");
$bg_exists = mysqli_num_rows($bg_fetch);
  if($bg_exists < 1) { // if there's no background override for this user set it to the standard
    $bg = 'b_bg_pattern_abstract2';
  } else {
    $bg = mysqli_fetch_array($bg_fetch);
    $bg = 'b_' . $bg[0];
  }

if(!$error) {
  require_once(dirname(__FILE__) . '/templates/community/hsubheader.php');
  require_once(dirname(__FILE__) . '/templates/community/header.php');
  mysqli_query($connection, "UPDATE groups_details SET views = views + 1 WHERE id = '{$groupid}' LIMIT 1");
?>
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="mypage-wrapper" class="cbb blue">
        <div class="box-tabs-container box-tabs-left clearfix">
          <?php echo ($member_rank > 1 && !$edit_mode ? '<a href="#" id="myhabbo-group-tools-button" class="new-button dark-button edit-icon" style="float:left"><b><span></span>Edit</b><i></i></a>' : ''); ?>
          <?php echo (!$edit_mode ? $viewtools : ''); ?>
          <h2 class="page-owner">
            <?php echo HoloText($groupdata['name']); ?>&nbsp;
            <?php echo ($groupdata['type'] == 2 ? '<img src="' . $web_gallery . 'images/status_closed_big.gif" alt="Closed Group" title="Closed Group">' : ''); ?>
            <?php echo ($groupdata['type'] == 1 ? '<img src="' . $web_gallery . 'images/status_exclusive_big.gif" alt="Moderated Group" title="Moderated Group">' : ''); ?>
          </h2>
          <ul class="box-tabs">
            <li class="selected">
              <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>">Front Page</a>
              <span class="tab-spacer"></span>
            </li>
            <li>
              <a href="<?php echo $path; ?>group_forum.php?id=<?php echo $groupid; ?>">
                Discussion Forum
                <?php echo ($groupdata['pane'] > 0 ? '<img src="' . $web_gallery . 'images/grouptabs/privatekey.png">' : ''); ?>
              </a>
              <span class="tab-spacer"></span>
            </li>
          </ul>
        </div>
        <div id="mypage-content">
          <?php if($edit_mode == true) { ?>
          <div id="top-toolbar" class="clearfix">
            <ul>
              <li><a href="#" id="inventory-button">Inventory</a></li>
              <li><a href="#" id="webstore-button">Webstore</a></li>
            </ul>
            <form action="#" method="get" style="width: 50%;">
              <a id="cancel-button" class="new-button red-button cancel-icon" href="#"><b><span></span>Cancel</b><i></i></a>
              <a id="save-button" class="new-button green-button save-icon" href="#"><b><span></span>Save</b><i></i></a>
            </form>
          </div>
          <?php } ?>
          <div id="mypage-bg" class="<?php echo $bg; ?>">
            <div id="playground-outer">
              <div id="playground">
                <?php
                  $get_em = mysqli_query($connection, "SELECT id, type, x, y, z, data, skin, subtype, var FROM cms_homes_stickers WHERE groupid = '{$groupid}' and type < 4 LIMIT 200") or die(mysqli_error($connection));
                  while ($row = mysqli_fetch_assoc($get_em)) {
                    switch($row['type']) {
                      case 1:
                        $type = 'sticker';
                        break;
                      case 2:
                        $type = 'widget';
                        break;
                      case 3:
                        $type = 'stickie';
                        break;
                      case 4:
                        $type = 'ignore';
                        break;
                    }
                    if($type == 'stickie') {
                      $edit = ($edit_mode ? '<img src="' . $web_gallery . 'images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="' . $type . '-' . $row['id'] . '-edit" /><script language="JavaScript" type="text/javascript">Event.observe(\'' . $type . '-' . $row['id'] . '-edit\', \'click\', function(e) { openEditMenu(e, ' . $row['id'] . ', \'' . $type . '\', \'' . $type . '-' . $row['id'] . '-edit\'); }, false);</script>' : ' ');
                ?>
                <div class="movable stickie n_skin_<?php echo $row['skin']; ?>-c" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>" id="stickie-<?php echo $row['id']; ?>">
                  <div class="n_skin_<?php echo $row['skin']; ?>">
                    <div class="stickie-header">
                      <h3>
                        <?php echo $edit; ?>
                      </h3>
                      <div class="clear"></div>
                    </div>
                    <div class="stickie-body">
                      <div class="stickie-content">
                        <div class="stickie-markup"><?php echo HoloText($row['data'], true); ?></div>
                        <div class="stickie-footer"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php } else if($type == 'sticker') { ?>
                <div class="movable sticker s_<?php echo $row['data']; ?>" style="left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>" id="sticker-<?php echo $row['id']; ?>">
                  <?php echo $edit; ?>
                </div>
                <?php
                  } elseif($type == 'widget') {
                    switch($row['subtype']) {
                      case 1: 
                        $subtype = 'Profilewidget';
                        break;
                      case 3: 
                        $subtype = 'MemberWidget';
                        break;
                      case 4: 
                        $subtype = 'GuestbookWidget';
                        break;
                      case 5: 
                        $subtype = 'TraxPlayerWidget';
                        break;
                    }
                    if($subtype == 'Profilewidget') {
                      $found_profile = true;
                ?>
                <div class="movable widget GroupInfoWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                  <div class="w_skin_<?php echo $row['skin']; ?>">
                    <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                      <div class="widget-headline">
                        <h3>
                          <span class="header-left">&nbsp;</span>
                          <span class="header-middle">Group information</span>
                          <span class="header-right"><?php echo $edit; ?></span>
                        </h3>
                      </div>
                    </div>
                    <div class="widget-body">
                      <div class="widget-content">
                        <div class="group-info-icon">
                          <img src="<?php echo $path; ?>habbo-imaging/<?php echo (!empty($x) ? 'badge-fill/' . $groupdata['badge'] . '.gif' : 'badge.php?badge=' . $groupdata['badge']); ?> . '" />
                        </div>
                        <h4>
                          <?php echo HoloText($groupdata['name']); ?>
                        </h4>
                        <p>
                          Created: <strong><?php echo $groupdata['created']; ?></strong>
                        </p>
                        <p>
                          <strong><?php echo $members; ?></strong> members
                        </p>
                        <?php
                          if(empty($groupdata['roomid'])) {
                            $sql = mysqli_query($connection, "SELECT name FROM rooms WHERE id = '{$groupdata['roomid']}' LIMIT 1");
                            $roominfo = mysqli_fetch_assoc($sql);
                            if($groupdata['roomid'] != 0) {
                        ?>
                        <p>
                          <a href="<?php echo $path; ?>client.php?forwardId=2&amp;roomId=<?php echo $groupdata['roomid']; ?>" onclick="HabboClient.roomForward(this, '<?php echo $groupdata['roomid']; ?>', 'private'); return false;" target="client" class="group-info-room">
                            <?php echo HoloText($roominfo['name']); ?>
                          </a>
                        </p>
                        <?php
                            }
                          }
                        ?>
                        <div class="group-info-description"><?php echo HoloText($groupdata['description']); ?></div>
                        <script type="text/javascript">
                          document.observe('dom:loaded', function() {
                              new GroupInfoWidget('<?php echo $groupid; ?>', '<?php echo $row['id']; ?>');
                          });
                        </script>
                        <div class="clear"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php } elseif($subtype == 'MemberWidget') { ?>
                <div class="movable widget MemberWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                  <div class="w_skin_<?php echo $row['skin']; ?>">
                    <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                      <div class="widget-headline">
                        <h3>
                          <span class="header-left">&nbsp;</span>
                          <span class="header-middle">Members of this group (<span id="avatar-list-size"><?php echo $members; ?></span>)</span>
                          <span class="header-right"><?php echo $edit; ?></span>
                        </h3>
                      </div>
                    </div>
                    <div class="widget-body">
                      <div class="widget-content">
                        <div id="avatar-list-search">
                          <input type="text" style="float:left;" id="avatarlist-search-string" />
                          <a class="new-button" style="float:left;" id="avatarlist-search-button"><b>Search</b><i></i></a>
                        </div>
                        <br clear="all"/>
                        <div id="avatarlist-content">
                          <?php
                            $bypass = true;
                            $widgetid = $row['id'];
                            require_once(dirname(__FILE__) . '/myhabbo/avatarlist_membersearchpaging.php');
                          ?>
                          <script type="text/javascript">
                            document.observe('dom:loaded', function() {
                              window.widget<?php echo $row['id']; ?> = new MemberWidget('<?php echo $groupid; ?>', '<?php echo $row['id']; ?>');
                            });
                          </script>
                        </div>
                        <div class="clear"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php
                  } elseif($subtype == 'GuestbookWidget') {
                    $sql = mysqli_query($connection, "SELECT * FROM cms_guestbook WHERE widget_id = '{$row['id']}' ORDER BY id DESC");
                    $count = mysqli_num_rows($sql);
                    $status = 'private';
                    /*
                    if($row['10'] == 0) {;
                      $status = "public";
                    } else {
                      $status = "private";
                    }
                    */
                ?>
                <div class="movable widget GuestbookWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                  <div class="w_skin_<?php echo $row['skin']; ?>">
                    <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                      <div class="widget-headline">
                        <h3>
                          <?php echo $edit; ?>
                          <span class="header-left">&nbsp;</span>
                          <span class="header-middle">
                            My Guestbook(<span id="guestbook-size"><?php echo $count; ?></span>)
                            <span id="guestbook-type" class="<?php echo $status; ?>">
                              <img src="<?php echo $web_gallery; ?>images/groups/status_exclusive.gif" title="Friends only" alt="Friends only"/>
                            </span>
                          </span>
                          <span class="header-right">&nbsp;</span>
                        </h3>
                      </div>
                    </div>
                    <div class="widget-body">
                      <div class="widget-content">
                        <div id="guestbook-wrapper" class="gb-public">
                          <ul class="guestbook-entries" id="guestbook-entry-container">
                            <?php if($count == 0) { ?>
                            <div id="guestbook-empty-notes">This guestbook has no entries.</div>
                            <?php
                              } else {
                                $sql123 = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
                                $grouprrow = mysqli_fetch_assoc($sql123);
                                $i = 0;
                                while ($row1 = mysqli_fetch_assoc($sql)) {
                                  $i++;
                                  $userrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row1['userid']}' LIMIT 1"));
                                  $owneronly = '';
                                  if($my_id == $row1['userid']) {
                                    $owneronly = '<img src="' . $web_gallery . 'images/myhabbo/buttons/delete_entry_button.gif" id="gbentry-delete-' . $row1['id'] . '" class="gbentry-delete" style="cursor:pointer" alt=""/><br />';
                                  } elseif($grouprrow['ownerid'] == $my_id) {
                                    $owneronly = '<img src="' . $web_gallery . 'images/myhabbo/buttons/delete_entry_button.gif" id="gbentry-delete-' . $row1['id'] . '" class="gbentry-delete" style="cursor:pointer" alt=""/><br />';
                                  }

                                  $useronline = (IsUserOnline($row1['userid'])) ? 'online' : 'offline';
                            ?>
                            <li id="guestbook-entry-<?php echo $row1['id']; ?>" class="guestbook-entry">
                              <div class="guestbook-author">
                                <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userrow['figure']; ?>&direction=2&head_direction=2&gesture=sml&size=s" alt="<?php echo $userrow['name']; ?>" title="<?php echo $userrow['name']; ?>"/>
                              </div>
                              <div class="guestbook-actions">
                                <?php echo $owneronly; ?>
                              </div>
                              <div class="guestbook-message">
                                <div class="<?php echo $useronline; ?>">
                                  <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $userrow['name']; ?>"><?php echo $userrow['name']; ?></a>
                                </div>
                                <p><?php echo HoloText($row1['message'], true); ?></p>
                              </div>
                              <div class="guestbook-cleaner">&nbsp;</div>
                              <div class="guestbook-entry-footer metadata"><?php echo $userrow['time']; ?></div>
                            </li>
                            <?php
                                }
                              }
                            ?>
                          </ul>
                        </div>
                        <?php if($edit_mode == false) { ?>
                        <div class="guestbook-toolbar clearfix">
                          <a href="#" class="new-button envelope-icon" id="guestbook-open-dialog">
                            <b><span></span>Post new message</b><i></i>
                          </a>
                        </div>
                        <?php } ?>
                        <script type="text/javascript">
                          document.observe('dom:loaded', function() {
                            var gb<?php echo $row['id']; ?> = new GuestbookWidget('17570', '<?php echo $row['id']; ?>', 500);
                            var editMenuSection = $('guestbook-privacy-options');
                            if(editMenuSection) {
                              gb<?php echo $row['id']; ?>.updateOptionsList('public');
                            }
                          });
                        </script>
                        <div class="clear"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php
                  } elseif($subtype == 'TraxPlayerWidget') { 
                    $sql123 = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
                    $grouprrow = mysqli_fetch_assoc($sql123);
                ?>
                <div class="movable widget TraxPlayerWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                  <div class="w_skin_<?php echo $row['skin']; ?>">
                    <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                      <div class="widget-headline">
                        <h3>
                          <?php echo $edit; ?>
                          <span class="header-left">&nbsp;</span>
                          <span class="header-middle">TRAXPLAYER</span>
                          <span class="header-right">&nbsp;</span>
                        </h3>
                      </div>
                    </div>
                    <div class="widget-body">
                      <div class="widget-content">
                        <?php
                          $songselected = (empty($row['var'])) ? false : true;
                          if($edit_mode == true) {
                        ?>
                        <div id="traxplayer-content" style="text-align: center;">
                          <img src="<?php echo $web_gallery; ?>images/traxplayer/player.png" />
                        </div>
                        <div id="edit-menu-trax-select-temp" style="display:none">
                          <select id="trax-select-options-temp">
                            <option value="">-Choose song-</option>
                            <?php
                              $mysql = mysqli_query($connection, "SELECT * FROM furniture WHERE ownerid = '{$grouprrow['ownerid']}'");
                              $i = 0;
                              while($machinerow = mysqli_fetch_assoc($mysql)) {
                                $i++;
                                $sql = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE machineid = '{$machinerow['id']}'");
                                $n = 0;
                                while($songrow = mysqli_fetch_assoc($sql)) {
                                  $n++;
                                  echo (!empty($songrow['id']) ? '<option value="' . $songrow['id'] . '">' . HoloText($songrow['title']) . '</option>' : '');
                                }
                              }
                            ?>
                          </select>
                        </div>
                        <?php } else if($songselected == false) { ?>
                        You do not have a selected Trax song.
                        <?php } else {
                          $sql1 = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE id = '{$row['var']}' LIMIT 1");
                          $songrow1 = mysqli_fetch_assoc($sql);
                        ?>
                        <div id="traxplayer-content" style="text-align:center;"></div>
                        <embed type="application/x-shockwave-flash" src="<?php echo $web_gallery; ?>flash/traxplayer/traxplayer.swf" name="traxplayer" quality="high" base="<?php echo $web_gallery; ?>flash/traxplayer/" allowscriptaccess="always" menu="false" wmode="transparent" flashvars="songUrl=<?php echo $path; ?>myhabbo/trax_song.php?songId=<?php echo $row['var']; ?>&amp;sampleUrl=http://images.habbohotel.com/dcr/hof_furni//mp3/" height="66" width="210" />
                        <?php } ?>
                        <div class="clear"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php
                      }
                    }
                  }

                  if(!$found_profile) {
                    mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, x, y, z, skin) VALUES('-1', '{$groupid}', '2', '1', '25', '25', '5', 'defaultskin')") or die(mysqli_error($connection));
                ?>
                <div class="movable widget GroupInfoWidget" id="widget-".$row['id']."" style=" left: 25px; top: 25px; z-index: 5;">
                  <div class="w_skin_defaultskin">
                    <div class="widget-corner" id="widget-1994412-handle">
                      <div class="widget-headline">
                        <h3>
                          <span class="header-left">&nbsp;</span>
                          <span class="header-middle">Group information</span>
                          <span class="header-right">&nbsp;</span>
                        </h3>
                      </div>
                    </div>
                    <div class="widget-body">
                      <div class="widget-content">
                        <div class="group-info-icon">
                          <img src="<?php echo $path; ?>habbo-imaging/badge-fill/<?php echo $groupdata['badge']; ?>.gif" />
                        </div>
                        <h4>
                          <?php echo HoloText($groupdata['name']); ?>
                        </h4>
                        <p>
                          Created: <strong><?php echo $groupdata['created']; ?></strong>
                        </p>
                        <p>
                          <strong><?php echo $members; ?></strong> members
                        </p>
                        <?php // <p><a href="http://www.habbo.nl/client?forwardId=2&amp;roomId=13303122" onclick="roomForward(this, '13303122', 'private'); return false;" target="client" class="group-info-room">The church of bobbaz</a></p> ?>
                        <div class="group-info-description">
                          <?php echo HoloText($groupdata['description']); ?>
                        </div>
                        <script type="text/javascript">
                          document.observe('dom:loaded', function() {
                              new GroupInfoWidget('55918', '1478728');
                          });
                        </script>
                        <div class="clear"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div id="mypage-ad">
              <div class="habblet">
                <div class="ad-container">
                  &nbsp;
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script language="JavaScript" type="text/javascript">
        initEditToolbar();
        initMovableItems();
        document.observe('dom:loaded', initDraggableDialogs);
      </script>
      <div id="edit-save" style="display:none;"></div>
    </div>
    <div id="footer">
      <p>
        <a href="<?php echo $path; ?>index.php" target="_self">Homepage</a> | 
        <a href="<?php echo $path; ?>disclaimer.php" target="_self">Terms of Service</a> | 
        <a href="<?php echo $path; ?>privacy.php" target="_self">Privacy Policy</a>
      </p>
      <?php /*@@* DO NOT EDIT OR REMOVE THE LINE BELOW WHATSOEVER! *@@*/ ?>
        <p>
          Powered by <a href="https://github.com/MiguelGonzalezAravena/HoloCMS" target="_blank">HoloCMS</a> &copy; 2016 Miguel González Aravena.
        </p>
      <?php /*@@* DO NOT EDIT OR REMOVE THE LINE ABOVE WHATSOEVER! *@@*/ ?>
    </div>
  </div>
</div>
<?php if($edit_mode) { ?>
  <div id="edit-menu" class="menu">
    <div class="menu-header">
      <div class="menu-exit" id="edit-menu-exit">
        <img src="<?php echo $web_gallery; ?>images/dialogs/menu-exit.gif" alt="" width="11" height="11" />
      </div>
      <h3>Edit</h3>
    </div>
    <div class="menu-body">
      <div class="menu-content">
        <form action="#" onsubmit="return false;">
          <div id="edit-menu-skins">
            <select id="edit-menu-skins-select">
              <option value="1" id="edit-menu-skins-select-defaultskin">Default</option>
              <option value="6" id="edit-menu-skins-select-goldenskin">Golden</option>
              <?php echo (IsHCMember($my_id) ? '<option value="8" id="edit-menu-skins-select-hc_pillowskin">HC Bling</option><option value="7" id="edit-menu-skins-select-hc_machineskin">HC Scifi</option>' : ''); ?>
              <?php echo ($user_rank > 5 ? '<option value="9" id="edit-menu-skins-select-nakedskin">Staff - Naked Skin</option>' : ''); ?>
              <option value="3" id="edit-menu-skins-select-metalskin">Metal</option>
              <option value="5" id="edit-menu-skins-select-notepadskin">Notepad</option>
              <option value="2" id="edit-menu-skins-select-speechbubbleskin">Speech Bubble</option>
              <option value="4" id="edit-menu-skins-select-noteitskin">Stickie Note</option>
            </select>
          </div>
          <div id="edit-menu-stickie">
            <p>Warning! If you click 'Remove', the note will be permanently deleted.</p>
          </div>
          <div id="rating-edit-menu">
            <input type="button" id="ratings-reset-link" value="Reset rating" />
          </div>
          <div id="highscorelist-edit-menu" style="display:none">
            <select id="highscorelist-game">
              <option value="">Select game</option>
              <option value="1">Battle Ball: Rebound!</option>
              <option value="2">SnowStorm</option>
              <option value="0">Wobble Squabble</option>
            </select>
          </div>
          <div id="edit-menu-remove-group-warning">
            <p>This item belongs to another user. If you remove it, it will return to their inventory.</p>
          </div>
          <div id="edit-menu-gb-availability">
            <select id="guestbook-privacy-options">
              <option value="private">Members only</option>
              <option value="public">Public</option>
            </select>
          </div>
          <div id="edit-menu-trax-select">
            <select id="trax-select-options"></select>
          </div>
          <div id="edit-menu-remove">
            <input type="button" id="edit-menu-remove-button" value="Remove" />
          </div>
        </form>
        <div class="clear"></div>
      </div>
    </div>
    <div class="menu-bottom"></div>
  </div>
  <script language="JavaScript" type="text/javascript">
    Event.observe(window, 'resize', function() {
      if(editMenuOpen) {
        closeEditMenu();
      }
    }, false);
    Event.observe(document, 'click', function() {
      if(editMenuOpen) {
        closeEditMenu();
      }
    }, false);
    Event.observe('edit-menu', 'click', Event.stop, false);
    Event.observe('edit-menu-exit', 'click', function() {
      closeEditMenu();
    }, false);
    Event.observe('edit-menu-remove-button', 'click', handleEditRemove, false);
    Event.observe('edit-menu-skins-select', 'click', Event.stop, false);
    Event.observe('edit-menu-skins-select', 'change', handleEditSkinChange, false);
    Event.observe('guestbook-privacy-options', 'click', Event.stop, false);
    Event.observe('guestbook-privacy-options', 'change', handleGuestbookPrivacySettings, false);
    Event.observe('trax-select-options', 'click', Event.stop, false);
    Event.observe('trax-select-options', 'change', handleTraxplayerTrackChange, false);
  </script>
<?php } else { ?>
  <div class="cbb topdialog" id="guestbook-form-dialog">
    <h2 class="title dialog-handle">Edit guestbook entry</h2>
    <a class="topdialog-exit" href="#" id="guestbook-form-dialog-exit">X</a>
    <div class="topdialog-body" id="guestbook-form-dialog-body">
      <div id="guestbook-form-tab">
        <form method="post" id="guestbook-form">
          <p>
            Note: messages cannot be more than 200 characters
            <input type="hidden" name="ownerId" value="441794" />
          </p>
          <div>
            <textarea cols="15" rows="5" name="message" id="guestbook-message"></textarea>
            <script type="text/javascript">
              bbcodeToolbar = new Control.TextArea.ToolBar.BBCode('guestbook-message');
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
              bbcodeToolbar.addColorSelect('Colours', colors, true);
            </script>
          </div>
          <div class="guestbook-toolbar clearfix">
            <a href="#" class="new-button" id="guestbook-form-cancel"><b>Cancel</b><i></i></a>
            <a href="#" class="new-button" id="guestbook-form-preview"><b>Preview</b><i></i></a>
          </div>
        </form>
      </div>
      <div id="guestbook-preview-tab">&nbsp;</div>
    </div>
  </div>
  <div class="cbb topdialog" id="guestbook-delete-dialog">
    <h2 class="title dialog-handle">Delete entry</h2>
    <a class="topdialog-exit" href="#" id="guestbook-delete-dialog-exit">X</a>
    <div class="topdialog-body" id="guestbook-delete-dialog-body">
      <form method="post" id="guestbook-delete-form">
        <input type="hidden" name="entryId" id="guestbook-delete-id" value="" />
        <p>Are you sure you want to delete this entry?</p>
        <p>
          <a href="#" id="guestbook-delete-cancel" class="new-button"><b>Cancel</b><i></i></a>
          <a href="#" id="guestbook-delete" class="new-button"><b>Delete</b><i></i></a>
        </p>
      </form>
    </div>
  </div>
  <div id="group-tools" class="bottom-bubble">
    <div class="bottom-bubble-t">
      <div></div>
    </div>
    <div class="bottom-bubble-c">
      <h3>Edit group</h3>
      <ul>
        <li><a href="group_profile.php?id=<?php echo $groupid; ?>&do=edit" id="group-tools-style">Modify page</a></li>
        <?php echo ($ownerid == $my_id ? '<li><a href="#" id="group-tools-settings">Settings</a></li>' : ''); ?>
        <li><a href="#" id="group-tools-badge">Badge</a></li>
        <li><a href="#" id="group-tools-members">Members</a></li>
      </ul>
    </div>
    <div class="bottom-bubble-b">
      <div></div>
    </div>
  </div>
  <div class="cbb topdialog black" id="dialog-group-settings">
    <div class="box-tabs-container">
      <ul class="box-tabs">
        <li class="selected" id="group-settings-link-group"><a href="#">Group settings</a><span class="tab-spacer"></span></li>
        <li id="group-settings-link-forum"><a href="#">Forum Settings</a><span class="tab-spacer"></span></li>
        <li id="group-settings-link-room"><a href="#">Room Settings</a><span class="tab-spacer"></span></li>
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
  <div class="cbb topdialog black" id="group-memberlist">
    <div class="box-tabs-container">
      <ul class="box-tabs">
        <li class="selected" id="group-memberlist-link-members"><a href="#">Members</a><span class="tab-spacer"></span></li>
        <li id="group-memberlist-link-pending"><a href="#">Pending members</a><span class="tab-spacer"></span></li>
      </ul>
    </div>
    <a class="topdialog-exit" href="#" id="group-memberlist-exit">X</a>
    <div class="topdialog-body" id="group-memberlist-body">
      <div id="group-memberlist-members-search" class="clearfix" style="display:none">
        <a id="group-memberlist-members-search-button" href="#" class="new-button"><b>Search</b><i></i></a>
        <input type="text" id="group-memberlist-members-search-string" />
      </div>
      <div id="group-memberlist-members" style="clear: both"></div>
      <div id="group-memberlist-members-buttons" class="clearfix">
        <a href="#" class="new-button group-memberlist-button-disabled" id="group-memberlist-button-give-rights"><b>Give rights</b><i></i></a>
        <a href="#" class="new-button group-memberlist-button-disabled" id="group-memberlist-button-revoke-rights"><b>Revoke rights</b><i></i></a>
        <a href="#" class="new-button group-memberlist-button-disabled" id="group-memberlist-button-remove"><b>Remove</b><i></i></a>
        <a href="#" class="new-button group-memberlist-button" id="group-memberlist-button-close"><b>Close</b><i></i></a>
      </div>
      <div id="group-memberlist-pending" style="clear: both"></div>
      <div id="group-memberlist-pending-buttons" class="clearfix">
        <a href="#" class="new-button group-memberlist-button-disabled" id="group-memberlist-button-accept"><b>Accept</b><i></i></a>
        <a href="#" class="new-button group-memberlist-button-disabled" id="group-memberlist-button-decline"><b>Reject</b><i></i></a>
        <a href="#" class="new-button group-memberlist-button" id="group-memberlist-button-close2"><b>Close</b><i></i></a>
      </div>
    </div>
  </div>
<?php } ?>
  <script type="text/javascript">
    HabboView.run();
  </script>
  <?php echo $analytics; ?>
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
                See if it is listed on the <a href="community.php">Community</a> page.
              </p>
              <p>
                <b>Rooms that rock?</b><br />
                Browse the <a href="community.php">Recommended Rooms</a> list.
              </p>
              <p>
                <b>What other users are in to?</b><br />
                Check out the <a href="tags.php">Top Tags</a> list.
              </p>
              <p>
                <b>How to get Credits?</b><br />
                Have a look at the <a href="credits.php">Credits</a> page.
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