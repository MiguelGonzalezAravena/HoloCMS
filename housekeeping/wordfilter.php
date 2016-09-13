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

$pagename = 'Wordfilter Options';
$wordfilter_enable = isset($_POST['wordfilter_enable']) ? (int) $_POST['wordfilter_enable'] : 0;
$wordfilter_censor = isset($_POST['wordfilter_censor']) ? FilterText($_POST['wordfilter_censor']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';

if(!empty($submit)) {
  mysqli_query($connection, "UPDATE system_config SET sval = '{$wordfilter_enable}' WHERE skey = 'wordfilter_enable' LIMIT 1") or die(mysqli_error($connection));
  mysqli_query($connection, "UPDATE system_config SET sval = '{$wordfilter_censor}' WHERE skey = 'wordfilter_censor' LIMIT 1") or die(mysqli_error($connection));
  $msg = 'Settings saved successfully.';
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Updated Server Settings (Wordfilter Options)', 'wordfilter.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
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
          <?php if(!empty($msg)) { ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=wordfilter&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Wordfilter Options</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Enable woldfilter</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="wordfilter_enable" class="dropdown">
                      <option value="1"<?php echo (FetchServerSetting('wordfilter_enable') == 1 ? ' selected="selected"' : ''); ?>>Enabled</option>
                      <option value="0"<?php echo (FetchServerSetting('wordfilter_enable') == 0 ? ' selected="selected"' : ''); ?>>Disabled</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Worldfilter censor</b>
                    <div class="graytext">The word that will replace filtered words.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="wordfilter_censor" value="<?php echo FetchServerSetting('wordfilter_censor'); ?>" size="30" class="textinput">
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