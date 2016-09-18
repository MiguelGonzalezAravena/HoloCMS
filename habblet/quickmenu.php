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

$key = isset($_GET['key']) ? FilterText($_GET['key']) : '';

switch($key) {
  case 'friends_all':
    $mode = 1;
    break;
  case 'groups':
    $mode = 2;
    break;
  case 'rooms':
    $mode = 3;
    break;
  default:
    $mode = 1;
    break;
}

switch($mode) {
  case 1:
    $str = 'friends';
    $get_em = mysqli_query($connection, "SELECT friendid,userid FROM messenger_friendships WHERE userid = '{$my_id}' OR friendid = '{$my_id}' ORDER BY friendid LIMIT 500") or die(mysqli_error($connection));
    break;
  case 2:
    $str = 'groups';
    $get_em = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND is_pending = '0' ORDER BY member_rank LIMIT 10") or die(mysqli_error($connection));
    break;
  case 3:
    $str = 'rooms';
    $get_em = mysqli_query($connection, "SELECT * FROM rooms WHERE owner  = '{$name}' ORDER BY name ASC LIMIT 100") or die(mysqli_error($connection));
    break;
}

$results = mysqli_num_rows($get_em);
$oddeven = 0;

if($results > 0) {
  if($mode == 1) {
?>
  <ul id="offline-friends">
    <?php
      while($row = mysqli_fetch_assoc($get_em)) {
        if($row['userid'] == $my_id) {
          $userdatasql = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$row['friendid']}' LIMIT 1") or die(mysqli_error($connection));
        } else {
          $userdatasql = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$row['userid']}' LIMIT 1") or die(mysqli_error($connection));
        }
        $user_exists = mysqli_num_rows($userdatasql);
        if($user_exists > 0) {
          $userrow = mysqli_fetch_assoc($userdatasql);
          $oddeven++;
          $even = (IsEven($oddeven)) ? 'odd' : 'even';
    ?>
    <li class="<?php echo $even; ?>"><a href="<?php echo $path; ?>user_profile.php?name=<?php echo $userrow['name']; ?>"><?php echo $userrow['name']; ?></a></li>
    <?php
        }
      }
    ?>
  </ul>
<?php } elseif($mode == 2) { ?>
  <ul id="quickmenu-groups">
    <?php
      $num = 0;
        while($row = mysqli_fetch_assoc($get_em)) {
          $num++;
          $group_id = $row['groupid'];
          $check = mysqli_query($connection, "SELECT name,ownerid FROM groups_details WHERE id = '{$group_id}' LIMIT 1") or die(mysqli_error($connection));
          $groupdata = mysqli_fetch_assoc($check);
    ?>
    <li class="<?php echo (IsEven($num) ? 'odd' : 'even'); ?>">
      <?php echo ($row['is_current'] == 1 ? '<div class="favourite-group" title="Favourite"></div>' : ''); ?>
      <?php echo ($row['member_rank'] > 1 && $groupdata['ownerid'] != $my_id  ? '<div class="admin-group" title="Admin"></div>' : ''); ?>
      <?php echo ($row['member_rank'] > 1 && $groupdata['ownerid'] == $my_id  ? '<div class="owned-group" title="Owner"></div>' : ''); ?>
      <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $group_id; ?>"><?php echo $groupdata['name']; ?></a>
    </li>
    <?php } ?>
  </ul>
<?php } elseif($mode == 3) { ?>
  <ul id="quickmenu-rooms">
    <?php
      while ($row = mysqli_fetch_assoc($get_em)) {
        $oddeven++;
        $even = (IsEven($oddeven)) ? 'odd' : 'even';
    ?>
    <li class="<?php echo $even; ?>">
      <a href="<?php echo $path; ?>client.php?forwardId=2&amp;roomId=<?php echo $row['id']; ?>" onclick="roomForward(this, '<?php echo $row['id']; ?>', 'private'); return false;" target="client" id="room-navigation-link_<?php echo $row['id']; ?>"><?php echo $row['name']; ?></a></li>
    <?php } ?>
  </ul>
<?php
  } else {
    echo 'Invalid mode';
  }
} else {
?>
  <ul id="quickmenu-<?php echo $str; ?>">
    <li class="odd">You don't have any <?php echo $str; ?> yet</li>
  </ul>
<?php
}

if($mode == 3) {
?>
  <p class="create-room">
    <a href="<?php echo $path;  ?>client.php?shortcut=roomomatic" onclick="HabboClient.openShortcut(this, 'roomomatic'); return false;" target="client">Create a new room</a>
  </p>
<?php } elseif($mode == 2) { ?>
  <p class="create-group"><a href="#" onclick="GroupPurchase.open(); return false;">Create a group</a></p>
<?php } ?>