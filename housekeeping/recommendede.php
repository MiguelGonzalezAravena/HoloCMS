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

$pagename = 'Recommended';
$a = isset($_GET['a']) ? FilterText($_GET['a']) : 'add';
$add = isset($_POST['add']) ? FilterText($_POST['add']) : '';
$type = isset($_POST['type']) ? FilterText($_POST['type']) : '';
$rec_id = isset($_POST['rec_id']) ? (int) $_POST['rec_id'] : '';
$msg = '';

if($a == 'delete') {
  mysqli_query($connection, "DELETE FROM cms_recommended WHERE id = '{$key}'");
  header('Location: index.php?p=recommendedm');
}

if(!empty($type) && !empty($rec_id)) {
  if(!empty($key)) {
    mysqli_query($connection, "UPDATE cms_recommended SET type = '{$type}', rec_id = '{$rec_id}' WHERE id = '{$key}' LIMIT 1") or die(mysqli_error($connection));
    $msg = 'Succesfully modified!';
  } else if(!empty($add)) {
    mysqli_query($connection, "INSERT INTO cms_recommended(type, rec_id) VALUES('{$type}', '{$rec_id}')") or die(mysqli_error($connection));
    $msg = 'Recommended added.';
  }
} else if(!empty($add)) {
  $msg = 'Fill in everything!';
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
          <?php if(!empty($msg)) { ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=recommendede&a=<?php echo $a; ?><?php echo (!empty($key) ? '&key=' . $key : ''); ?>" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">
                <?php echo ($a == 'add' ? 'Add' : 'Edit'); ?> Recommended</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <?php if($a == "add") { ?>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Type</b>
                    <div class="graytext">Type either 'group' or 'room' (not yet supported)</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="type" value="<?php echo $type; ?>" maxlength="5" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>ID</b>
                    <div class="graytext">The ID of the recommendation.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="rec_id" value="<?php echo $rec_id; ?>" maxlength="175" class="textinput">
                  </td>
                </tr>
                <?php
                  } elseif($a == 'edit') {
                    if(!empty($key)) {
                      $sql = mysqli_query($connection, "SELECT * FROM cms_recommended WHERE id = '{$key}' LIMIT 1");
                      $row = mysqli_fetch_assoc($sql);
                ?>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Type</b>
                    <div class="graytext">Type either 'group' or 'room' (not yet supported)</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="type" value="<?php echo $row['type']; ?>" maxlength="5" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>ID</b>
                    <div class="graytext">The ID of the recommendation.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type='rec_id' name="description" value="<?php echo $row['rec_id']; ?>" maxlength="175" class="textinput">
                  </td>
                </tr>
                <?php
                    }
                  }
                  
                  if(!empty($a) && empty($key)) {
                    if($a == 'edit') {
                      echo 'If you want to edit a recommended, please go to the over-view and than click on the edit-icon.';
                    }
                  }
                ?>
                  <tr>
                    <td align="center" class="tablesubheader" colspan="2">
                      <input type="submit" name="<?php echo ($a == 'add' ? 'add' : 'edit'); ?>" value="<?php echo ($a == 'add' ? 'Add recommended' : 'Edit recommended'); ?>" class="realbutton" accesskey="s"></td>
                  </tr>
              </table>
            </div>
          </form>
          <br />
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