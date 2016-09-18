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
$allow_guests = false;

require_once(dirname(__FILE__) . '/../core.php'); 
require_once(dirname(__FILE__) . '/../includes/session.php');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$motto = isset($_POST['motto']) ? FilterText($_POST['motto']) : '';

if(!empty($motto)) {
  if(strlen($_POST['motto']) > 38) {
    echo $myrow['mission'];
  } else {
    mysqli_query($connection, "UPDATE users SET mission = '{$motto}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    echo $motto;
    @SendMUSData('UPRA' . $my_id);
  }
} else {
  echo $myrow['mission'];
}