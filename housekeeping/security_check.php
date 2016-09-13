<?php
/*==================================+
|| # HoloCMS - Website and Content Management System
|+==================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+==================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+==================================*/
require_once(dirname(__FILE__) . '/../core.php')

if(isset($_SESSION['username'])) {
  $username = $_SESSION['username'];
  $password = $_SESSION['password'];

  $sql = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$username}'") or die(mysqli_error($connection));
  $row = mysqli_fetch_assoc($sql);
  if($row['password'] != $password) {
    session_destroy();
  }
}
header('Location: index.php');
?>