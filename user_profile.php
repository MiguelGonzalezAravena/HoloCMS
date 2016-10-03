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
$allow_guests = true;

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

$id = (isset($_GET['id']) ? (int) $_GET['id'] : (isset($_POST['id']) ? (int) $_POST['id'] : 0));
$tag = (isset($_GET['tag']) ? FilterText($_GET['tag']) : (isset($_GET['tagid']) ? FilterText($_GET['tagid']) : ''));
$username = (isset($_GET['name']) ? FilterText($_GET['name']) : (isset($_POST['name']) ? FilterText($_POST['name']) : ''));
$do = isset($_GET['do']) ? FilterText($_GET['do']) : '';
$edit_mode = false;
$found_profile = false;
$edit = '';
$searchname = '';
$guestbook_status = 'private';

if(!empty($tag) || !empty($username) || !empty($id)) {
  if(!empty($tag)) {
    $searchname = $tag;
  } else if(!empty($username)) {
    $searchname = $username;
  } else if(!empty($id)) {
    $request = mysqli_query($connection, "SELECT name FROM users WHERE id = {$id}");
    $rows = mysqli_num_rows($request);
    if($rows > 0) {
      $row = mysqli_fetch_assoc($request);
      $searchname = $row['name'];
    } else {
      $error = true;
    }
  } else {
    $error = true;
  }

  $user_sql = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$searchname}' LIMIT 1") or die(mysqli_error($connection));
  $user_exists = mysqli_num_rows($user_sql);

  if($user_exists == 1) {
    $error = false;
    $user_row = mysqli_fetch_assoc($user_sql);
    $pagename = 'User Profile - ' . $user_row['name'];
    if($user_row['rank'] == 6) {
      $drank = 'Administrator';
    } else if($user_row['rank'] == 5) {
      $drank = 'Moderator';
    } else if($user_row['rank'] == 4) {
      $drank = 'Staff Member';
    } else if($user_row['rank'] < 4) {
      $drank = 'Member';
    }
  } else {
    $error = true;
  }
} else if(!empty($tagid) || !empty($id)) {
  if(!empty($tagid)) {
    $searchid = $tag;
  } else if(!empty($id)) {
    $searchid = $id;
  } else {
    $error = true;
  }

  $user_sql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$searchid}' LIMIT 1") or die(mysqli_error($connection));
  $user_exists = mysqli_num_rows($user_sql);

  if($user_exists == 1) {
    $error = false;
    $user_row = mysqli_fetch_assoc($user_sql);
    $pagename = 'User Profile - ' . $user_row['name'];
    if($user_row['rank'] == 6) {
      $drank = 'Administrator';
    } else if($user_row['rank'] == 5) {
      $drank = 'Moderator';
    } else if($user_row['rank'] == 4) {
      $drank = 'Staff Member';
    } else if($user_row['rank'] < 4) {
      $drank = 'Member';
    }
  } else {
    $error = true;
  }
} else {
  $error = true;
}

