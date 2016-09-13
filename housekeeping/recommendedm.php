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
if(function_exists('SendMUSData') != true){ require_once(dirname(__FILE__) . '/../includes/mus.php'); }

if(!isset($_POST['category'])){ // do not try to save when it's a category jump

}

$pagename = "Collectables";

$catId = isset($_POST['category']) ? $_POST['category'] : 0;

if(empty($catId) || !is_numeric($catId) || $catId < 1 || $catId > 5){
    $catId = 1;
} else {
    $catId = $catId;
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
                <td class="tablesubheader" width="8%" align="center">Type</td>
                <td class="tablesubheader" width="7%" align="center">Recommended ID</td>
                <td class="tablesubheader" width="2%" align="center">Edit</td>
              </tr>
              <?php
                $get_rooms = mysqli_query($connection, "SELECT * FROM cms_recommended") or die(mysqli_error($connection));
                $total = mysqli_num_rows($get_rooms);
                if($total == 0) {
                  echo '<tr align="center"><td colspan="4" class="tablerow1"><strong>No recommended items.</strong></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($get_rooms)) {
              ?>
                <tr>
                  <td class="tablerow1" align="center">
                    <?php echo $row['id']; ?>
                      </div</td>
                      <td class="tablerow2">
                        <?php echo $row['type']; ?>
                      </td>
                      <td class="tablerow2">
                        <?php echo $row['rec_id']; ?>
                      </td>
                      <td class="tablerow2" align="center">
                        <a href="index.php?p=recommendede&key=<?php echo $row['id']; ?>&a=edit"><img src="./images/edit.gif" alt="Edit recommended"></a>
                        <a href="index.php?p=recommendede&key=<?php echo $row['id']; ?>&a=delete"><img src="./images/delete.gif" alt="Delete recommended"></a>
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