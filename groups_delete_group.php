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

// simple check to avoid most direct access
$refer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
$pos = strrpos($refer, 'group_profile.php');
($pos == false) ? exit : '';

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
(empty($groupid)) ? exit : '';

$check = mysqli_query($connection, "SELECT member_rank FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank > 1 AND is_pending = '0' LIMIT 1") or die(mysqli_error($connection));
$is_member = mysqli_num_rows($check);

if($is_member > 0) {
  $my_membership = mysqli_fetch_assoc($check);
  $member_rank = $my_membership['member_rank'];
} else {
  exit;
}

$check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
$valid = mysqli_num_rows($check);

if($valid > 0) {
  $groupdata = mysqli_fetch_assoc($check);
  $ownerid = $groupdata['ownerid'];
} else {
  exit;
}

if($ownerid != $my_id) {
  exit;
} else if($ownerid == $my_id) {
  error_reporting(0);
  $image = 'habbo-imaging/badge-fill/' . $groupdata['badge'] . '.gif';
  if(file_exists($image)) {
    unlink($image);
  }
  error_reporting(1);
  mysqli_query($connection, "DELETE FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
  mysqli_query($connection, "DELETE FROM groups_memberships WHERE groupid = '{$groupid}'");
  mysqli_query($connection, "DELETE FROM cms_homes_group_linker WHERE groupid = '{$groupid}'");
  mysqli_query($connection, "DELETE FROM cms_homes_stickers WHERE groupid = '{$groupid}'");
?>
  <p>The group has been deleted successfully.</p>
  <p>
    <a href="<?php echo $path; ?>me.php" class="new-button"><b>OK</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php } ?>