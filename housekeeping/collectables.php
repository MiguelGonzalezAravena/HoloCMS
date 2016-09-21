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
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$catId = isset($_POST['category']) ? (int) $_POST['category'] : 0;
$pagename = 'Collectables';

if(empty($catId) || $catId < 1 || $catId > 5) {
  $catId = 1;
}

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="22%" valign="top" id="leftblock">
        <div>
          <!-- LEFT CONTEXT SENSITIVE MENU -->
          <?php require_once(dirname(__FILE__) . '/sitemenu.php'); ?>
          <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <div class="tableborder">
            <div class="tableheaderalt">
              <?php echo $sitename; ?> collectables editor</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="1%" align="center">ID</td>
                <td class="tablesubheader" width="8%" align="center">Month</td>
                <td class="tablesubheader" width="7%" align="center">Year</td>
                <td class="tablesubheader" width="20%" align="center">Name</td>
                <td class="tablesubheader" width="31%" align="center">Description</td>
                <td class="tablesubheader" width="26%" align="center">Showroom</td>
                <td class="tablesubheader" width="5%" align="center">Furni</td>
                <td class="tablesubheader" width="2%" align="center">Edit</td>
              </tr>
              <?php
                $get_rooms = mysqli_query($connection, "SELECT * FROM cms_collectables") or die(mysqli_error($connection));
                $total = mysqli_num_rows($get_rooms);
                if($total == 0) {
                  echo '<tr align="center"><td colspan="8" class="tablerow1"><strong>No collectables.</strong></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($get_rooms)) {
              ?>
              <tr>
                <td class="tablerow1" align="center">
                  <?php echo $row['id']; ?>
                </td>
                <td class="tablerow2">
                  <?php echo month($row['month']); ?>
                </td>
                <td class="tablerow2">
                  <?php echo $row['year']; ?>
                </td>
                <td class="tablerow2">
                  <?php echo HoloText($row['title']); ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo HoloText($row['description']); ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo ($row['showroom'] != 0 ? 'You can\'t buy this collectable any more: It\'s in the showroom.' : 'Not in the showroom (yet)'); ?>
                </td>
                <td class="tablerow2" align="center"><img src="<?php echo $row['furni_image_small']; ?>"></td>
                <td class="tablerow2" align="center">
                  <a href="index.php?p=collectables_edit&key=<?php echo $row['id']; ?>&a=edit"><img src="<?php echo $housekeeping; ?>images/edit.gif" alt="Edit collectables"></a>
                  <a href="index.php?p=collectables_edit&key=<?php echo $row['id']; ?>&a=delete"><img src="<?php echo $housekeeping; ?>images/delete.gif" alt="Delete collectables"></a>
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