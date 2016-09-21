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
require_once(dirname(__FILE__) . '/../includes/session.php');

// Collect variables
$widget = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;

$check = mysqli_query($connection, "SELECT groupid,active FROM cms_homes_group_linker WHERE userid = '{$my_id}' AND active = '1' LIMIT 1") or die(mysqli_error($connection));
$linked = mysqli_num_rows($check);

if($linked > 0) {
  $linkdata = mysqli_fetch_assoc($check);
  $groupid = $linkdata['groupid'];
}

if(!empty($widget)) {
  if($linked > 0) {
    $sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE groupid = '{$groupid}' AND type = '2' AND id = '{$widget}' LIMIT 1") or die(mysqli_error($connection));
  } else {
    $sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' AND id = '{$widget}' LIMIT 1") or die(mysqli_error($connection));
  }
}

$num = mysqli_num_rows($sql);

if($num > 0) {
  $row = mysqli_fetch_assoc($sql);
  if($linked > 0) {
    mysqli_query($connection, "DELETE FROM cms_guestbook WHERE widget_id = '{$widget}'");
    mysqli_query($connection, "DELETE FROM cms_homes_stickers WHERE groupid = '{$groupid}' AND type = '2' AND id = '{$widget}' LIMIT 1") or die(mysqli_error($connection));
  } else {
    mysqli_query($connection, "DELETE FROM cms_guestbook WHERE widget_id = '{$widget}'");
    mysqli_query($connection, "DELETE FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '2' AND id = '{$widget}' LIMIT 1") or die(mysqli_error($connection));
  }
  echo 'SUCCESS';
} else {
  echo 'ERROR';
}

?>