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

$pagename = 'Clone Checker';
$results = '';

if($do == 'jackstart' && !empty($key)) {
  $query = $key;
}

$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';

if(!empty($query)) {
  $get_users = mysqli_query($connection, "SELECT id, name, email, ipaddress_last, hbirth FROM users WHERE ipaddress_last = '{$query}' ORDER BY name ASC") or die(mysqli_error($connection));
  $results = mysqli_num_rows($get_users);

  if($results > 0) {
    $msg = 'Showing search results.';
  } else {
    $msg = 'Nothing found.';
  }
} else if(!empty($submit)) {
  $msg = 'Fill in all the fields!';
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
          <p><strong><?php echo $msg; ?></p></strong>
          <?php } ?>
          <form action="index.php?p=clonechecker&do=search" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Clone Checker</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>IP Address</strong>
                    <div class="graytext">The IP Address you want to retrive the accounts of. You can find a user"s IP address by using the <a href="index.php?p=ip">IP Address</a> tool.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="query" value="<?php echo $query; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Check" class="realbutton" accesskey="s">
                  </td>
                </tr>
              </table>
            </div>
          </form>
          <br />
          <?php if($results > 0) { ?>
          <div class="tableborder">
            <div class="tableheaderalt">Search Results</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="1%" align="center">ID</td>
                <td class="tablesubheader" width="29%">Name</td>
                <td class="tablesubheader" width="30%" align="center">E-Mail Address</td>
                <td class="tablesubheader" width="30%" align="center">Join date</td>
                <td class="tablesubheader" width="10%" align="center">Edit</td>
              </tr>
              <?php
                while($row = mysqli_fetch_assoc($get_users)) {
              ?>
              <tr>
                <td class="tablerow1" align="center">
                  <?php echo $row['id']; ?>
                </td>
                <td class="tablerow2"><strong><?php echo $row['name']; ?></strong>
                  <div class="desctext">
                    <?php echo $row['ipaddress_last']; ?> [<a href="http://who.is/whois-ip/ip-address/<?php echo $row['ipaddress_last']; ?>/" target="_blank">WHOIS</a>]</div>
                </td>
                <td class="tablerow2" align="center">
                  <a href="mailto:<?php echo $row['email']; ?>">
                    <?php echo $row['email']; ?>
                  </a>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo $row['hbirth']; ?>
                </td>
                <td class="tablerow2" align="center">
                  <a href="index.php?p=edituser&key=<?php echo $row['id']; ?>"><img src="<?php echo $housekeeping; ?>images/edit.gif" alt="Edit User Data"></a>
                </td>
              </tr>
              <?php } ?>
            </table>
          </div>
          <?php } ?>
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