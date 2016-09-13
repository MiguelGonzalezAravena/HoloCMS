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

require_once(dirname(__FILE__) . '/../core.php');
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

$pagename = 'Alert Listing';

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
            <div class="tableheaderalt">Active Alerts Listing</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="1%" align="center">ID</td>
                <td class="tablesubheader" width="20%" align="center">User</td>
                <td class="tablesubheader" width="50%">Alert</td>
                <td class="tablesubheader" width="19%" align="center">Type</td>
              </tr>
              <?php
                $get_em = mysqli_query($connection, "SELECT * FROM cms_alerts ORDER BY id DESC") or die(mysqli_error($connection));
                $total = mysqli_num_rows($get_em);
                if($total == 0) {
                  echo '<tr align="center"><td colspan="4"><strong>No alerts.</strong></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($get_em)) {
                    $check = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$row['userid']}' LIMIT 1") or die(mysqli_error($connection));
                    $valid = mysqli_num_rows($check);
                    if($valid > 0) {
                      $tmp = mysqli_fetch_assoc($check);
                      $username = $tmp['name'];
                    } else {
                      $username = '<i>Invalid user!</i>';
                    }

                    if($row['type'] == 1) {
                      $type = 'System Message';
                    } else {
                      $type = 'Staff Message';
                    }

                    printf("<tr>
                    <td class='tablerow1' align='center'>%s</td>
                    <td class='tablerow1' align='center'>%s (ID: %s)</td>
                    <td class='tablerow1' align='center'>%s</td>
                    <td class='tablerow1' align='center'>%s</td>
                    </tr>", $row['id'], $username, $row['userid'], HoloText($row['alert']), $type);
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