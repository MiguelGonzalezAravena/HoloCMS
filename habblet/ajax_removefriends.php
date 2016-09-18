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
$pagesize = isset($_POST['pageSize']) ? (int) $_POST['pageSize'] : 0;
$friends = isset($_POST['friendList']) ? FilterText($_POST['friendList']) : '';
$friendid = isset($_POST['friendId']) ? (int) $_POST['friendId'] : 0;;

if(!empty($friends)) {
  foreach($friends as $val) {
    $sql = mysqli_query($connection, "DELETE FROM messenger_friendships WHERE userid = '{$my_id}' AND friendid = '{$val}'");
    $sql = mysqli_query($connection, "DELETE FROM messenger_friendships WHERE friendid = '{$my_id}' AND userid = '{$val}'");
  }
} elseif(!empty($friendId)) {
  $sql = mysqli_query($connection, "DELETE FROM messenger_friendships WHERE userid = '{$my_id}' AND friendid = '{$friendid}'");
  $sql = mysqli_query($connection, "DELETE FROM messenger_friendships WHERE friendid = '{$my_id}' AND userid = '{$friendid}'");
} else {
  echo 'Unknown error!';
}
header('Location: ajax_friendmanagement.php?pageNumber=1&pageSize=' . $pagesize);
?>
