<?php
/*==================================+
|| # HoloCMS - Website and Content Management System
|+==================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+==================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+==================================*/
require_once(dirname(__FILE__) . '/../config.php');
require_once(dirname(__FILE__) . '/../core.php');

($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

if($do == 'prune') {
  if($my_id == $sysadmin) {
    mysqli_query($connection, "TRUNCATE TABLE system_stafflog") or die(mysqli_error($connection));
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Staff Log pruned (emptied)', 'logs.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
  } else {
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Access denied to System Administrator [{$sysadmin}] only feature (Prune Staff Logs)', 'logs.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
  }
}

$pagename = 'Logs';

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
          <div class="tableborder">
            <div class="tableheaderalt">
              <?php echo $sitename; ?> Staff Logs</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="15%" align="center">Action</td>
                <td class="tablesubheader" width="15%" align="center">User</td>
                <td class="tablesubheader" width="15%" align="center">Target user</td>
                <td class="tablesubheader" width="25%">Message/Details</td>
                <td class="tablesubheader" width="15%">Note</td>
                <td class="tablesubheader" width="20%" align="center">Date</td>
              </tr>
              <?php
                $get_users = mysqli_query($connection, "SELECT * FROM system_stafflog ORDER BY id DESC") or die(mysqli_error($connection));

                while($row = mysqli_fetch_assoc($get_users)) {
                  $userdata = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$row['userid']}' LIMIT 1");
                  $userdata = mysqli_fetch_assoc($userdata);
                  if(!empty($row['targetid'])) {
                    $targetdata = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$row['targetid']}' LIMIT 1");
                    $targetdata = mysqli_fetch_assoc($targetdata);
                  } else {
                    $targetdata['name'] = 'N/A';
                  }
                  $note = (!empty($row['note']) ? $row['note'] : '<i>None given</i>');
              ?>
              <tr>
                <td class="tablerow1" align="center">
                  <?php echo $row['action']; ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo $userdata['name']; ?> (ID: <?php echo $row['userid']; ?>)</td>
                <td class="tablerow2" align="center">
                  <?php echo $targetdata['name'] . (!empty($row['targetid']) ? ' (ID: ' . $row['targetid'] . ')' : ''); ?>
                </td>
                <td class="tablerow2">
                  <?php echo $row['message']; ?>
                </td>
                <td class="tablerow2">
                  <?php echo $note; ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo $row['timestamp']; ?>
                </td>
              </tr>
                <?php
                }
              ?>
            </table>
          </div>
          <br />
          <div align="center">(<a href="index.php?p=logs&do=prune"><b>Prune Logs</b></a>)</div>
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