if($do == 'edit' && $logged_in) {
  if($user_row['name'] == $username) {
    $edit_mode = true;
    mysqli_query($connection, "UPDATE cms_homes_group_linker SET active = '0' WHERE userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
  } else {
    $edit_mode = false;
    header('Location: user_profile.php?do=bounce&name=' . $user_row['name']);
  }
} else {
  $edit_mode = false;
}

if(!$error && !IsUserBanned($user_row['id'])) {
  $body_id = ($edit_mode) ? 'editmode' : 'viewmode';
} else {
  $body_id = 'home';
}

$pageid = ($searchname == $rawname && $logged_in) ? 'myprofile' : 'profile';

if(!isset($user_row)) {
  $user_row = 0;
}

$bg_fetch = mysqli_query($connection, "SELECT data FROM cms_homes_stickers WHERE type = '4' AND userid = '{$user_row['id']}' AND groupid = '-1' LIMIT 1");
$bg_exists = mysqli_num_rows($bg_fetch);

if($bg_exists < 1) { // if there's no background override for this user set it to the standard
  $bg = 'b_bg_pattern_abstract2';
} else {
  $bg = mysqli_fetch_array($bg_fetch);
  $bg = 'b_' . $bg[0];
}

if(!$error && !IsUserBanned($user_row['id'])) {
  require_once(dirname(__FILE__) . '/templates/community/hsubheader.php');
  require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
<div id="container">
  <div id="content" style="position: relative" class="clearfix">
    <div id="mypage-wrapper" class="cbb blue">
      <div class="box-tabs-container box-tabs-left clearfix">
        <?php echo ($user_row['name'] == $username && $edit_mode ? '<a href="' . $path . 'user_profile.php?do=edit&name=' . $username . '" id="edit-button" class="new-button dark-button edit-icon" style="float:left"><b><span></span>Modify</b><i></i></a>' : ''); ?>
        <h2 class="page-owner"><?php echo $user_row['name']; ?></h2>
        <ul class="box-tabs"></ul>
      </div>
      <div id="mypage-content">
        <?php if($edit_mode) { ?>
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
                $get_em = mysqli_query($connection, "SELECT id, type, x, y, z, data, skin, subtype, var FROM cms_homes_stickers WHERE userid = '{$user_row['id']}' AND groupid = '-1' AND type < 4 LIMIT 200") or die(mysqli_error($connection));
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
                    default:
                      $type = 'sticker';
                      break;
                  }
                  if($edit_mode == true) {
                    $edit = '<img src="' . $web_gallery . 'images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="' . $type . '-' . $row['id'] . '-edit" />
                    <script language="JavaScript" type="text/javascript">
                      Event.observe(\'' . $type . '-' . $row['id'] . '-edit\', \'click\', function(e) { openEditMenu(e, ' . $row['id'] . ', \''.$type.'\', \'' . $type . '-' . $row['id'] . '-edit\'); }, false);
                    </script>';
                  }

                  $content = HoloText($row['data'], true);

                  if($type == 'stickie') {
              ?>
              <div class="movable stickie n_skin_<?php echo $row['skin']; ?>-c" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;" id="stickie-<?php echo $row['id']; ?>">
                <div class="n_skin_<?php echo $row['skin']; ?>">
                  <div class="stickie-header">
                    <h3>
                      <?php echo $edit; ?>
                    </h3>
                    <div class="clear"></div>
                  </div>
                  <div class="stickie-body">
                    <div class="stickie-content">
                      <div class="stickie-markup"><?php echo $content; ?></div>
                      <div class="stickie-footer">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <?php } else if($type == 'sticker') { ?>
              <div class="movable sticker s_<?php echo $row['data']; ?>" style="left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>" id="sticker-<?php echo $row['id']; ?>"><?php echo $edit; ?></div>
              <?php
                } else if($type == 'widget') {
                  switch($row['subtype']) {
                    case 1:
                      $subtype = 'Profilewidget';
                      break;
                    case 2:
                      $subtype = 'GroupsWidget';
                      break;
                    case 3:
                      $subtype = 'RoomsWidget';
                      break;
                    case 4:
                      $subtype = 'GuestbookWidget';
                      break;
                    case 5:
                      $subtype = 'FriendsWidget';
                      break;
                    case 6:
                      $subtype = 'TraxPlayerWidget';
                      break;
                    case 7:
                      $subtype = 'HighScoresWidget';
                      break;
                    case 8:
                      $subtype = 'BadgesWidget';
                  }

                  if($subtype == "GroupsWidget") {
                    $groups = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE userid = '{$user_row['id']}' AND is_pending = '0' LIMIT 1");
              ?>
              <div class="movable widget GroupsWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                <div class="w_skin_<?php echo $row['skin']; ?>">
                  <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                    <div class="widget-headline">
                      <h3>
                        <span class="header-left">&nbsp;</span>
                        <span class="header-middle">MY GROUPS (<span id="groups-list-size"><?php echo $groups; ?></span>)</span>
                        <span class="header-right"><?php echo $edit; ?></span>
                      </h3>
                    </div>
                  </div>
                  <div class="widget-body">
                    <div class="widget-content"> 
                      <div class="groups-list-container">
                        <ul class="groups-list">
                          <?php
                            $get_groups = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$user_row['id']}' AND is_pending = '0'") or die(mysqli_error($connection));
                            while($membership_row = mysqli_fetch_assoc($get_groups)) {
                              $get_groupdata = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$membership_row['groupid']}' LIMIT 1") or die(mysqli_error($connection));
                              $grouprow = mysqli_fetch_assoc($get_groupdata);
                          ?>
                          <li title="<?php echo $grouprow['name']; ?>" id="groups-list-<?php echo $row['id']; ?>-<?php echo $grouprow['id']; ?>">
                            <div class="groups-list-icon">
                              <a href="group_profile.php?id=<?php echo $grouprow['id']; ?>">
                                <img src="<?php echo $path; ?>habbo-imaging/badge-fill/<?php echo $grouprow['badge']; ?>.gif" />
                              </a>
                            </div>
                            <div class="groups-list-open"></div>
                            <h4>
                              <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $membership_row['groupid']; ?>"><?php echo $grouprow['name']; ?></a>
                            </h4>
                            <p>
                              Group created:<br />
                              <?php echo ($membership_row['is_current'] == 1 ? '<div class="favourite-group" title="Favourite"></div>' : ''); ?>
                              <?php echo ($membership_row['member_rank'] > 1 && $grouprow['ownerid'] != $user_row['id'] ? '<div class="admin-group" title="Admin"></div>' : ''); ?>
                              <?php echo ($grouprow['ownerid'] == $user_row['id'] && $membership_row['member_rank'] > 1 ? '<div class="owned-group" title="Owner"></div>' : ''); ?>
                              <b><?php echo $grouprow['created']; ?></b>
                            </p>
                            <div class="clear"></div>
                          </li>
                          <?php } ?>
                        </ul>
                      </div>
                      <div class="groups-list-loading">
                        <div>
                          <a href="#" class="groups-loading-close"></a>
                        </div>
                        <div class="clear"></div>
                        <p style="text-align:center">
                          <img src="<?php echo $web_gallery; ?>images/progress_bubbles.gif" alt="" width="29" height="6" />
                        </p>
                      </div>
                      <div class="groups-list-info"></div>
                      <div class="clear"></div>
                    </div>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                document.observe('dom:loaded', function() {
                  new GroupsWidget('<?php echo $user_row['id']; ?>', '<?php echo $row['id']; ?>');
                });
              </script>
              <?php
                } else if($subtype == 'Profilewidget') {
                  $found_profile = true;
                  $info = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$searchname}' LIMIT 1") or die(mysqli_error($connection));
                  $userdata = mysqli_fetch_assoc($info);
                  $valid = mysqli_num_rows($info);
                  if($valid > 0) {
                    $groupbadge = GetUserGroupBadge($userdata['id']);
                    $badge = GetUserBadge($userdata['name']);
              ?>
              <div class="movable widget ProfileWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                <div class="w_skin_<?php echo $row['skin']; ?>">
                  <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                    <div class="widget-headline">
                      <h3>
                        <?php echo $edit; ?>
                        <span class="header-left">&nbsp;</span>
                        <span class="header-middle">MY <?php echo strtoupper($shortname); ?></span>
                        <span class="header-right">&nbsp;</span>
                      </h3>
                    </div>
                  </div>
                  <div class="widget-body">
                    <div class="widget-content">
                      <div class="profile-info">
                        <div class="name" style="float: left">
                          <span class="name-text"><?php echo $userdata['name']; ?></span>
                        </div>
                        <br class="clear" />
                        <?php echo (IsUserOnline($userdata['id']) ? '<img alt="Online" src="' . $web_gallery . 'images/myhabbo/habbo_online_anim_big.gif" />' : '<img alt="Offline" src="' . $web_gallery . 'images/myhabbo/habbo_offline_big.gif" />'); ?>
                        <div class="birthday text">
                          Created on:
                        </div>
                        <div class="birthday date">
                          <?php echo $userdata['hbirth']; ?>
                        </div>
                        <div>
                          <?php echo ($groupbadge != false ? '<a href="group_profile.php?id=' . GetUserGroup($userdata['id']) . '"><img src="' . $path . 'habbo-imaging/badge-fill/' . $groupbadge . '.gif"></a>' : ''); ?>
                          <?php echo ($badge != false ? '<img src="' . $cimagesurl . $badgesurl . $badge . '.gif" /></a>' : ''); ?>
                        </div>
                      </div>
                      <div class="profile-figure">
                        <img alt="<?php echo $userdata['name']; ?>" src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userdata['figure']; ?>&size=b&direction=4&head_direction=4&gesture=sml" />
                      </div>
                      <?php echo ($userdata['mission'] != null ? '<div class="profile-motto">' . HoloText($userdata['mission']) . '<div class="clear"></div></div>' : ''); ?>
                      <?php if($userdata['id'] != $my_id && $logged_in) { ?>
                      <div class="profile-friend-request clearfix">
                        <a href="<?php echo $path; ?>myhabbo/friends_add.php?id=<?php echo $userdata['id']; ?>" class="new-button" id="add-friend" style="float: left"><b>Add as friend</b><i></i></a>
                      </div>
                      <?php } ?>
                      <br clear="all" style="display: block; height: 1px" />
                      <div id="profile-tags-panel">
                        <div id="profile-tag-list">
                          <div id="profile-tags-container">
                      <?php
                        $get_tags = mysqli_query($connection, "SELECT * FROM cms_tags WHERE ownerid = '{$userdata['id']}' ORDER BY id LIMIT 20") or die(mysqli_error($connection));
                        $rows = mysqli_num_rows($get_tags);
                        $num = mysqli_num_rows($get_tags);
                        if($num > 0) {
                          if($userdata['id'] == $my_id && $logged_in) {
                            while($row1 = mysqli_fetch_assoc($get_tags)) {
                      ?>
                      <span class="tag-search-rowholder">
                        <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row1['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row1['tag']; ?>"><?php echo $row1['tag']; ?></a>
                        <img border="0" class="tag-delete-link tag-delete-link-<?php echo $row1['tag']; ?>" onMouseOver="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete_hi.gif'" onMouseOut="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif'" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif" />
                      </span>
                      <?php
                          }
                        } else if($logged_in) {
                          while($row1 = mysqli_fetch_assoc($get_tags)) {
                      ?>
                      <span class="tag-search-rowholder">
                        <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row1['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row1['tag']; ?>"><?php echo $row1['tag']; ?></a>
                        <img border="0" class="tag-add-link tag-add-link-<?php echo $row1['tag']; ?>" onMouseOver="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_add_hi.gif'" onMouseOut="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_add.gif'" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_add.gif" />
                      </span>
                      <?php
                          }
                        } else {
                          while ($row1 = mysqli_fetch_assoc($get_tags)) {
                      ?>
                      <span class="tag-search-rowholder">
                        <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row1['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row1['tag']; ?>"><?php echo $row1['tag']; ?></a>
                      </span>
                    <?php
                          }
                        }
                      } else {
                        echo 'No tags';
                      }
                    ?>
                    <img id="tag-img-added" border="0" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_added.gif" style="display:none" />
                  </div>
                  <script type="text/javascript">
                    document.observe('dom:loaded', function() {
                      TagHelper.setTexts({
                        buttonText: 'OK',
                        tagLimitText: 'You\'ve reached the tag limit - delete one of your tags if you want to add a new one.'
                      });
                    });
                  </script>
                </div>
                <div id="profile-tags-status-field">
                  <div style="display: block;">
                    <div class="content-red">
                      <div class="content-red-body">
                        <span id="tag-limit-message">
                          <img src="<?php echo $web_gallery; ?>images/register/icon_error.gif"/>
                          You've reached the tag limit - delete one of your tags if you want to add a new one.
                        </span>
                        <span id="tag-invalid-message">
                          <img src="<?php echo $web_gallery; ?>images/register/icon_error.gif"/>
                          Invalid tag
                        </span>
                      </div>
                    </div>
                    <div class="content-red-bottom">
                      <div class="content-red-bottom-body"></div>
                    </div>
                  </div>
                </div>
                <?php echo ($userdata['id'] == $my_id ? '<div class="profile-add-tag"><input type="text" id="profile-add-tag-input" maxlength="30" /><br clear="all" /><a href="#" class="new-button" style="float:left;margin:5px 0 0 0;" id="profile-add-tag"><b>Add tag</b><i></i></a></div>' : ''); ?>
              </div>
              <script type="text/javascript">
                document.observe('dom:loaded', function() {
                  new ProfileWidget('<?php echo $userdata['id']; ?>', '<?php echo $userdata['id']; ?>', {
                    headerText: 'Are you sure?',
                    messageText: 'Are you sure you want to ask <strong><?php echo $userdata['name']; ?></strong> to be your friend?',
                    buttonText: 'OK',
                    cancelButtonText: 'Cancel'
                  });
                });
            </script>
            <div class="clear"></div>
          </div>
        </div>
      </div>
    </div>
              <?php
                  }
                } else if($subtype == 'RoomsWidget') {
              ?>
              <div class="movable widget RoomsWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                <div class="w_skin_<?php echo $row['skin']; ?>">
                  <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                    <div class="widget-headline">
                      <h3>
                        <?php echo $edit; ?>
                        <span class="header-left">&nbsp;</span>
                        <span class="header-middle">MY ROOMS</span>
                        <span class="header-right">&nbsp;</span>
                      </h3>
                    </div>  
                  </div>
                  <div class="widget-body">
                    <div class="widget-content">
                      <?php       
                        $roomsql = mysqli_query($connection, "SELECT * FROM rooms WHERE owner = '{$user_row['name']}'");
                        $count = mysqli_num_rows($roomsql);
                        if($count != 0) { 
                      ?>
                      <div id="room_wrapper">
                        <table border="0" cellpadding="0" cellspacing="0">
                          <?php 
                            $i = 0;
                            while ($roomrow = mysqli_fetch_assoc($roomsql)) {
                              $i++;
                              $classDotted = ($count != $i) ? ' class="dotted-line"' : '';
                              if($roomrow['state'] == 2) {
                                $roomIcon = 'password';
                                $roomStatus = 'password protected';
                              } else if($roomrow['state'] == 0) {
                                $roomIcon = 'open';
                                $roomStatus = 'enter room';
                              } else if($roomrow['state'] == 1) {
                                $roomIcon = 'locked';
                                $roomStatus = 'locked';
                              }
                          ?>
                          <tr>
                            <td valign="top"<?php echo $classDotted; ?>>
                              <div class="room_image">
                                <img src="<?php echo $web_gallery; ?>images/myhabbo/rooms/room_icon_<?php echo $roomIcon; ?>.gif" alt="" align="middle"/>
                              </div>
                            </td>
                            <td<?php echo $classDotted; ?>>
                              <div class="room_info">
                                <div class="room_name">
                                  <?php echo $roomrow['name']; ?>
                                </div>
                                <img id="room-<?php echo $roomrow['id']; ?>-report" class="report-button report-r" alt="report" src="<?php echo $web_gallery; ?>images/myhabbo/buttons/report_button.gif" style="display: none;" />
                                <div class="clear"></div>
                                <div>
                                  <?php echo $roomrow['description']; ?>
                                </div>
                                <a href="<?php echo $path; ?>client.php?forwardId=2&amp;roomId=<?php echo $roomrow['id']; ?>" target="" id="room-navigation-link_<?php echo $roomrow['id']; ?>" onclick="HabboClient.roomForward(this, '<?php echo $roomrow['id']; ?>', 'private', true); return false;">
                                  <?php echo $roomStatus; ?>
                                </a>
                              </div>
                              <br class="clear" />
                            </td>
                          </tr>
                          <?php } ?>
                          <br class="clear" />
                        </table>
                      </div>
                      <?php
                        } else {
                          echo 'You don\'t have any rooms';
                        }
                      ?>
                      <div class="clear"></div>
                    </div>
                  </div>
                </div>
              </div>
              <?php 
                } else if($subtype == 'GuestbookWidget') {
                $sql = mysqli_query($connection, "SELECT * FROM cms_guestbook WHERE widget_id = '{$row['id']}' ORDER BY id DESC");
                $count = mysqli_num_rows($sql);
                $guestbook_status = ($row['var'] == 0) ? 'public' : 'private';
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
                            <span id="guestbook-type" class="<?php echo $guestbook_status; ?>">
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
                                $i = 0;
                                $owneronly = '';
                                while ($row1 = mysqli_fetch_assoc($sql)) {
                                  $i++;
                                  $userrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row1['userid']}' LIMIT 1"));
                                  $owneronly = ($my_id == $row1['userid'] ? '<img src="' . $web_gallery . '/images/myhabbo/buttons/delete_entry_button.gif" id="gbentry-delete-' . $row1['id'] . '" class="gbentry-delete" style="cursor:pointer" alt="" /><br />' : ($user_row['id'] == $my_id ? '<img src="' . $web_gallery . '/images/myhabbo/buttons/delete_entry_button.gif" id="gbentry-delete-' . $row1['id'] . '" class="gbentry-delete" style="cursor:pointer" alt="" /><br />' : ''));
                                  $useronline = (IsUserOnline($row1['userid'])) ? 'online' : 'offline';
                            ?>
                            <li id="guestbook-entry-<?php echo $row1['id']; ?>" class="guestbook-entry">
                              <div class="guestbook-author">
                                <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userrow['figure']; ?>&direction=2&head_direction=2&gesture=sml&size=s" alt="<?php echo $userrow['name']; ?>" title="<?php echo $userrow['name']; ?>" />
                              </div>
                              <div class="guestbook-actions">
                                <?php echo $owneronly; ?>
                              </div>
                              <div class="guestbook-message">
                                <div class="<?php echo $useronline; ?>">
                                  <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $userrow['name']; ?>"><?php echo $userrow['name']; ?></a>
                                </div>
                                <p>
                                  <?php echo HoloText($row1['message'], true); ?>
                                </p>
                              </div>
                              <div class="guestbook-cleaner">&nbsp;</div>
                              <div class="guestbook-entry-footer metadata">
                                <?php echo $row1['time']; ?>
                              </div>
                            </li>
                            <?php
                                }
                              }
                            ?>
                          </ul>
                        </div>
                        <?php if(!$edit_mode && $logged_in) { ?>
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
                              gb<?php echo $row['id']; ?>.updateOptionsList('<?php echo $guestbook_status; ?>');
                            }
                          });
                        </script>
                        <div class="clear"></div>
                      </div>
                    </div>
                  </div>
                </div>
            <?php
              } else if($subtype == 'HighScoresWidget') {
                $bbsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$user_row['id']}' LIMIT 1");
                $bbrow = mysqli_fetch_assoc($bbsql);
              ?>
              <div class="movable widget HighScoresWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
                <div class="w_skin_<?php echo $row['skin']; ?>">
                  <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                    <div class="widget-headline">
                      <h3><?php echo $edit; ?><span class="header-left">&nbsp;</span><span class="header-middle">HIGH SCORES</span><span class="header-right">&nbsp;</span></h3>
                    </div>
                  </div>
                  <div class="widget-body">
                    <div class="widget-content">
                      <?php
                        if($bbrow['bb_playedgames'] == 0) {
                          echo "You have not played any games yet.";
                        } else {
                      ?>
                      <table>
                        <tr colspan="2">
                          <th>Battle Ball</a>
                          </th>
                        </tr>
                        <tr>
                          <td>Games played</td>
                          <td>
                            <?php echo $bbrow['bb_playedgames']; ?>
                          </td>
                        </tr>
                        <tr>
                          <td>Total score</td>
                          <td>
                            <?php echo $bbrow['bb_totalpoints']; ?>
                          </td>
                        </tr>
                      </table>
                      <?php } ?>
                      <div class="clear"></div>
                    </div>
                  </div>
                </div>
              </div>
            <?php
              } else if($subtype == 'FriendsWidget') { 
                $sql = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$user_row['id']}' OR friendid = '{$user_row['id']}'");
                $count = mysqli_num_rows($sql);
            ?>
            <div class="movable widget FriendsWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
              <div class="w_skin_<?php echo $row['skin']; ?>">
                <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                  <div class="widget-headline">
                    <h3>
                      <?php echo $edit; ?>
                      <span class="header-left">&nbsp;</span>
                      <span class="header-middle">My Friends (<?php echo $count; ?>)</span>
                      <span class="header-right">&nbsp;</span>
                      </h3>
                  </div>
                </div>
                <div class="widget-body">
                  <div class="widget-content">
                    <div id="avatar-list-search">
                      <input type="text" style="float:left;" id="avatarlist-search-string" />
                      <a class="new-button" style="float:left;" id="avatarlist-search-button"><b>Search</b><i></i></a>
                    </div>
                    <br clear="all" />
                    <div id="avatarlist-content">
                      <?php
                        $bypass = true;
                        $widgetid = $row['id'];
                        require_once(dirname(__FILE__) . '/myhabbo/avatarlist_friendsearchpaging.php');
                      ?>
                      <script type="text/javascript">
                        document.observe('dom:loaded', function() {
                          window.widget<?php echo $row['id']; ?> = new FriendsWidget('<?php echo $user_row['id']; ?>', '<?php echo $row['id']; ?>');
                        });
                      </script>
                    </div>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
            </div>
            <?php
              } else if($subtype == 'TraxPlayerWidget') {
                $mysql = mysqli_query($connection, "SELECT * FROM furniture WHERE ownerid = '{$user_row['id']}'");
                $i = 0;
                $songselected = (empty($row['var'])) ? false : true;
                $sql1 = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE id = '{$row['var']}' LIMIT 1");
                $songrow1 = mysqli_fetch_assoc($sql); 
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
                    <?php if($edit_mode) { ?>
                      <div id="traxplayer-content" style="text-align: center;">
                        <img src="<?php echo $web_gallery; ?>images/traxplayer/player.png" />
                      </div>
                      <div id="edit-menu-trax-select-temp" style="display:none">
                        <select id="trax-select-options-temp">
                          <option value="">-Choose song-</option>
                          <?php
                            while($machinerow = mysqli_fetch_assoc($mysql)) {
                              $i++;
                              $sql = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE machineid = '{$machinerow['id']}'");
                              $n = 0;
                              while($songrow = mysqli_fetch_assoc($sql)) {
                                $n++;
                                echo (empty($songrow['id']) ? '<option value="'.$songrow['id'].'\">' . HoloText($songrow['title']) . '</option>' : '');
                              }
                            }
                          ?>
                        </select>
                      </div>
                      <?php
                        } else if(!$songselected) {
                          echo 'You don\'t have a selected Trax song.';
                        } else {
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
                } else if($subtype == 'BadgesWidget') {
              $sql = mysqli_query($connection, "SELECT * FROM users_badges WHERE userid = '".$user_row['id']."' ORDER BY badgeid ASC");
              $count = mysqli_num_rows($sql);
            ?>
            <div class="movable widget BadgesWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
              <div class="w_skin_<?php echo $row['skin']; ?>">
                <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                  <div class="widget-headline">
                    <h3>
                      <?php echo $edit; ?>
                      <span class="header-left">&nbsp;</span>
                      <span class="header-middle">Badges</span>
                      <span class="header-right">&nbsp;</span>
                    </h3>
                  </div>
                </div>
                <div class="widget-body">
                  <div class="widget-content">
                    <div id="badgelist-content">
                      <?php
                        if($count == 0) {
                          echo 'You don\'t have any badges.';
                        } else {
                          $bypass1 = true;
                          require_once(dirname(__FILE__) . '/myhabbo/badgelist_badgepaging.php');
                        }
                      ?>
                      <script type="text/javascript">
                        document.observe('dom:loaded', function() {
                          window.badgesWidget<?php echo $row['id']; ?> = new BadgesWidget('<?php echo $count; ?>', '<?php echo $row['id']; ?>');
                        });
                      </script>
                    </div>
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
                $info = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$searchname}' LIMIT 1") or die(mysqli_error($connection));
                $userdata = mysqli_fetch_assoc($info);
                $valid = mysqli_num_rows($info);
                if($valid > 0) {
                  mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, type, subtype, x, y, z, skin) VALUES('{$userdata['id']}', '2', '1', '25', '25', '5', 'defaultskin')") or die(mysqli_error($connection));
                  $groupbadge = GetUserGroupBadge($userdata['id']);
                  $badge = GetUserBadge($userdata['name']);
                  $get_tags = mysqli_query($connection, "SELECT * FROM cms_tags WHERE ownerid = '{$userdata['id']}' ORDER BY id LIMIT 20") or die(mysqli_error($connection));
                  $rows = mysqli_num_rows($get_tags);
                  $num = mysqli_num_rows($get_tags);
            ?>
            <div class="movable widget FriendsWidget" id="widget-<?php echo $row['id']; ?>" style=" left: <?php echo $row['x']; ?>px; top: <?php echo $row['y']; ?>px; z-index: <?php echo $row['z']; ?>;">
              <div class="w_skin_defaultskin">
                <div class="widget-corner" id="widget-<?php echo $row['id']; ?>-handle">
                  <div class="widget-headline">
                    <h3>
                    <?php echo $edit; ?>
                    <span class="header-left">&nbsp;</span>
                    <span class="header-middle">MY <?php echo strtoupper($shortname); ?></span>
                    <span class="header-right">&nbsp;</span>
                  </h3>
                  </div>
                </div>
                <div class="widget-body">
                  <div class="widget-content">
                    <div class="profile-info">
                      <div class="name" style="float: left">
                        <span class="name-text"><?php echo $userdata['name']; ?></span>
                      </div>
                      <br class="clear" />
                      <?php echo (IsUserOnline($userdata['id']) ? '<img alt="Online" src="' . $web_gallery . 'images/myhabbo/habbo_online_anim.gif" />' : '<img alt="Offline" src="' . $web_gallery . 'images/myhabbo/habbo_offline.gif" />'); ?>
                        <div class="birthday text">
                          Created on:
                        </div>
                        <div class="birthday date">
                          <?php echo $userdata['hbirth']; ?>
                        </div>
                        <div>
                          <?php echo (!groupbadge ? '<a href="' . $path . 'group_profile.php?id=' . GetUserGroup($userdata['id']) . '"><img src="' . $path . 'habbo-imaging/badge-fill/' . $groupbadge . '.gif"></a>' : ''); ?>
                            <?php echo ($badge ? '<img src="http://images.habbohotel.co.uk/c_images/album1584/' . $badge . '.gif" />' : ''); ?>
                        </div>
                    </div>
                    <div class="profile-figure">
                      <img alt="<?php echo $userdata['name']; ?>>" src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userdata['figure']; ?>>&size=b&direction=4&head_direction=4&gesture=sml" />
                    </div>
                    <div class="profile-motto">
                      <?php echo HoloText($userdata['mission']); ?>>
                        <div class="clear"></div>
                    </div>
                    <br clear="all" style="display: block; height: 1px" />
                    <div id="profile-tags-panel">
                      <div id="profile-tag-list">
                        <div id="profile-tags-container">
                          <?php
                            if($num > 0) {
                              if($userdata['id'] == $my_id && $logged_in) {
                                while ($row = mysqli_fetch_assoc($get_tags)) {
                          ?>
                          <span class="tag-search-rowholder">
                            <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row['tag']; ?>">
                              <?php echo $row['tag']; ?>
                            </a>
                            <img border="0" class="tag-delete-link tag-delete-link-<?php echo $row['tag']; ?>" onMouseOver="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete_hi.gif'" onMouseOut="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif'" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif" />
                          </span>
                          <?php
                              }
                            } else if($logged_in) {
                              while ($row = mysqli_fetch_assoc($get_tags)) {
                          ?>
                          <span class="tag-search-rowholder">
                            <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row['tag']; ?>">
                              <?php echo $row['tag']; ?>
                            </a>
                            <img border="0" class="tag-add-link tag-add-link-<?php echo $row['tag']; ?>" onMouseOver="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_add_hi.gif'" onMouseOut="this.src = '<?php echo $web_gallery; ?>images/buttons/tags/tag_button_add.gif'" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_add.gif" />
                          </span>
                          <?php
                              }
                            } else {
                              while ($row = mysqli_fetch_assoc($get_tags)) {
                          ?>
                          <span class="tag-search-rowholder">
                            <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row['tag']; ?>">
                              <?php echo $row['tag']; ?>
                            </a>
                          </span>
                          <?php
                                }
                              }
                            } else {
                              echo 'No tags';
                            }
                          ?>
                          <img id="tag-img-added" border="0" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_added.gif" style="display: none" />
                        </div>
                        <script type="text/javascript">
                          document.observe('dom:loaded', function() {
                            TagHelper.setTexts({
                              buttonText: 'OK',
                              tagLimitText: 'You\'ve reached the tag limit - delete one of your tags if you want to add a new one.'
                            });
                          });
                        </script>
                      </div>
                      <div id="profile-tags-status-field">
                        <div style="display: block;">
                          <div class="content-red">
                            <div class="content-red-body">
                              <span id="tag-limit-message">
                                <img src="<?php echo $web_gallery; ?>images/register/icon_error.gif"/>
                                You've reached the tag limit - delete one of your tags if you want to add a new one.
                              </span>
                              <span id="tag-invalid-message">
                                <img src="<?php echo $web_gallery; ?>images/register/icon_error.gif"/>
                                Invalid tag
                              </span>
                            </div>
                          </div>
                          <div class="content-red-bottom">
                            <div class="content-red-bottom-body"></div>
                          </div>
                        </div>
                      </div>
                      <?php if($userdata['id'] == $my_id) { ?>
                        <div class="profile-add-tag">
                          <input type="text" id="profile-add-tag-input" maxlength="30" />
                          <br clear="all" />
                          <a href="#" class="new-button" style="float:left;margin:5px 0 0 0;" id="profile-add-tag"><b>Add tag</b><i></i></a>
                        </div>
                        <?php } ?>
                    </div>
                    <script type="text/javascript">
                      document.observe('dom:loaded', function() {
                        new ProfileWidget('21063711', '21063711', {
                          headerText: 'Are you sure?',
                          messageText: 'Are you sure you want to ask <strong><?php echo $userdata['name ']; ?></strong> to be your friend?',
                          buttonText: 'OK',
                          cancelButtonText: 'Cancel'
                        });
                      });
                    </script>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
            </div>
            <?php
                }
              }
            ?>
          </div>
        </div>
      <div id="mypage-ad">
        <div class="habblet">
          <div class="ad-container">
            <?php echo (IsHCMember($user_row['id']) ? '&nbsp;' : '<a href="' . $path. 'club.php"><img src="' . $web_gallery . 'album1/hc_habbohome_banner_holo.png" width="160" height="600" id="galleryImage" border="0" alt="hc habbohome banner holo"></a>'); ?>
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
      <br />
    </p>
    <?php /*@@* DO NOT EDIT OR REMOVE THE LINE ABOVE WHATSOEVER! *@@*/ ?>
