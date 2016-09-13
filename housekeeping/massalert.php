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
$musalert = isset($_POST['musalert']) ? FilterText($_POST['musalert']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';

if(!empty($alert)) {
  $counter = 0;
  $get_users = mysqli_query($connection, "SELECT id FROM users");
  while($row = mysqli_fetch_assoc($get_users)) {
    $counter++;
    mysqli_query($connection, "INSERT INTO cms_alerts(userid, type, alert) VALUES('{$row['id']}', '2', '{$alert}')");
    if($musalert == 'on') {
      @SendMUSData('HKTM' . $row['id'] . chr(2) . $alert);
    }
  }
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Mass Alert to all users on site', 'massalert.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
  $msg = 'Gave mass alert. Users processed: ' . $counter;
} else if(!empty($submit)) {
  $msg = 'Please do not leave the alert field blank.';
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
          <?php if(isset($msg)){ ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=massalert&do=placeAlert" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Mass Site Alert</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Alert</b>
                    <div class="graytext">The actual message that will be shown to the user.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="alert" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext"><?php echo $alert; ?></textarea>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Server Alert</strong>
                    <div class="graytext">If you check this, this alert will also be sent to online users on the server as a MOD-alert. If you do, please <b><u>do not use HTML</u></b>.</div>
                  </td>
                  <td class="tablerow1" width="60%" valign="middle">
                    <input type="checkbox" name="musalert" value="on"<?php echo ($musalert=='on' ? ' checked="checked"' : ''); ?>> </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Give Alert" class="realbutton" accesskey="s">
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