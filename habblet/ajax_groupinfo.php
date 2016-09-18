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
$allow_guests = true;

require_once(dirname(__FILE__) . '/../core.php'); 
require_once(dirname(__FILE__) . '/../includes/session.php');

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
$exists = 0;

if(!empty($groupid)) {
  $check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  $data = mysqli_fetch_assoc($check);
} else {
?>
  <div class="groups-info-basic">
    <div class="groups-info-close-container">
      <a href="#" class="groups-info-close"></a>
    </div>
    Invalid group or no group supplied.
  </div>
<?php
  exit;
}

($exists < 1) ? exit : '';
?>
  <div class="groups-info-basic">
    <div class="groups-info-close-container">
      <a href="#" class="groups-info-close"></a>
    </div>
    <div class="groups-info-icon"><a href="group_profile.php?id=<?php echo $groupid; ?>"><img src="<?php echo $path; ?>habbo-imaging/badge-fill/<?php echo $data['badge']; ?>.gif" /></a></div>
    <h4><a href="group_profile.php?id=<?php echo $groupid; ?>"><?php echo HoloText($data['name']); ?></a></h4>
    <p>
      Group created:<br />
      <b><?php echo $data['created']; ?></b>
    </p>
    <div class="groups-info-description">
      <?php echo HoloText(nl2br($data['description'])); ?>
    </div>
  </div>