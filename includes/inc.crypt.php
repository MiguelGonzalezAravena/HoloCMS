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
(!defined('IN_HOLOCMS')) ? header('Location: ../index.php') : '';
require_once(dirname(__FILE__) . '/../config.php');

function HoloHash($password, $username) {
  global $encryption;
  switch ($encryption) {
    case 'new':
      $string = sha1($password . strtolower($username));
      break;
    case 'old':
      $random_salt = $hashtext;
      $string = md5($random_salt . $password);
      break;
    case 'bad':
      $string = sha1($password);
      break;
    case 'verybad':
      $string = $password;
      break;
    default:
      echo '<h1>Alert</h1><hr />You didn\'t follow my instructions! Please run install.php step 1 ONLY to get an update config.php.<hr /><i>HoloCMS</i>';
      break;
  }
  return $string;
}
?>