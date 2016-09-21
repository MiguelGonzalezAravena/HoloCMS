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

$pagename = 'Unban';
$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
$msg = '';

if(!empty($query)) {
  $rows = mysqli_evaluate("SELECT COUNT(*) FROM users_bans WHERE userid = '{$query}' OR descr = '{$query}' OR date_expire = '{$query}' OR ipaddress = '{$query}'");
  mysqli_query($connection, "DELETE FROM users_bans WHERE userid = '{$query}' OR descr = '{$query}' OR date_expire = '{$query}' OR ipaddress = '{$query}'") or die(mysqli_error($connection));
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', '(Mass) Unban performed [Query: {$query}]', 'unbantool.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
  $msg = 'Operation applied successfully. Affected bans: ' . $rows;
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
          <?php if(!empty($msg)){ ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=unban&do=run" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">(Mass) Unban</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>IP Address</b> OR <b>User ID</b> OR <b>Expire Date</b> OR <b>Reason</b>
                    <div class="graytext">Variable wich the ban must contain to unban it.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="query" value="<?php echo $query; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Unban" class="realbutton" accesskey="s">
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