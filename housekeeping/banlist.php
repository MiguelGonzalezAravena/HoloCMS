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
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

$pagename = 'Ban Listing';

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
          <p>Notice: Expired bans will be automaticly removed upon login of the previously banned user.</p>
          <div class="tableborder">
            <div class="tableheaderalt">Active Ban Listing</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="25%" align="center">User</td>
                <td class="tablesubheader" width="30%">Reason</td>
                <td class="tablesubheader" width="20%" align="center">Expires on</td>
                <td class="tablesubheader" width="25%" align="center">IP Address</td>
              </tr>
              <?php
                $get_users = mysqli_query($connection, "SELECT * FROM users_bans") or die(mysqli_error($connection));
                $total = mysqli_num_rows($get_users);
                if($total == 0) {
                  echo '<tr align="center"><td colspan="4" class="tablerow1"><strong>No bans.</strong></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($get_users)) {
                    $row['ipaddress'] = empty($row['ipaddress']) ? '<i>Not an IP Ban</i>' : $row['ipaddress'];
                    $check = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$row['userid']}' LIMIT 1") or die(mysqli_error($connection));
                    $valid = mysqli_num_rows($check);
                    if($valid > 0) {
                      $tmp = mysqli_fetch_assoc($check);
                      $username = $tmp['name'];
                    } else {
                      $username = '<i>Invalid user!</i>';
                    }
              ?>
              <tr>
                <td class="tablerow1" align="center">
                  <?php echo $username; ?> (ID:
                    <?php echo $row['userid']; ?>)</td>
                <td class="tablerow1" align="center">
                  <?php echo $row['descr']; ?>
                </td>
                <td class="tablerow1" align="center">
                  <?php echo $row['date_expire']; ?>
                </td>
                <td class="tablerow1" align="center">
                  <?php echo $row['ipaddress']; ?>
                </td>
              </tr>
              <?php
                  }
                }
              ?>
            </table>
          </div>
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