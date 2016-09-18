<?php 
/*===================================================+ 
|| # HoloCMS - Website and Content Management System 
|+===================================================+ 
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+ 
|| # HoloCMS is provided "as is" and comes without 
|| # warrenty of any kind. HoloCMS is free software! 
|+===================================================*/ 
require_once(dirname(__FILE__) . '/../core.php');
require_once(dirname(__FILE__) . '/../includes/session.php');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$credits = $myrow['credits'];
$voucher = isset($_POST['voucherCode']) ? FilterText($_POST['voucherCode']) : '';

$check = mysqli_query($connection, "SELECT type, credits FROM vouchers WHERE voucher = '{$voucher}' LIMIT 1") or die(mysqli_error($connection)); 
$valid = mysqli_num_rows($check);

if($valid > 0) {
  $tmp = mysqli_fetch_assoc($check);
  $amount = $tmp['credits'];
  $resultcode = 'green';
  if($tmp['type'] == credits) {
    $credits = $credits + $amount;
    mysqli_query($connection, "UPDATE users SET credits = '{$credits}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    mysqli_query($connection, "DELETE FROM vouchers WHERE voucher = '{$voucher}' LIMIT 1") or die(mysqli_error($connection));
    mysqli_query($connection, "INSERT INTO cms_transactions(date, amount, descr, userid) VALUES('{$date_full}', '{$amount}', 'Credit voucher redeem', '{$my_id}')") or die(mysqli_error($connection)); // Appearently ' is not good enough, has to be fancy ` =/
    $result = 'You have redeemed ' . $amount . ' credits successfully.';
    @SendMUSData('UPRC' . $my_id);
  } else {
    $item = mysqli_query($connection, "SELECT tid FROM catalogue_items WHERE name_cct = '{$amount}' LIMIT 1") or die(mysqli_error($connection));
    $itemvalid = mysqli_num_rows($item);
    if($itemvalid > 0) {
      $itemtmp = mysqli_fetch_assoc($item);
      $itemid = $itemtmp['tid'];
      mysqli_query($connection, "INSERT INTO furniture(tid, ownerid) VALUES('{$itemid}', '{$my_id}')") or die(mysqli_error($connection));
      mysqli_query($connection, "DELETE FROM vouchers WHERE voucher = '{$voucher}' LIMIT 1") or die(mysqli_error($connection));
      mysqli_query($connection, "INSERT INTO cms_transactions(date, amount, descr, userid) VALUES('{$date_full}', '{$amount}', 'Item voucher redeem', '{$my_id}')") or die(mysqli_error($connection));
      $result = 'You have redeemed this item of furniture successfully.';
      @SendMUSData('UPRH' . $my_id);
    } else {
      $resultcode = 'red';
      $result = 'Item not valid, please contact an admin for assistance.';
    }
  }
} else {
  $resultcode = 'red';
  $result = 'Your redeem code could not be found. Please try again.';
}
?>
  <ul>
    <li class="even icon-purse">
      <div>You Currently Have:</div>
      <span class="purse-balance-amount"><?php echo $credits; ?> Credits</span>
      <div class="purse-tx"><a href="<?php echo $path; ?>transactions.php">Account transactions</a></div>
    </li>
  </ul>
  <div id="purse-redeem-result">
    <div class="redeem-error">
      <div class="rounded rounded-<?php echo $resultcode; ?>">
        <?php echo $result; ?>
      </div>
    </div>
  </div>