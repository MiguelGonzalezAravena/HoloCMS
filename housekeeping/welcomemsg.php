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

$pagename = 'Welcome Message Options';
$welcomemessage_enable = isset($_POST['welcomemessage_enable']) ? (int) $_POST['welcomemessage_enable'] : 0;
$welcomemessage_text = isset($_POST['welcomemessage_text']) ? FilterText($_POST['welcomemessage_text']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';

if(isset($welcomemessage_enable)) {
  mysqli_query($connection, "UPDATE system_config SET sval = '{$welcomemessage_enable}' WHERE skey = 'welcomemessage_enable' LIMIT 1") or die(mysqli_error($connection));
  mysqli_query($connection, "UPDATE system_strings SET var_en = '{$welcomemessage_text}' WHERE stringid = 'welcomemessage_text' LIMIT 1") or die(mysqli_error($connection));
  $msg = 'Settings saved successfully.';
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Updated Server Settings (Welcome Message Options)', 'welcomemsg.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
} else if(!empty($submit)) {
  $msg = 'Fill in all the fields!';
}

$check = mysqli_query($connection, "SELECT var_en FROM system_strings WHERE stringid = 'welcomemessage_text' LIMIT 1") or die(mysqli_error($connection));
$row = mysqli_fetch_assoc($check);

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
          <form action="index.php?p=welcomemsg&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Welcome Message Options</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Enable Welcome Message</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="welcomemessage_enable" class="dropdown">
                      <option value="1"<?php echo (FetchServerSetting('welcomemessage_enable') == 1 ? ' selected="selected"' : ''); ?>>Enabled</option>
                      <option value="0"<?php echo (FetchServerSetting('welcomemessage_enable') == 0 ? ' selected="selected"' : ''); ?>>Disabled</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Welcome Message</b>
                    <div class="graytext">The actual message that will be shown to the user upon login, if enabled.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="welcomemessage_text" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext"><?php echo $row['var_en']; ?></textarea>
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
