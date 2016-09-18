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

if($groupid > 0) {
  $check = mysqli_query($connection, "SELECT type FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);

  if($exists > 0) {
    $check2 = mysqli_query($connection, "SELECT groupid FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_errors());
    $already_member = mysqli_num_rows($check2);

    if($already_member > 0) {
      mysqli_query($connection, "DELETE FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
?>
  <script type="text/javascript">
    location.href = habboReqPath + "group_profile.php?id=<?php echo $groupid; ?>";
  </script>
  <p>You have successfully left this group.</p>
  <p>Please wait, you are being redirected..</p>
<?php
    } else {
      exit;
    }
  } else {
    exit;
  }
}
?>