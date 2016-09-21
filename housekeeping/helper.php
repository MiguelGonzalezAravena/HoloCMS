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
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

$x = isset($x) ? $x : '';
$msg = '';

$pagename = 'Customer Support';

if($do == 'pick' && !empty($key)) {
  $viewmode = false;
  $check = mysqli_query($connection, "SELECT id FROM cms_help WHERE id = '{$key}' AND picked_up = '0' LIMIT 1") or die(mysqli_error($connection));
  $found = mysqli_num_rows($check);

  if($found > 0) {
    mysqli_query($connection, "UPDATE cms_help SET picked_up = '1' WHERE id = '{$key}' AND picked_up = '0' LIMIT 1") or die(mysqli_error($connection));
    $msg = 'Help query picked up successfully.';
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Picked up help query (ID: {$key})', 'helper.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
  } else {
    $msg = 'Invalid ID specified or already picked up.';
  }
} elseif($x == 'refreshStatic') {
  $viewmode = false;
  $msg = 'Overview refreshed.';
} elseif($do == 'delete' && !empty($key)) {
  $viewmode = false;
  $check = mysqli_query($connection, "SELECT id FROM cms_help WHERE id = '{$key}' AND picked_up = '1' LIMIT 1") or die(mysqli_error($connection));
  $found = mysqli_num_rows($check);

  if($found > 0) {
    mysqli_query($connection, "DELETE FROM cms_help WHERE id = '{$key}' AND picked_up = '1' LIMIT 1") or die(mysqli_error($connection));
    $msg = "Help query deleted successfully.";
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES ('Housekeeping', 'Deleted help query (ID: {$key})', 'helper.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
  } else {
    $msg = 'Invalid ID specified or not picked up yet.<br />Please note that all queries <i>must</i> be picked up before they can be deleted.';
  }
} elseif($do == 'view' && !empty($key)) {
  $check = mysqli_query($connection, "SELECT * FROM cms_help WHERE id = '{$key}' LIMIT 1") or die(mysqli_error($connection));
  $found = mysqli_num_rows($check);

  if($found > 0) {
    $viewmode = true;
    $viewdata = mysqli_fetch_assoc($check);
  } else {
    $viewmode = false;
    $msg = 'Invalid ID specified.';
  }
} else {
  $viewmode = false;
}

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="22%" valign="top" id="leftblock">
        <div>
          <!-- LEFT CONTEXT SENSITIVE MENU -->
          <?php require_once(dirname(__FILE__) . '/usermenu.php'); ?>
          <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <?php
            if($viewmode == false) {
              if(!empty($msg)) {
          ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=news_manage&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Customer Support - Help Queries</div>
              <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                  <td class="tablesubheader" width="1%" align="center">ID</td>
                  <td class="tablesubheader" width="18%">Subject</td>
                  <td class="tablesubheader" width="25%" align="center">Date</td>
                  <td class="tablesubheader" width="20%" align="center">Username</td>
                  <td class="tablesubheader" width="15%" align="center">Picked up?</td>
                  <td class="tablesubheader" width="20%" align="center">Room ID</td>
                  <td class="tablesubheader" width="1%" align="center">Reply</td>
                  <td class="tablesubheader" width="1%" align="center">Delete</td>
                </tr>
                <?php
                  $get_articles = mysqli_query($connection, "SELECT id, username, ip, message, date, picked_up, subject, roomid FROM cms_help ORDER BY id DESC") or die(mysqli_error($connection));
                  $total = mysqli_num_rows($get_articles);
                  if($total == 0) {
                    echo '<tr><td colspan="8" class="tablerow1"><center><strong>No help queries.</strong></center></td></tr>';
                  } else {
                    while($row = mysqli_fetch_assoc($get_articles)) {
                      $roomid = (!empty($row['roomid'])) ? $row['roomid'] : 'N/A';
                      $picked = ($row['picked_up'] == 1 ? 'Yes' : 'No (<a href="index.php?p=helper&do=pick&key=' . $row['id'] . '">Pick up</a>)');
                ?>
                <tr>
                  <td class="tablerow1" align="center">
                    <?php echo $row['id']; ?>
                  </td>
                  <td class="tablerow2"><a href="index.php?p=helper&do=view&key=<?php echo $row['id']; ?>"><strong><?php echo $row['subject']; ?></strong></a></td>
                  <td class="tablerow2" align="center">
                    <?php echo $row['date']; ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <a href="user_profile.php?tag=<?php echo $row['username']; ?>" target="_blank">
                      <?php echo $row['username']; ?>
                    </a>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo $picked; ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo $roomid; ?>
                  </td>
                  <td class="tablerow2" align="center"><a href="index.php?p=alert&do=quickreply&key=<?php echo $row['id']; ?>"><img src="<?php echo $housekeeping; ?>images/edit.gif" alt="Quick Reply"></a></td>
                  <td class="tablerow2" align="center"><a href="index.php?p=helper&do=delete&key=<?php echo $row['id']; ?>"><img src="<?php echo $housekeeping; ?>images/delete.gif" alt="Delete"></a></td>
                </tr>
                <?php
                    }
                  }
                ?>
              </table>
              <div class="tablefooter" align="center">
                <div class="fauxbutton-wrapper"><span class="fauxbutton"><a href="index.php?p=helper&x=refreshStatic">Refresh overview</a></span></div>
              </div>
            </div>
          </form>
          <?php } else { ?>
          <form action="index.php?p=helper" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Help Query (
                <?php echo $viewdata['subject']; ?>)</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Username</b>
                    <div class="graytext">The name of the user that submitted this help query.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="attrb" readonly="readonly" value="<?php echo $viewdata['username']; ?>" size="25" maxlength="25" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>IP Address</b>
                    <div class="graytext">The IP Address of the user that submitted this help query.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="attrb" readonly="readonly" value="<?php echo $viewdata['ip']; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Date</b>
                    <div class="graytext">The date and time this query was submitted.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="attrb" readonly="readonly" value="<?php echo $viewdata['date']; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Room ID</b>
                    <div class="graytext">If the query was submitted in the hotel, the Room ID will be shown in this field.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="attrb" readonly="readonly" value="<?php echo ($viewdata['roomid'] > 0 ? $viewdata['roomid'] : ' N/A '); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="left" class="tablesubheader" colspan="2">Data</td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Message</b>
                    <div class="graytext">The actual query submitted by the user via the Help Tool or ingame CFH tool.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="data" cols="60" rows="8" readonly="readonly" wrap="soft" id="sub_desc" class="multitext"><?php echo $viewdata['message']; ?></textarea>
                  </td>
                </tr>
                <tr>
                  <td align="left" class="tablesubheader" colspan="2">Options</td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Pick Up</b>
                    <div class="graytext">If not picked up already, you can do so here. Picking up a query indicates that you will 'take care of it'.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <?php echo ($viewdata['picked_up'] == 1 ? 'Already picked up' : '<a href="index.php?p=helper&do=pick&key=' . $viewdata['id'] . '">Pick up</a>'); ?></td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Delete</b>
                    <div class="graytext">If the query is picked up and taken care of, you can delete it here.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle"><a href="index.php?p=helper&do=delete&key=<?php echo $viewdata['id']; ?>">Delete</a></td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Quick Reply</b>
                    <div class="graytext">Quickly reply to this Help Inquery.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle"><a href="index.php?p=alert&do=quickreply&key=<?php echo $viewdata['id']; ?>">Reply</a></td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Return to overview" class="realbutton" accesskey="s">
                  </td>
                </tr>
              </table>
            </div>
          </form>
          <br />
          <?php } ?>
        </div>
        <!-- / RIGHT CONTENT BLOCK -->
      </td>
    </tr>
  </table>
</div>
<!-- / OUTERDIV -->
<div align="center">
  <br />
  <?php
    $mtime = explode(' ', microtime());
    $totaltime = $mtime[0] + $mtime[1] - $starttime;
    printf('Time: %.3f', $totaltime);
  ?>
</div>