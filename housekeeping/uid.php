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

$pagename = 'User ID';
$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';

if(!empty($query)) {
  $find = mysqli_query($connection, "SELECT id, name FROM users WHERE name LIKE '{$query}' LIMIT 1") or die(mysqli_error($connection));
  $results = mysqli_num_rows($find);
  if($results > 0) {
    $row = mysqli_fetch_assoc($find);
    header('Location: index.php?p=edituser&key=' . $row['id']);
  } else {
    $msg = 'Nothing found.';
  }
} else if(!empty($submit)) {
  $msg = 'Use the form below to search for an user.';
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
          <?php if(!empty($msg)) { ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=uid" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Retrive User ID</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Username</b>
                    <div class="graytext">To view an user's ID, please enter his/her name here.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="query" value="<?php echo $query; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <tr>
                    <td align="center" class="tablesubheader" colspan="2">
                      <input type="submit" name="submit" value="Get ID" class="realbutton" accesskey="s">
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