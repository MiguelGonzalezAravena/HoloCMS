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

// This file will not generate a valid XML document, although we're getting close.
echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<habbos>
<?php
  $sqll = mysqli_query($connection, "SELECT id, name, mission, figure FROM users ORDER BY online DESC LIMIT 10") or die(mysqli_error($connection));
  while ($row = mysqli_fetch_assoc($sqll)) {
    $form_badge = GetUserBadge($row['name']);
    $form_group_badge = GetUserGroupBadge($row['id']);
    $form_badge = ($form_badge ? $cimagesurl . $badgesurl . $form_badge . '.gif' : '');
    $form_group_badge = ($form_group_badge ? 'groupBadge="' . $path . 'habbo-imaging/badge.php?badge=' . $form_group_badge . '" ' : '');
    $status = (IsUserOnline($row['id']) ? 1 : 0);
?>
  <habbo id="<?php echo $row['id']; ?>" name="<?php echo $row['name']; ?>" motto="<?php echo FilterText($row['mission']); ?>" url="<?php echo $path; ?>user_profile.php?name=<?php echo $row['name']; ?>" image="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $row['figure']; ?>&size=b&direction=4&head_direction=3&gesture=sml" badge="<?php echo $form_badge; ?>" status="<?php echo $status; ?>" <?php echo $form_group_badge; ?>/>
<?php
  }
?>
</habbos>
