<?php
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/
require_once(dirname(__FILE__) . '/../core.php');
require_once(dirname(__FILE__) . '/../includes/session.php');

// Collect variables
$newskin = isset($_POST['skinId']) ? (int) $_POST['skinId'] : 0;
$stickie = isset($_POST['stickieId']) ? (int) $_POST['stickieId'] : 0;
empty($stickie) ? exit : '';

$check = mysqli_query($connection, "SELECT groupid,active FROM cms_homes_group_linker WHERE userid = '{$my_id}' AND active = '1' LIMIT 1") or die(mysqli_error($connection));
$linked = mysqli_num_rows($check);

if($linked > 0) {
  $linkdata = mysqli_fetch_assoc($check);
  $groupid = $linkdata['groupid'];
}

if($newskin == 1) {
  $skin = 'defaultskin';
} else if($newskin == 2) {
  $skin = 'speechbubbleskin';
} else if($newskin == 3) {
  $skin = 'metalskin';
} else if($newskin == 4) {
  $skin = 'noteitskin';
} else if($newskin == 5) {
  $skin = 'notepadskin';
} else if($newskin == 6) {
  $skin = 'goldenskin';
} else if($newskin == 7) {
  $skin = 'hc_machineskin';
} else if($newskin == 8) {
  $skin = 'hc_pillowskin';
} else if($newskin == 9 && $user_rank > 5) {
  $skin = 'nakedskin';
} else {
  $skin = 'defaultskin';
}

if(!empty($stickie)) {
  if($linked > 0) {
    $sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE groupid = '{$groupid}' AND id = '{$stickie}' LIMIT 1") or die(mysqli_error($connection));
  } else {
    $sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND id = '{$stickie}' LIMIT 1") or die(mysqli_error($connection));
  }
}

$num = mysqli_num_rows($sql);

if($num > 0) {
  $dat = mysqli_fetch_assoc($sql);
  if($linked > 0) {
    mysqli_query($connection, "UPDATE cms_homes_stickers SET skin = '{$skin}' WHERE groupid = '{$groupid}' AND type = '3' AND id = '{$stickie}' LIMIT 1");
  } else {
    mysqli_query($connection, "UPDATE cms_homes_stickers SET skin = '{$skin}' WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '3' AND id = '{$stickie}' LIMIT 1");      
  }
  header('X-JSON: {"cssClass": "n_skin_' . $skin . '", "type": "stickie", "id": "' . $stickie . '"}');
  echo 'SUCCESS';
} else {
  echo 'ERROR';
}
?>