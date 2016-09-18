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

$refer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
$pos = strrpos($refer, 'group_profile.php');
($pos == false) ? exit : '';

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
$targets = isset($_POST['targets']) ? FilterText($_POST['targets']) : '';
$targets = explode(',', $targets);

(empty($groupid)) ? exit : '';

$check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
$valid = mysqli_num_rows($check);
($valid < 1) ? exit : '';

// Loop through all the members
foreach($targets as $member) {
  if(is_numeric($member)) {
    $valid = mysqli_evaluate("SELECT COUNT(*) FROM users WHERE id = '{$member}' LIMIT 1");
    if($valid > 0) {
      mysqli_query($connection, "UPDATE groups_memberships SET is_pending = '0' WHERE userid = '{$member}' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
    }
  }
}

echo 'OK';
?>