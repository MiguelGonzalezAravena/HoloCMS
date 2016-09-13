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
(!$hkzone ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

$pagename = 'Loader Configuration';
$ip = isset($_POST['ip']) ? FilterText($_POST['ip']) : '';
$texts = isset($_POST['texts']) ? FilterText($_POST['texts']) : '';
$variables = isset($_POST['variables']) ? FilterText($_POST['variables']) : '';
$dcr = isset($_POST['dcr']) ? FilterText($_POST['dcr']) : '';
$reload_url = isset($_POST['reload_url']) ? FilterText($_POST['reload_url']) : '';
$localhost = isset($_POST['localhost']) ? (int) $_POST['localhost'] : 0;
$loader = isset($_POST['loader']) ? (int) $_POST['loader'] : 0;
$widescreen = isset($_POST['widescreen']) ? (int) $_POST['widescreen'] : 0;
$msg = '';

if(!empty($ip)) {
  if(!empty($texts) && !empty($variables) && !empty($dcr) && !empty($reload_url)) {
    mysqli_query($connection, "UPDATE cms_system SET value = '{$ip}' WHERE systemVar = 'ip'") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE cms_system SET value = '{$texts}' WHERE systemVar = 'texts'") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE cms_system SET value = '{$variables}' WHERE systemVar = 'variables'") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE cms_system SET value = '{$dcr}' WHERE systemVar = 'dcr'") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE cms_system SET value = '{$reload_url}' WHERE systemVar = 'reload_url'") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE cms_system SET value = '{$localhost}' WHERE systemVar = 'localhost'") or die(mysqli_error($connection));
    mysqli_query($connection, "UPDATE cms_system SET value = '{$loader}' WHERE systemVar = 'loader'") or die(mysqli_error($connection));
    $msg = 'Settings saved successfully.';
    mysqli_query($connection, "UPDATE cms_content SET contentvalue = '{$widescreen}' WHERE contentkey = 'client-widescreen'");
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Updated CMS Settings (Loader Configuration)', 'loader.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
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
          <?php require_once(dirname(__FILE__) . '/sitemenu.php'); ?>
            <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <?php if(!empty($msg)) { ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=loader&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Loader setup</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>External IP Address</b>
                    <div class="graytext">The <b>external</b> IP address or hostname Holograph Emulator is located on. The second field is the port, wich is automaticly detected.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name='ip' value="<?php echo config('ip'); ?>" size="30" class="textinput">&nbsp;:&nbsp;
                    <input type="text" name='nothing' value="<?php echo FetchServerSetting('server_game_port'); ?>" disabled='disabled' size='6' maxlength='6' class='textinput'>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>External Texts</b>
                    <div class="graytext">URL that points to your external texts.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name='texts' value="<?php echo config('texts'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>External Variables</b>
                    <div class="graytext">URL that points to your external variables.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="variables" value="<?php echo config('variables'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Habbo DCR</b>
                    <div class="graytext">URL that points to your Habbo DCR file. Crossdomain protection will be bypassed automaticly where needed.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="dcr" value="<?php echo config('dcr'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Reload URL</b>
                    <div class="graytext">URL that points to the loader.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="reload_url" value="<?php echo config('reload_url'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Widescreen</b>
                    <div class="graytext">This determines wether the game client should display in widescreen mode or not.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="widescreen" class="dropdown">
                      <option value="1" <?php echo (getContent( 'client-widescreen')==1 ? ' selected="selected"' : ''); ?>>Enabled</option>
                      <option value="0" <?php echo (getContent( 'client-widescreen')==0 ? ' selected="selected"' : ''); ?>>Disabled</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>V23 loader</b>
                    <div class="graytext">Do you want to get the V23 loader with 'Opening hotelname...' or do you just want the old loader?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="loader" class="dropdown">
                      <option value="1" <?php echo (config( 'loader')==1 ? ' selected="selected"' : ''); ?>>V23 loader</option>
                      <option value="0" <?php echo (config( 'loader')==0 ? ' selected="selected"' : ''); ?>>Non-V23 loader</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Server is on Localhost</b>
                    <div class="graytext">If Holograph Emulator is running on the same server/computer as HoloCMS, set this to 'Yes'.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="localhost" class="dropdown">
                      <option value="1" <?php echo (config( 'localhost')==1 ? ' selected="selected"' : ''); ?>>Yes</option>
                      <option value="0" <?php echo (config( 'localhost')==0 ? ' selected="selected"' : ''); ?>>No</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Save Configuration" class="realbutton" accesskey="s">
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
