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

$pagename = 'HoloCMS Configuration';
$sitename = isset($_POST['sitename']) ? FilterText($_POST['sitename']) : '';
$shortname = isset($_POST['shortname']) ? FilterText($_POST['shortname']) : '';
$enable_sso = isset($_POST['enable_sso']) ? (int) $_POST['enable_sso'] : 0;
$start_credits = isset($_POST['credits']) ? (int) $_POST['credits'] : 0;
$language = isset($_POST['language']) ? FilterText($_POST['language']) : '';
$analytics = isset($_POST['analytics']) ? FilterText($_POST['analytics']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';

if(!empty($sitename) && !empty($shortname) && isset($enable_sso) && isset($start_credits) && !empty($language)) {
  mysqli_query($connection, "UPDATE cms_system SET value = '{$sitename}' WHERE systemVar = 'sitename'") or die(mysqli_error($connection));
  mysqli_query($connection, "UPDATE cms_system SET value = '{$shortname}' WHERE systemVar = 'shortname'") or die(mysqli_error($connection));
  mysqli_query($connection, "UPDATE cms_system SET value = '{$enable_sso}' WHERE systemVar = 'enable_sso'") or die(mysqli_error($connection));
  mysqli_query($connection, "UPDATE cms_system SET value = '{$language}' WHERE systemVar = 'language'") or die(mysqli_error($connection));
  mysqli_query($connection, "UPDATE cms_system SET value = '{$start_credits}' WHERE systemVar = 'start_credits'") or die(mysqli_error($connection));
  mysqli_query($connection, "UPDATE cms_system SET value = '{$analytics}' WHERE systemVar = 'analytics'") or die(mysqli_error($connection));
  $msg = 'Settings saved successfully.';
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Updated CMS Settings (General Configuration)', 'cms_config.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
} else if(!empty($submit)) {
  $msg = 'Please do not leave any fields blank. Settings not saved.';
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
          <form action="index.php?p=site&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">HoloCMS Configuration</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Sitename</b>
                    <div class="graytext">This is the full name of your site, eg. 'Holo Hotel'.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="sitename" value="<?php echo config('sitename'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Shortname</b>
                    <div class="graytext">This is the 'shortname' of your site, eg. 'Holo'.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="shortname" value="<?php echo config('shortname'); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Enable SSO</b>
                    <div class="graytext">If enabled, SSO tickets will be generated and users will be logged on using SSO.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="enable_sso" class="dropdown">
                      <option value="1"<?php echo (config('enable_sso') == 1 ? ' selected="selected"' : ''); ?>>Enabled</option>
                      <option value="0"<?php echo (config('enable_sso') == 0 ? ' selected="selected"' : ''); ?>>Disabled</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Language</b>
                    <div class="graytext">This is the 2-character language code your site will read locale files from, eg. 'en'. If the language is invalid, English will be used.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="language" value="<?php echo config('language'); ?>" size="2" maxlength="2" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Start credits</b>
                    <div class="graytext">How many credits do people get if they register on the site?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="credits" value="<?php echo config('start_credits'); ?>" size="2" maxlength="5" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Google Analytics Code</b>
                    <div class="graytext">Code for Google Analytics placed in every page.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="analytics" cols="61" rows="3" wrap="soft" id="sub_desc" class="multitext"><?php echo HoloText(config('analytics')); ?></textarea>
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Save Configuration" class="realbutton" accesskey="s">
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