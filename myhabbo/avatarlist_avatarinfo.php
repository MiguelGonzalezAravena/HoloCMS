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

$id = isset($_POST['anAccountId']) ? (int) $_POST['anAccountId'] : 0;
$ownerid = isset($_POST['ownerAccountId']) ? (int) $_POST['ownerAccountId'] : 0;
$online = 'habbo_' . (IsUserOnline($id) ? 'online_anim' : 'offline') . '_big.gif';
$badge = '';

$sql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$id}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);
$sql = mysqli_query($connection, "SELECT * FROM users_badges WHERE userid = '{$id}' AND iscurrent = '1' LIMIT 1");
$count = mysqli_num_rows($sql);
if($count != 0) {
	$badgerow = mysqli_fetch_assoc($sql);
	$badge = $badgerow['badgeid'];
}
?>
  <div class="avatar-list-info-container">
    <div class="avatar-info-basic clearfix">
      <div class="avatar-list-info-close-container">
        <a href="#" class="avatar-list-info-close" id="avatar-list-info-close-<?php echo $row['id']; ?>"></a>
      </div>
      <div class="avatar-info-image">
        <?php echo (!empty($badge) ? '<img src="' . $cimagesurl . $badgesurl . $badge . '">' : ''); ?>
        <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $row['figure']; ?>&size=l&direction=4&head_direction=4" alt="<?php echo $row['name']; ?>" />
      </div>
      <h4><a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['name']; ?>"><?php echo $row['name']; ?></a></h4>
      <p>
        <img src="<?php echo $web_gallery; ?>images/myhabbo/<?php echo $online; ?>" />
      </p>
      <p>
        <?php echo $shortname; ?> created on: <b><?php echo $row['hbirth']; ?></b>
       </p>
      <p>
      	<a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['name']; ?>" class="arrow">View <?php echo $shortname; ?>s page</a>
      </p>
      <p class="avatar-info-motto">
        <?php echo $row['mission']; ?>
      </p>
    </div>
  </div>