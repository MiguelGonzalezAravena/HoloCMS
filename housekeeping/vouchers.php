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

$pagename = 'Vouchers'; 
$voucher = isset($_POST['voucher']) ? FilterText($_POST['voucher']) : '';
$type = isset($_POST['type']) ? FilterText($_POST['type']) : '';
$credits = isset($_POST['credits']) ? FilterText($_POST['credits']) : ''; // This can be number or string.
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';

if(!empty($voucher) && !empty($type) && !empty($credits)) {
  mysqli_query($connection, "INSERT INTO vouchers(voucher, type, credits) VALUES('{$voucher}', '{$type}', '{$credits}')") or die(mysqli_error($connection)); 
  $msg = 'The voucher has been created successfully.';
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Created voucher {$voucher} worth {$credits} credits', 'vouchers.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
} else if(!empty($submit)) {
  $msg = 'Please do not leave any fields blank.';
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
          <form action="index.php?p=vouchers&do=create" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Create Voucher</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Redemption Code</strong>
                    <div class="graytext">The voucher code the user must enter to recieve the credits.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="voucher" value="<?php echo randomVoucher(8); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Type</strong>
                    <div class="graytext">
                      The type of voucher that can be redeemed, there are two options; Credits or Item, Credits will be a normal credit voucher, Item will be a furniture redemption voucher.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select size="1" name="type">
                      <option value="credits">Credits</option>
                      <option value="item">Item</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Amount</strong>
                    <div class="graytext">The amount of credits/item a user will recieve upon entering the redemption code. For Item purchases input the correct item CCT name.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="credits" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Create Voucher" class="realbutton" accesskey="s">
                  </td>
                </tr>
              </table>
            </div>
          </form>
          <br />
          <?php 
            $get_vouchers = mysqli_query($connection, "SELECT * FROM vouchers") or die(mysqli_error($connection)); 
            $total = mysqli_num_rows($get_vouchers);
          ?>
          <div class="tableborder">
            <div class="tableheaderalt">Existing vouchers</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="60%" align="center">Redemption Code</td>
                <td class="tablesubheader" width="40%" align="center">Credits</td>
              </tr>
              <?php
                if($total == 0) {
                  echo '<tr align="center"><td colspan="2" class="tablerow1"><strong>No vouchers.</strong></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($get_vouchers)) {
              ?>
              <tr>
                <td class="tablerow1" align="center">
                  <?php echo $row['voucher']; ?>
                </td>
                <td class="tablerow2" align="center">
                  <?php echo $row['credits']; ?>
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