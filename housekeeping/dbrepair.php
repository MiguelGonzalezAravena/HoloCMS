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

$pagename = 'Database Toolbox - Optimize';
$msg = 'Repairing tables...</strong> (Note: Tables may not be \'broken\', but this feature <i>attempts</i> to repair tables, wether it\'s needed or not)';

$getTables = mysqli_query($connection, "SHOW TABLES FROM {$sqldb}") or die(mysqli_error($connection));
while($tmp = mysqli_fetch_array($getTables)) {
  $table = $tmp[0];
  $msg .= '<br />Repairing table ' . $tmp[0] . '...';
  mysqli_query($connection, "REPAIR TABLE {$tmp[0]}") or die(mysqli_error($connection));
  $msg .= '<strong>OK!</strong>';
}
$msg .= '<br /><br />Tables in database optimized successfully!<strong>';

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
          <?php if(isset($msg)){ ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
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