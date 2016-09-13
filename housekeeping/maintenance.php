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

$pagename = 'Maintenance';
$site_closed = isset($_POST['site_closed']) ? (int) $_POST['site_closed'] : 0;
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';

if(!empty($submit)) {
  mysqli_query($connection, "UPDATE cms_system SET value = '{$site_closed}' WHERE systemVar = 'site_closed'") or die(mysqli_error($connection));
  $msg = 'Settings saved successfully.';
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES ('Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
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
          <form action="index.php?p=maintenance&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Turn your site on/off</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Close Site</b>
                    <div class="graytext">If enabled, your site will be closed and show a maintenance page to regular users. Administrators can still login through Housekeeping.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="site_closed" class="dropdown">
                      <option value="1" <?php echo (config('site_closed') == 1 ? ' selected="selected"' : ''); ?>>Site Closed</option>
                      <option value="0" <?php echo (config('site_closed') == 0 ? ' selected="selected"' : ''); ?>>Site Open</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Apply" class="realbutton" accesskey="s">
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