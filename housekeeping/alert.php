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
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$pagename = 'Alert';
$alert = isset($_POST['alert']) ? HoloText($_POST['alert']) : '';
$username = isset($_POST['username']) ? FilterText($_POST['username']) : '';
$musalert = isset($_POST['musalert']) ? FilterText($_POST['musalert']) : '';

if(!empty($alert) && !empty($username)) {
  $check = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$username}' LIMIT 1") or die(mysqli_error($connection));
  $valid = mysqli_num_rows($check);
  if($valid > 0) {
    $tmp = mysqli_fetch_assoc($check);
    $userid = $tmp['id'];
    if(is_numeric($userid)) {
        mysqli_query($connection, "INSERT INTO cms_alerts(userid, type, alert) VALUES ('{$userid}', '2', '{$alert}')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES ('Housekeeping', 'Sent alert to user', 'alert.php', '{$my_id}', '{$userid}', '{$date_full}')") or die(mysqli_error($connection));
        $msg = 'Gave alert to user.';
        if($musalert == 'on') {
          @SendMUSData('HKMW' . $userid . chr(2) . $alert);
        }
    } else {
      $msg = 'Error processing user';
    }
  } else {
    $msg = 'This user does not exist.';
  }
} elseif($do == 'quickreply' && !empty($key)) {
  $check = mysqli_query($connection, "SELECT * FROM cms_help WHERE id = '{$key}' LIMIT 1") or die(mysqli_error($connection));
  $tmp = mysqli_fetch_assoc($check);
  if($tmp['picked_up'] != 1) {
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES ('Housekeeping', 'Automaticly picked up help query (ID: {$key})', 'alert.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE cms_help SET picked_up = '1' WHERE id = '{$key}' LIMIT 1") or die(mysqli_error($connection));
  }
  $alert = "Hello, my name is {$name}. I am sending you this message in reply to your help inquiry sent on {$tmp['date']}, with the subject '" . HoloText($tmp['subject']) . "'.\n\n{$name},\n{$shortname} Player Support.";
  $username = $tmp['username'];
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
          <?php if(isset($msg)) { ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=alert&do=placeAlert" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Alert User</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Username</b>
                    <div class="graytext">The name of the user you want to give this alert to.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="username" value="<?php echo $username; ?>" size="50" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Alert</b>
                    <div class="graytext">The actual message that will be shown to the user.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="alert" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext">
                      <?php echo $alert; ?>
                    </textarea>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Server Alert</strong>
                    <div class="graytext">If you check this, this alert will also be sent to the user on the server as a MOD-alert. If you do, please do not use HTML.</div>
                  </td>
                  <td class="tablerow1" width="60%" valign="middle">
                    <input type="checkbox" name="musalert"<?php echo ($musalert == 'on' ? ' checked="checked"' : ''); ?>> </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Give Alert" class="realbutton" accesskey="s">
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
