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
require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
$badge = isset($_POST['code']) ? FilterText($_POST['code']) : '';
$appkey = isset($_POST['__app_key']) ? FilterText($_POST['__app_key']) : 'HoloCMS';

(empty($groupid)) ? exit : '';
($appkey != 'HoloCMS') ? exit : '';
$badge = str_replace('NaN', '', $badge); // NaN = invalid stuff
$check = mysqli_query($connection, "SELECT member_rank FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank > 1 AND is_pending = '0' LIMIT 1") or die(mysqli_error($connection));
$is_member = mysqli_num_rows($check);
if($is_member > 0) {
  $my_membership = mysqli_fetch_assoc($check);
  $member_rank = $my_membership['member_rank'];
  ($member_rank < 2) ? exit : '';
} else {
  exit;
}

$check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
$valid = mysqli_num_rows($check);
$row = mysqli_fetch_assoc($check);
if($valid > 0) {
  $groupdata = mysqli_fetch_assoc($check);
} else {
  exit;
}

if($badge != $row['badge']) {
  if($row['badge'] != 'b0503Xs09114s05013s05015') {
    $image = 'habbo-imaging/badge-fill/' . $row['badge'] . '.gif';
    if(file_exists($image)) {
      unlink($image);
    }
  } else {
    mysqli_query($connection, "UPDATE groups_details SET badge = '{$badge}' WHERE id = '{$groupid}' LIMIT 1");
    header('Location: group_profile.php?id=' . $groupid . '&x=BadgeUpdated');
  }
}
mysqli_query($connection, "UPDATE groups_details SET badge = '{$badge}' WHERE id = '{$groupid}' LIMIT 1");
header('Location: group_profile.php?id=' . $groupid . '&x=BadgeUpdated');
?>