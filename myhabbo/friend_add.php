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
$error = 0;

$id = isset($_POST['accountId']) ? (int) $_POST['accountId'] : 0;
$sql = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$id}' AND friendid = '{$my_id}'");
$rows = mysqli_num_rows($sql);
if($rows != 0) {
  $error = 1;
  $message = 'This person is already your friend.';
}

$sql = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$my_id}' AND friendid = '{$id}'");
$rows = mysqli_num_rows($sql);
if($rows != 0) {
  $error = 1;
  $message = 'This person is already your friend.';
}

$sql = mysqli_query($connection, "SELECT * FROM messenger_friendrequests WHERE userid_from = '{$my_id}' AND userid_to = '{$id}'");
$rows = mysqli_num_rows($sql);
if($rows != 0) {
  $error = 1;
  $message = 'You already requested a friendship from this person.';
}

$sql = mysqli_query($connection, "SELECT * FROM messenger_friendrequests WHERE userid_to = '{$my_id}' AND userid_from = '{$id}'");
$rows = mysqli_num_rows($sql);
if($rows != 0) {
  $error = 1;
  $message = 'This person already requested you to be their friend.';
}

if($id == $my_id) {
  $error = 1;
  $message = 'You cannot friend request yourself.';
}

if($error != 1) {
  mysqli_query($connection, "INSERT INTO messenger_friendrequests(userid_from, userid_to) VALUES('{$my_id}', '{$id}')");
  $message = 'Friend request has been sent successfully.';
}
?>Dialog.showInfoDialog("add-friend-messages", "<?php echo $message; ?>", "OK");