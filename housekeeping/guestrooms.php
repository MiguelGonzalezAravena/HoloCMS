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

$pagename = 'Guestroom editor';

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
            <div class="tableheaderalt"><?php echo $sitename; ?> guestrooms editor</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="1%" align="center">Room ID</td>
                <td class="tablesubheader" width="14%" align="center">Owner</td>
                <td class="tablesubheader" width="30%" align="center">Roomname</td>
                <td class="tablesubheader" width="30%" align="center">Description</td>
                <td class="tablesubheader" width="23%" align="center">Type</td>
                <td class="tablesubheader" width="2%" align="center">Edit</td>
              </tr>
              <?php
                $get_rooms = mysqli_query($connection, "SELECT * FROM rooms WHERE owner != ''") or die(mysqli_error($connection));
                $total = mysqli_num_rows($get_rooms);
                if($total == 0) {
                  echo '<tr><td colspan="6" class="tablerow1"><center><strong>No guestrooms.</strong></center></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($get_rooms)) {
              ?>
              <tr>
                <td class="tablerow1" align="center">
                  <?php echo $row['id']; ?>
                </td>
                <td class="tablerow2">
                  <?php echo $row['owner']; ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo (!empty($row['name']) ? $row['name'] : '<b><i>No room name</i></b>'); ?></td>
                <td class="tablerow2" align="center">
                  <?php echo (!empty($row['description']) ? $row['description'] : '<b><i>No room description</i></b>'); ?></td>
                <td class="tablerow2" align="center">
                  <?php echo room_state($row['state']); ?>
                </td>
                <td class="tablerow2" align="center">
                  <a href="index.php?p=editguestroom&key=<?php echo $row['id']; ?>&a=edit"><img src="<?php echo $housekeeping; ?>images/edit.gif" alt="Edit guestroom"></a>
                  <a href="index.php?p=editguestroom&key=<?php echo $row['id']; ?>&a=delete"><img src="<?php echo $housekeeping; ?>images/delete.gif" alt="Delete guestroom"></a>
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