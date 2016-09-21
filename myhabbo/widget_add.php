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
require_once(dirname(__FILE__) . '/../core.php');
require_once(dirname(__FILE__) . '/../includes/session.php');

$widgetid = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;
$zindex = isset($_POST['zindex']) ? (int) $_POST['zindex'] : 0;
$privileged = isset($_POST['privileged']) ? FilterText($_POST['privileged']) : ''; // dunno what it is, but it's always either true or false
empty($zindex) ? exit : '';
empty($widgetid) ? exit : '';

$check = mysqli_query($connection, "SELECT groupid, active FROM cms_homes_group_linker WHERE userid = '{$my_id}' AND active = '1' LIMIT 1") or die(mysqli_error($connection));
$linked = mysqli_num_rows($check);
if($linked > 0) {
  $link_info = mysqli_fetch_assoc($check);
  $groupid = $link_info['groupid'];
  empty($groupid) ? exit : '';
  $check = mysqli_query($connection, "SELECT ownerid FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
  $exists = mysqli_num_rows($check);
  if($exists < 1) {
    $linked = 0;
    $groupid = -1;
  } else {
    $tmp = mysqli_fetch_assoc($check);
    $ownerid = $tmp['ownerid'];
    $linked = 1;
  }
}


if(!empty($widgetid)) {
  // User Profile / Group Profile; system default; can't be placed
  if($widgetid == 1) {
    exit;
  } else if($widgetid == 2 && $linked < 1) {
    $widget = 2;
  } else if($widgetid == 3 && $linked > 0) {
    $widget = 3;
  } else if($widgetid == 3 && $linked < 1) {
    $widget = 3;
  } else if($widgetid == 4 && $linked < 1) {
    $widget = 4;
  } else if($widgetid == 4 && $linked > 0) {
    $widget = 4;
  } else if($widgetid == 5 && $linked < 1) {
    $widget = 5;
  } else if($widgetid == 5 && $linked > 0) {
    $widget = 5;
  } else if($widgetid == 6 && $linked < 1) {
    $widget = 6;
  } else if($widgetid == 7 && $linked < 1) {
    $widget = 7;
  } else if($widgetid == 8 && $linked < 1) {
    $widget = 8;
  } else  {
    exit;
  }

  if($widget == 2 && $linked < 1) {
    mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '-1', '2', '2', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));
    $ret_sql = mysqli_query($connection, "SELECT id FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
    $ret_row = mysqli_fetch_assoc($ret_sql);
    $saved_id = $ret_row['id'];
    $groups = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE userid = '{$my_id}' LIMIT 1");
?>
  <div class="movable widget GroupsWidget" id="widget-<?php echo $saved_id; ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id; ?>-handle">
        <div class="widget-headline">
          <h3>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">MY GROUPS (<span id="groups-list-size"><?php echo $groups; ?></span>)</span>
            <span class="header-right">
              <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
              <script language="JavaScript" type="text/javascript">
                Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
              </script>
            </span>
          </h3>
        </div>
      </div>
      <div class="widget-body">
        <div class="widget-content">
          <div class="groups-list-container">
            <ul class="groups-list">
              <?php
                $get_groups = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}'") or die(mysqli_error($connection));
                while($membership_row = mysqli_fetch_assoc($get_groups)) {
                  $get_groupdata = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$membership_row['groupid']}' LIMIT 1") or die(mysqli_error($connection));
                  $grouprow = mysqli_fetch_assoc($get_groupdata);
              ?>
                <li title="<?php echo $grouprow['name']; ?>" id="groups-list-<?php echo $saved_id; ?>-<?php echo $grouprow['id']; ?>">
                  <div class="groups-list-icon"><a href="<?php echo $path; ?>group_profile.php?id=<?php echo $grouprow['id']; ?>"><img src="<?php echo $path; ?>habbo-imaging/badge.php?badge=<?php echo $grouprow['badge']; ?>"/></a></div>
                  <div class="groups-list-open"></div>
                  <h4>
                  <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $membership_row['groupid']; ?>"><?php echo $grouprow['name']; ?></a>
                </h4>
                  <p>
                    Group created:
                    <br />
                    <?php echo ($membership_row['is_current'] == 1 ? '<div class="favourite-group" title="Favourite"></div>' : ''); ?>
                      <?php echo ($membership_row['member_rank'] > 1 && $grouprow['ownerid'] != $my_id ? '<div class="admin-group" title="Admin"></div>' : ''); ?>
                        <?php echo ($membership_row['member_rank'] > 1 && $grouprow['ownerid'] == $my_id ? '<div class="owned-group" title="Owner"></div>' : ''); ?>
                          <b>
                    <?php echo $grouprow['created']; ?>
                  </b>
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
            <p style="text-align: center">
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
    new GroupsWidget('<?php echo $my_id; ?>', '<?php echo $saved_id; ?>');
  });
  </script>
  <?php
    } elseif($widget == 3 && $linked > 0) {
      mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '{$groupid}', '2', '3', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));

      $ret_sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND type = '2' AND subtype = '3' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
      $ret_row = mysqli_fetch_assoc($ret_sql);
      $saved_id = $ret_row['id'];
      $members = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '0'");
  ?>
  <div class="movable widget MemberWidget" id="widget-<?php echo $saved_id; ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id; ?>-handle">
        <div class="widget-headline">
          <h3>
        <span class="header-left">&nbsp;</span>
        <span class="header-middle">Members of this group (<span id="avatar-list-size"><?php echo $members; ?></span>)</span>
        <span class="header-right">
          <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
          <script language="JavaScript" type="text/javascript">
            Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
          </script>
        </span>
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
              $widgetid = $saved_id;
              require_once(dirname(__FILE__) . '/avatarlist_membersearchpaging.php');
            ?>
              <script type="text/javascript">
              document.observe('dom:loaded', function() {
                window.widget <?php echo $row[0]; ?> = new MemberWidget('<?php echo $groupid; ?>', '<?php echo $row[0]; ?>');
              });
              </script>
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </div>
  </div>
  <?php
    } elseif($widget == 3 && $linked < 1) { 
      mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '-1', '2', '3', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));

      $ret_sql = mysqli_query($connection, "SELECT id FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
      $ret_row = mysqli_fetch_assoc($ret_sql);
      $saved_id = $ret_row['id'];
  ?>
  <div class="movable widget RoomsWidget" id="widget-<?php echo $saved_id ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id ?>-handle">
        <div class="widget-headline">
          <h3>
            <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>"-edit" />
            <script language="JavaScript" type="text/javascript">
              Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
            </script>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">MY ROOMS</span>
            <span class="header-right">&nbsp;</span>
          </h3>
        </div>
      </div>
      <div class="widget-body">
        <div class="widget-content">
          <?php       
            $roomsql = mysqli_query($connection, "SELECT * FROM rooms WHERE owner = '{$name}'");
            $count = mysqli_num_rows($roomsql);
            if($count > 0) { 
          ?>
          <div id="room_wrapper">
            <table border="0" cellpadding="0" cellspacing="0">
              <?php 
                $i = 0;
                while ($roomrow = mysqli_fetch_assoc($roomsql)) {
                  $i++;
                  if($roomrow['state'] == 2) {
                     $roomText = 'password protected';
                  } else if($roomrow['state'] == 0) {
                    $roomIcon = 'open';
                    $roomText = 'enter room';
                  } else if($roomrow['state'] == 1) {
                    $roomIcon = 'locked';
                    $roomText = 'locked';
                  }
              ?>
              <tr>
                <td valign="top" <?php echo ($count == $i ? '' : 'class="dotted-line"'); ?>>
                  <div class="room_image">
                    <img src="<?php echo $web_gallery; ?>images/myhabbo/rooms/room_icon_<?php echo $roomIcon; ?>.gif" alt=" align=" middle "/>
                  </div>
                </td>
                <td <?php echo ($count == $i ? '' : 'class="dotted-line "'); ?>>
                  <div class="room_info ">
                    <div class="room_name ">
                      <?php echo $roomrow['name']; ?>
                    </div>
                    <img id="room-<?php echo $roomrow[ 'id']; ?>-report" class="report-button report-r" alt="report" src="<?php echo $web_gallery; ?>images/myhabbo/buttons/report_button.gif" style="display: none;" />
                    <div class="clear"></div>
                    <div>
                      <?php echo $roomrow['description']; ?>
                    </div>
                    <a href="<?php echo $path; ?>client.php?forwardId=2&amp;roomId=<?php echo $roomrow['id']; ?>" target="" id="room-navigation-link_<?php echo $roomrow[ 'id']; ?>" onclick="HabboClient.roomForward(this, '<?php echo $roomrow['id']; ?>', 'private', true); return false; ">
                      <?php echo $roomText; ?>
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
              echo 'You do not have any rooms';
            }
          ?>
              <div class="clear"></div>
        </div>
      </div>
    </div>
  </div>
  <?php 
    } elseif($widget == 4 && $linked < 1) {
    mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '-1', '2', '4', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));
        $ret_sql = mysqli_query($connection, "SELECT id FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $ret_row = mysqli_fetch_assoc($ret_sql);
        $saved_id = $ret_row['id'];
  ?>
  <div class="movable widget GuestbookWidget" id="widget-<?php echo $saved_id ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id ?>-handle">
        <div class="widget-headline">
          <h3>
            <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
            <script language="JavaScript" type="text/javascript">
              Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
            </script>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">
              My Guestbook(<span id="guestbook-size">0</span>)
              <span id="guestbook-type" class="public">
                <img src="<?php echo $web_gallery; ?>images/groups/status_exclusive.gif" title="Friends only" alt="Friends only" />
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
              <div id="guestbook-empty-notes">This guestbook has no entries.</div>
            </ul>
          </div>
          <script type="text/javascript">
            document.observe('dom:loaded', function() {
              var gb81481 = new GuestbookWidget('17570', '<?php echo $saved_id ?>', 500);
              var editMenuSection = $('guestbook-privacy-options');
              if(editMenuSection) {
                gb81481.updateOptionsList('public');
              }
            });
          </script>
          <div class="clear"></div>
        </div>
      </div>
    </div>
  </div>
  <?php
    } elseif($widget == 5 && $linked < 1) {
    mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z, var) VALUES('{$my_id}', '-1', '2', '5', 'defaultskin', '20', '20', '{$zindex}', '0')") or die(mysqli_error($connection));

        $ret_sql = mysqli_query($connection, "SELECT id FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $ret_row = mysqli_fetch_assoc($ret_sql);
        $saved_id = $ret_row['id'];
        $sql1 = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$my_id}'");
        $sql2 = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE friendid = '{$my_id}'");
        $count = mysqli_num_rows($sql1) + mysqli_num_rows($sql2);
  ?>
  <div class="movable widget FriendsWidget" id="widget-<?php echo $saved_id; ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id; ?>-handle">
        <div class="widget-headline">
          <h3>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">My Friends (<span id="avatar-list-size"><?php echo $count; ?></span>)</span>
            <span class="header-right">
              <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
              <script language="JavaScript" type="text/javascript">
                Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
              </script>
            </span>
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
              $widgetid = $saved_id;
              require_once(dirname(__FILE__) . '/avatarlist_friendsearchpaging.php');
            ?>
            <script type="text/javascript">
              document.observe('dom:loaded', function() {
                window.widget<?php echo $row['0']; ?> = new FriendsWidget('<?php echo $user_row['id']; ?>', '<?php echo $row['0']; ?>');
              });
            </script>
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </div>
  </div>
  <?php
    } elseif($widget == 6 && $linked < 1) { 
      mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '-1', '2', '6', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));
      $ret_sql = mysqli_query($connection, "SELECT id FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
      $ret_row = mysqli_fetch_assoc($ret_sql);
      $saved_id = $ret_row['id'];
      $sql1 = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE cms_current = '1' AND cms_owner = '{$my_id}' LIMIT 1");
      $songrow1 = mysqli_fetch_assoc($sql);
  ?>
  <div class="movable widget TraxPlayerWidget" id="widget-<?php echo $saved_id ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id ?>-handle">
        <div class="widget-headline">
          <h3>
            <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
            <script language="JavaScript" type="text/javascript">
              Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
            </script>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">TRAXPLAYER</span>
            <span class="header-right">&nbsp;</span>
          </h3>
        </div>
      </div>
      <div class="widget-body">
        <div class="widget-content">
            <div id="traxplayer-content" style="text-align: center;">
              <img src="<?php echo $web_gallery; ?>images/traxplayer/player.png" />
            </div>
            <div id="edit-menu-trax-select-temp" style="display:none">
              <select id="trax-select-options-temp">
                <option value="">-Choose song-</option>
                <?php
                  $mysql = mysqli_query($connection, "SELECT * FROM furniture WHERE ownerid = '{$my_id}'");
                  $i = 0;
                  while($machinerow = mysqli_fetch_assoc($mysql)) {
                    $i++;
                    $sql = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE machineid = '{$machinerow['id']}'");
                    $n = 0;
                    while($songrow = mysqli_fetch_assoc($sql)) {
                      $n++;
                      echo (!empty($songrow['id']) ? '<option value="' . $songrow['id'] . '">' . HoloText($songrow['title']) . ' </option>' : '');
                    }
                  }
                ?>
              </select>
            </div>
            <div class="clear"></div>
        </div>
      </div>
    </div>
  </div>
  <?php
    } elseif($widget == 7 && $linked < 1) {
      mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '-1', '2', '7', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));
      $ret_sql = mysqli_query($connection, "SELECT id FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
      $ret_row = mysqli_fetch_assoc($ret_sql);
      $saved_id = $ret_row['id'];
  ?>
  <div class="movable widget HighScoresWidget" id="widget-<?php echo $saved_id ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id ?>-handle">
        <div class="widget-headline">
          <h3>
            <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
            <script language="JavaScript" type="text/javascript">
              Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
            </script>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">HIGH SCORES</span>
            <span class="header-right">&nbsp;</span>
          </h3>
        </div>
      </div>
      <div class="widget-body">
        <div class="widget-content">
          <?php
            $bbsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$my_id}' LIMIT 1");
            $bbrow = mysqli_fetch_assoc($bbsql);
            if($bbrow['bb_playedgames'] == 0) {
              echo 'You have not played any games yet.';
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
    } elseif($widget == 8 && $linked < 1) {
      mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '-1', '2', '8', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));
      $ret_sql = mysqli_query($connection, "SELECT id FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
      $ret_row = mysqli_fetch_assoc($ret_sql);
      $saved_id = $ret_row['id'];
  ?>
  <div class="movable widget BadgesWidget" id="widget-<?php echo $saved_id ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id ?>-handle">
        <div class="widget-headline">
          <h3>
            <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
            <script language="JavaScript" type="text/javascript">
              Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
            </script>
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
              $sql = mysqli_query($connection, "SELECT * FROM users_badges WHERE userid = '{$my_id}' ORDER BY badgeid ASC");
              $count = mysqli_num_rows($sql);
              if($count == 0) {
                echo "You don't have any badges.";
              } else {
                $bypass1 = true;
                require_once(dirname(__FILE__) . '/badgelist_badgepaging.php');
              }
            ?>
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </div>
  </div>
  <?php
    } elseif($widget == 4 && $linked > 0) {
      mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '{$groupid}', '2', '4', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));
      $ret_sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND type = '2' AND subtype = '5' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
      $ret_row = mysqli_fetch_assoc($ret_sql);
      $saved_id = $ret_row['id'];
  ?>
  <div class="movable widget GuestbookWidget" id="widget-<?php echo $saved_id ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id ?>-handle">
        <div class="widget-headline">
          <h3>
            <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
            <script language="JavaScript" type="text/javascript">
              Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit'); }, false);
            </script>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">
              My Guestbook(<span id="guestbook-size">0</span>)
              <span id="guestbook-type" class="public">
                <img src="<?php echo $web_gallery; ?>images/groups/status_exclusive.gif" title="Friends only" alt="Friends only" />
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
              <div id="guestbook-empty-notes">This guestbook has no entries.</div>
            </ul>
          </div>
          <script type="text/javascript">
            document.observe('dom:loaded', function() {
              var gb81481 = new GuestbookWidget('17570', '<?php echo $saved_id ?>', 500);
              var editMenuSection = $('guestbook-privacy-options');
              if(editMenuSection) {
                gb81481.updateOptionsList('public');
              }
            });
          </script>
          <div class="clear"></div>
        </div>
      </div>
    </div>
  </div>
  <?php
    } elseif($widget == 5 && $linked > 0) { 
      mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, type, subtype, skin, x, y, z) VALUES('{$my_id}', '{$groupid}', '2', '5', 'defaultskin', '20', '20', '{$zindex}')") or die(mysqli_error($connection));
      $ret_sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND type = '2' AND subtype = '5' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
      $ret_row = mysqli_fetch_assoc($ret_sql);
      $saved_id = $ret_row['id'];
      $sql1 = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE cms_current = '1' AND cms_owner = '{$my_id}' LIMIT 1");
      $songrow1 = mysqli_fetch_assoc($sql); 
  ?>
  <div class="movable widget TraxPlayerWidget" id="widget-<?php echo $saved_id ?>" style=" left: 20px; top: 20px; z-index: <?php echo $zindex; ?>;">
    <div class="w_skin_defaultskin">
      <div class="widget-corner" id="widget-<?php echo $saved_id ?>-handle">
        <div class="widget-headline">
          <h3>
            <img src="<?php echo $web_gallery; ?>images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-<?php echo $saved_id; ?>-edit" />
            <script language="JavaScript" type="text/javascript">
              Event.observe('widget-<?php echo $saved_id; ?>-edit', 'click', function(e) { openEditMenu(e, <?php echo $saved_id; ?>, 'widget', 'widget-<?php echo $saved_id; ?>-edit');
              }, false);
            </script>
            <span class="header-left">&nbsp;</span>
            <span class="header-middle">TRAXPLAYER</span>
            <span class="header-right">&nbsp;</span>
          </h3>
        </div>
      </div>
      <div class="widget-body">
        <div class="widget-content">
          <div id="traxplayer-content" style="text-align: center;">
          <img src="<?php echo $web_gallery; ?>images/traxplayer/player.png" />
        </div>
        <div id="edit-menu-trax-select-temp" style="display:none">
          <select id="trax-select-options-temp">
            <option value="">-Choose song-</option>
            <?php
              $mysql = mysqli_query($connection, "SELECT * FROM furniture WHERE ownerid = '{$my_id}'");
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
        <div class="clear"></div>
      </div>
    </div>
  </div>
</div>
<?php
  }
}
?>
