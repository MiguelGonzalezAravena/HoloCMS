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

$pagename = 'Retrive IP Address';
$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
$msg = '';

if(!empty($query)) {
  $check = mysqli_query($connection, "SELECT name, ipaddress_last, id FROM users WHERE name LIKE '{$query}' LIMIT 1") or die(mysqli_error($connection));
  $result = mysqli_num_rows($check);

  if($result > 0) {
    $row = mysqli_fetch_assoc($check);
    $msg = '<b>The following user was found:</b><br />&nbsp;&nbsp;&nbsp;&nbsp;';
    $msg .= $row['name'] . ' (ID: ' . $row['id'] . ') - IP Address: ' . $row['ipaddress_last'];
    $msg .= '<br /><br />[<a href="http://who.is/whois-ip/ip-address/' . $row['ipaddress_last'] . '/" target="_blank">Whois</a> | <a href="index.php?p=clonechecker&do=jackstart&key=' . $row['ipaddress_last'] . '">Check for clones</a>]';
  } else {
    $msg = 'Sorry, but this user was not found or does not exist. Please check your spelling and try again.';
  }
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
          <?php if(!empty($msg)){ ?>
          <p><?php echo $msg; ?></p>
          <?php } ?>
          <form action="index.php?p=ip&do=search" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Search User - Retrive IP Address</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Username</strong></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="query" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Get IP Address" class="realbutton" accesskey="s">
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