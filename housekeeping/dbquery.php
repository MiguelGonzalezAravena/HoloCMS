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

$pagename = 'Database Toolbox - Manual Query';
$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
$msg = '';

if(!empty($query)) {
  $msg = 'Executing query on ' . $sqldb . '...<br />';
  $request = mysqli_query($connection, $query) or mysqli_error($connection);
  if(!empty(mysqli_error($connection))) {
    $msg .= '</strong>Failure. The following error was encountered: <strong>' . mysqli_error($connection);
  } else {
    $affected_rows = mysqli_num_rows($request);
    $msg .= '</strong>Success! Rows affected: <strong>' . $affected_rows;
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
          <?php if(!empty($msg)){ ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form method="post">
            <b>MySQL Query on <?php echo $sqldb; ?>:</b>
            <br />
            <textarea name="query" cols="60" rows="10"><?php echo $query; ?></textarea>
            <br />
            <input type="submit">
          </form>
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