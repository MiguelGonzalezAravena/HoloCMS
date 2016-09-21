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

$pagename = 'Publicroom editor';
$category = isset($_POST['category']) ? (int) $_POST['category'] : 0;
$catId = $category;

if($category == 2) {
  header('Location: index.php?=add_publicroom');
}

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');


if(empty($catId) || $catId < 1 || $catId > 5) {
  $catId = 1;
}
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
          <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
            <form action="index.php?p=editor_publicrooms&do=jumpCategory" method="post" name="Jumper!" id="Jumper!">
              <div class="tableborder">
                <div class="tableheaderalt">Select Category</div>
                <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                  <tr>
                    <td class="tablerow2" width="100%" valign="middle" align="center">
                      <select name="category" class="dropdown">
                        <option value="1" <?php echo ($catId==1 ? ' selected="selected"' : ''); ?>>View and edit</option>
                        <option value="2" <?php echo ($catId==2 ? ' selected="selected"' : ''); ?>>Add</option>
                      </select>
                      &nbsp;
                      <input type="submit" value="Go" class="realbutton" accesskey="s">
                    </td>
                  </tr>
                </table>
              </div>
            </form>
            <br />
            <div class="tableborder">
              <div class="tableheaderalt">
                <?php echo $sitename; ?> publicrooms editor</div>
              <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                  <td class="tablesubheader" width="2%" align="center">Room ID</td>
                  <td class="tablesubheader" width="1%" align="center">Model</td>
                  <td class="tablesubheader" width="32%" align="center">Roomname</td>
                  <td class="tablesubheader" width="32%" align="center">Description</td>
                  <td class="tablesubheader" width="31%" align="center">Type</td>
                  <td class="tablesubheader" width="2%" align="center">Edit</td>
                </tr>
                <?php
                  $get_rooms = mysqli_query($connection, "SELECT * FROM rooms WHERE owner IS NULL") or die(mysqli_error($connection));
                  while($row = mysqli_fetch_assoc($get_rooms)) {
                ?>
                <tr>
                  <td class="tablerow1" align="center">
                    <?php echo $row['id']; ?>
                  </td>
                  <td class="tablerow2">
                    <?php echo ($row['model']); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo (!empty($row['name']) ? $row['name'] : '<b><i>No room name</i></b>'); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo (!empty($row['description']) ? $row['description'] : '<b><i>No room description</i></b>'); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo room_state($row['state']); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <a href="index.php?p=editpublicroom&key=<?php echo $row['id']; ?>&a=edit"><img src="./images/edit.gif" alt="Edit publicroom"></a>
                    <a href="index.php?p=editpublicroom&key=<?php echo $row['id']; ?>&a=delete"><img src="./images/delete.gif" alt="Delete publicroom"></a>
                  </td>
                </tr>
                <?php } ?>
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