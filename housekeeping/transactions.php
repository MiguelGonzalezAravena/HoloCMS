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

$pagename = 'Transactions';
$query = isset($_POST['query']) ? (int) $_POST['query'] : '';
$msg = '';
$results = '';

if(!empty($query)) {
  $get_logs = mysqli_query($connection, "SELECT * FROM cms_transactions WHERE userid = '{$query}' ORDER BY id DESC") or die(mysqli_error($connection));
  $results = mysqli_num_rows($get_logs);

  if($results > 0) {
    $msg = 'Now showing user\'s transaction logs..';
  } else {
    $msg = 'Nothing found.';
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
          <?php if(!empty($msg)) { ?>
          <p><strong><?php echo $msg; ?></p></strong>
          <?php } ?>
          <form action="index.php?p=transactions&do=search" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Transaction Logs</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>User ID</strong>
                    <div class="graytext">The ID of the user whom's transaction logs you want to view. To look for a User's ID, use <a href="index.php?p=uid">the User ID tool</a>.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="query" value="<?php echo $query; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <tr>
                    <td align="center" class="tablesubheader" colspan="2">
                      <input type="submit" value="Retrive logs" class="realbutton" accesskey="s">
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
                <td class="tablesubheader" width="25%" align="center">Date</td>
                <td class="tablesubheader" width="50%" align="center">Description</td>
                <td class="tablesubheader" width="25%" align="center">Amount</td>
              </tr>
              <?php
                while($row = mysqli_fetch_assoc($get_logs)) {
              ?>
              <tr>
                <td class="tablerow1" align="center">
                  <?php echo $row['date']; ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo $row['descr']; ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo $row['amount']; ?>
                </td>
              </tr>
              <?php
                }
              ?>
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