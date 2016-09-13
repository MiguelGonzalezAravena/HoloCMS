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

$pagename = 'Edit guestroom';
$a = isset($_GET['a']) ? FilterText($_GET['a']) : '';
$name = isset($_POST['name']) ? FilterText($_POST['name']) : '';
$password = isset($_POST['password']) ? FilterText($_POST['password']) : '';
$model = isset($_POST['model']) ? FilterText($_POST['model']) : '';
$ccts = isset($_POST['ccts']) ? FilterText($_POST['ccts']) : '';
$floor = isset($_POST['floor']) ? (int) $_POST['floor'] : 0;
$wallpaper = isset($_POST['wallpaper']) ? (int) $_POST['wallpaper'] : 0;
$description = isset($_POST['description']) ? FilterText($_POST['description']) : '';
$state = isset($_POST['state']) ? (int) $_POST['state'] : 0;
$visitors_max = isset($_POST['visitors_max']) ? (int) $_POST['visitors_max'] : 1;
$visitors_now = isset($_POST['visitors_now']) ? (int) $_POST['visitors_now'] : 0;
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']): '';
$msg = '';

if(!empty($key)) {
  if(!empty($name) && !empty($model) && !empty($ccts) && !empty($description)) {
    mysqli_query($connection, "UPDATE rooms SET password = '{$password}', name = '{$name}', model = '{$model}', ccts = '{$ccts}', floor = '{$floor}', wallpaper = '{$wallpaper}', description = '{$description}', state = '{$state}', visitors_now = '{$visitors_now}', visitors_max = '{$visitors_max}' WHERE id = '{$key}'") or die(mysqli_error($connection));
    $msg = 'Succesfully updated!';
  } else if(!empty($submit)) {
    $msg = 'Fill in all the fields!';
  }
} else {
  echo 'Give a roomid!';
  die;
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
            if($a == 'delete') {
              mysqli_query($connection, "DELETE FROM rooms WHERE id = '{$key}' LIMIT 1");
              echo '<b>Succesfully deleted!</b><br />';
            }

            $sql = mysqli_query($connection, "SELECT * FROM rooms WHERE id = '{$key}' AND owner IS NULL LIMIT 1");
            $row = mysqli_fetch_assoc($sql);

            if(mysqli_num_rows($sql) != 1) {
              echo 'Room doesn\'t exist or the room does double exist';
              die;
            }
            if(!empty($msg)){ ?>
            <p><strong><?php echo $msg; ?></strong></p>
            <?php } ?>
          <form method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Edit publicroom</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Name of room</b>
                    <div class="graytext">What's the name of the room?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="name" value="<?php echo $row['name']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Description of room</b>
                    <div class="graytext">What's the description of the room - note, fill in external text data (example: theatredome_halloween)?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="description" value="<?php echo $row['description']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>State</b>
                    <div class="graytext">What's the state of the room?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select style="color: black; font-family: Verdana" name="state">
                      <option value="0"<?php echo ($row['state'] == 0 ? ' selected="selected"' : ''); ?>>Open</option>
                      <option value="1"<?php echo ($row['state'] == 1 ? ' selected="selected"' : ''); ?>>Closed (bell)</option>
                      <option value="2"<?php echo ($row['state'] == 2 ? ' selected="selected"' : ''); ?>>Password protected</option>
                      <option value="3"<?php echo ($row['state'] == 3 ? ' selected="selected"' : ''); ?>>HC Only</option>
                      <option value="4"<?php echo ($row['state'] == 4 ? ' selected="selected"' : ''); ?>>Staff only</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Model</b>
                    <div class="graytext">What's the model of the room?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="model" value="<?php echo $row['model']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Cct(s)</b>
                    <div class="graytext">What cct(s) is/are used for the room?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="ccts" value="<?php echo $row['ccts']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Floor</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="floor" value="<?php echo $row['floor']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Wallpaper</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="wallpaper" value="<?php echo $row['wallpaper']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Password of room</b>
                    <div class="graytext">This only works if the room is password protected!</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="password" name="password" maxlength="20" value="<?php echo $row['password']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Visitors inside right now</b>
                    <div class="graytext">How many visitors are inside right now (you're faking data).</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="visitors_now" value="<?php echo $row['visitors_now']; ?>">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Max visitors inside room</b>
                    <div class="graytext">How many visitors may come inside the room?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="visitors_max" value="<?php echo $row['visitors_max']; ?>">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Save Options" class="realbutton" accesskey="s">
                  </td>
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