</div>
</div>
</div>
<div id="edit-menu" class="menu">
  <div class="menu-header">
    <div class="menu-exit" id="edit-menu-exit"><img src="<?php echo $web_gallery; ?>images/dialogs/menu-exit.gif" alt="" width="11" height="11" /></div>
    <h3>Edit</h3>
  </div>
  <div class="menu-body">
    <div class="menu-content">
      <form action="#" onsubmit="return false;">
        <div id="edit-menu-skins">
          <select id="edit-menu-skins-select">
            <option value="1" id="edit-menu-skins-select-defaultskin">Default</option>
            <option value="6" id="edit-menu-skins-select-goldenskin">Golden</option>
            <option value="3" id="edit-menu-skins-select-metalskin">Metal</option>
            <option value="5" id="edit-menu-skins-select-notepadskin">Notepad</option>
            <option value="2" id="edit-menu-skins-select-speechbubbleskin">Speech Bubble</option>
            <option value="4" id="edit-menu-skins-select-noteitskin">Stickie Note</option>
            <?php if(IsHCMember($my_id)) { ?>
            <option value="8" id="edit-menu-skins-select-hc_pillowskin">HC Bling</option>
            <option value="7" id="edit-menu-skins-select-hc_machineskin">HC Scifi</option>
            <?php } ?>
            <?php if($user_rank > 5) { ?>
            <option value="9" id="edit-menu-skins-select-nakedskin">Staff - Naked Skin</option>
            <?php } ?>
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
            <option value="private"<?php echo ($guestbook_status == 'private' ? ' selected="selected"' : ''); ?>>Private</option>
            <option value="public"<?php echo ($guestbook_status == 'public' ? ' selected="selected"' : ''); ?>>Public</option>
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
    if(editMenuOpen){
      closeEditMenu();
    }
  }, false);
  Event.observe(document, 'click', function() {
    if(editMenuOpen){
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
<div class="cbb topdialog" id="guestbook-form-dialog">
  <h2 class="title dialog-handle">Edit Guestbook entry</h2>
  <a class="topdialog-exit" href="#" id="guestbook-form-dialog-exit">X</a>
  <div class="topdialog-body" id="guestbook-form-dialog-body">
    <div id="guestbook-form-tab">
      <form method="post" id="guestbook-form">
        <p>
          Note: the message length must not exceed 200 characters
          <input type="hidden" name="ownerId" value="<?php echo $user_row['id']; ?>" />
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
              'gray': ['#828282', 'Gray'],
              'black': ['#000000', 'Black']
            };
            bbcodeToolbar.addColorSelect('Color', colors, true);
          </script>
          <div id="linktool">
            <div id="linktool-scope">
              <label for="linktool-query-input">Create link:</label>
              <input type="radio" name="scope" class="linktool-scope" value="1" checked="checked" /> Habbos
              <input type="radio" name="scope" class="linktool-scope" value="2" /> Rooms
              <input type="radio" name="scope" class="linktool-scope" value="3" /> Groups
            </div>
            <input id="linktool-query" type="text" name="query" value="" />
            <a href="#" class="new-button" id="linktool-find"><b>Find</b><i></i></a>
            <div class="clear" style="height: 0;">
              <!-- -->
            </div>
            <div id="linktool-results" style="display: none">
            </div>
            <script type="text/javascript">
              linkTool = new LinkTool(bbcodeToolbar.textarea);
            </script>
          </div>
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
<script type="text/javascript">
  HabboView.run();
</script>
<?php echo $analytics; ?>
  </body>
  </html>

<?php
} else if($error) {
  $cored = true;
  require_once(dirname(__FILE__) . '/error.php');
} else {
  $pagename = 'User is Banned';
  require_once(dirname(__FILE__) . '/templates/community/subheader.php');
  require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix red">
            <h2 class="title">User is Banned</h2>
            <div id="notfound-content" class="box-content">
              <p class="error-text">Sorry, but the page you were looking for is currently unavailable, because this user has been <b>banned</b>. Please try again later.</p>
              <img id="error-image" src="<?php echo $web_gallery; ?>/v2/images/error.gif" />
              <p class="error-text">Please use the 'Back' button to get back to where you started.</p>
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
                <b>A friend's group or personal page?</b><br/>
                See if it is listed on the <a href="<?php echo $path; ?>community.php">Community</a> page.
              </p>
              <p>
                <b>Rooms that rock?</b><br/>
                Browse the <a href="<?php echo $path; ?>community.php">Recommended Rooms</a> list.
              </p>
              <p>
                <b>What other users are in to?</b><br/>
                Check out the <a href="<?php echo $path; ?>tags.php">Top Tags</a> list.
              </p>
              <p>
                <b>How to get Credits?</b><br/>
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