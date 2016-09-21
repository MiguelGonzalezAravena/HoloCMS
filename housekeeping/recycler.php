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

$pagename = 'Recycler Options';
$recycler_enable = isset($_POST['recycler_enable']) ? (int) $_POST['recycler_enable'] : '';
$recycler_minownertime = isset($_POST['recycler_minownertime']) ? FilterText($_POST['recycler_minownertime']) : '';
$recycler_session_length = isset($_POST['recycler_session_length']) ? FilterText($_POST['recycler_session_length']) : '';
$recycler_session_expirelength = isset($_POST['recycler_session_expirelength']) ? FilterText($_POST['recycler_session_expirelength']) : '';
$msg = '';

if(!empty($recycler_enable)) {
  if(!empty($recycler_minownertime) && !empty($recycler_session_length) && !empty($recycler_session_expirelength)) {
    mysqli_query($connection, "UPDATE system_config SET sval = '{$recycler_enable}' WHERE skey = 'recycler_enable' LIMIT 1") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE system_config SET sval = '{$recycler_minownertime}' WHERE skey = 'recycle_minownertime' LIMIT 1") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE system_config SET sval = '{$recycler_session_length}' WHERE skey = 'recycler_session_length' LIMIT 1") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE system_config SET sval = '{$recycler_session_expirelength}' WHERE skey = 'recycler_session_expirelength' LIMIT 1") or die(mysqli_error($connection));
    $msg = 'Settings saved successfully.';
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Updated Server Settings (Recycler Options)', 'recycler.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
  } else {
    $msg = 'Please do not leave any fields blank. Settings not saved.';
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
          <?php require_once(dirname(__FILE__) . '/servermenu.php'); ?>
          <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <?php if(!empty($msg)){ ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=recycler&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Recycler Options</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Enable recycler</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="recycler_enable" class="dropdown">
                      <option value="1" <?php echo (FetchServerSetting( 'recycler_enable')==1 ? ' selected="selected"' : ''); ?>>Enabled</option>
                      <option value="0" <?php echo (FetchServerSetting( 'recycler_enable')==0 ? ' selected="selected"' : ''); ?>>Disabled</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Minimum owned time</b>
                    <div class="graytext">The minimum required amount of time since the furniture was bought before it can be used with the recycler.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="recycler_minownertime" value="<?php echo FetchServerSetting('recycler_minownertime'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Session length</b>
                    <div class="graytext">The length of a recycler session.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name='recycler_session_length' value="<?php echo FetchServerSetting('recycler_session_length'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Session expire length</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name='recycler_session_expirelength' value="<?php echo FetchServerSetting('recycler_session_expirelength'); ?>" size="30" class="textinput">
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