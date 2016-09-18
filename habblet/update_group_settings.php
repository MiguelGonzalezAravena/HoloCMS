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

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
$name = isset($_POST['name']) ? FilterText($_POST['name']) : '';
$description = isset($_POST['description']) ? FilterText($_POST['description']) : '';
$type = isset($_POST['type']) ? (int) $_POST['type'] : 0;

(empty($groupid)) ? exit : '';

$check = mysqli_query($connection, "SELECT member_rank FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank > 1 AND is_pending = '0' LIMIT 1") or die(mysqli_error($connection));
$is_member = mysqli_num_rows($check);

if($is_member > 0) {
  $my_membership = mysqli_fetch_assoc($check);
  $member_rank = $my_membership['member_rank'];
} else {
?>
  Editing group settings unsuccessful
  <p>
    <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>" class="new-button"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
  exit;
}

$check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
$valid = mysqli_num_rows($check);

if($valid > 0) {
  $groupdata = mysqli_fetch_assoc($check);
  $ownerid = $groupdata['ownerid'];
} else {
?>
  Editing group settings unsuccessful
  <p>
    <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>" class="new-button"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
  exit;
}
($ownerid != $my_id) ? exit : '';

if($groupdata['type'] == 3 && $type != 3) {
  echo 'You may not change the group type if it is set to 3.';
  exit;
} // you can't change the group type once you set it to 4, fool

if($type < 0 || $type > 3) {
  echo 'Invalid group type.';
  exit;
} // this naughty user doesn't even deserve an settings update

if(strlen(HoloText($name)) > 25) {
?>
  Name too long
  <p>
    <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>" class="new-button"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php } elseif(strlen(HoloText($description)) > 200) { ?>
  Description too long
  <p>
    <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>" class="new-button"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php } elseif(strlen(HoloText($name)) < 1) { ?>
  Please give a name
  <p>
    <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>" class="new-button"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
} else {
  mysqli_query($connection, "UPDATE groups_details SET name = '{$name}', description = '{$description}', type = '{$type}' WHERE id = '{$groupid}' AND ownerid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
?>
  Editing group settings successful
  <p>
    <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $groupid; ?>" class="new-button"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php } ?>