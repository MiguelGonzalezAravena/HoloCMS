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
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$pagename = 'Give Credits';
$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
$amount = isset($_POST['amount']) ? (int) $_POST['amount'] : 0;

if(!empty($query)) {
  $check = mysqli_query($connection, "SELECT id, name FROM users WHERE name = '{$query}' OR id = '{$query}' LIMIT 1") or die(mysqli_error($connection));
  $results = mysqli_num_rows($check);

  if($results > 0 && $amount > 0) {
    $row = mysqli_fetch_assoc($check);
    $query = $row['id'];
    $name = $row['name'];

    mysqli_query($connection, "UPDATE users SET credits = credits + {$amount} WHERE id = '{$query}' LIMIT 1") or die(mysqli_error($connection));
    mysqli_query($connection, "INSERT INTO cms_transactions(userid, date, amount, descr) VALUES('{$query}', '{$date_full}', '{$amount}', 'Housekeeping transfer/refund')") or die(mysqli_error($connection));
    $msg = 'Gave user ' . $name . ' ' . $amount . ' credits.';
    @SendMusData('UPRC' . $query);
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Gave user {$amount} credits', 'givecredits.php', '{$my_id}', '{$query}', '{$date_full}')") or die(mysqli_error($connection));
  } else {
    $msg = 'Amount is not valid or this user does not exist!';
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
          <form action="index.php?p=givecredits&do=give" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Give Credits / Refunds</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Username</strong>
                    <div class="graytext">The name or ID of the user you want to give the credits to.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="query" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Amount</strong>
                    <div class="graytext">The amount of credits you want to give.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="amount" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Give Credits" class="realbutton" accesskey="s">
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