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

$slot = isset($_POST['slot']) ? (int) $_POST['slot'] : 1;
$figure = isset($_POST['figure']) ? FilterText($_POST['figure']) : '';
$gender = isset($_POST['gender']) ? FilterText($_POST['gender']) : 'M';

if(!empty($figure) && !empty($gender) && !empty($slot)) {
  $gender = ($gender != 'M' && $gender != 'F') ? 'M' : $gender;
  $slot = ($slot != 1 && $slot != 2 && $slot != 3 && $slot != 4 && $slot != 5) ? 1 : $slot;

  $check = mysqli_query($connection, "SELECT gender FROM cms_wardrobe WHERE userid = '{$my_id}' AND slotid = '{$slot}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    mysqli_query($connection, "UPDATE cms_wardrobe SET figure = '{$figure}', gender = '{$gender}' WHERE userid = '{$my_id}' AND slotid = '{$slot}' LIMIT 1") or die(mysqli_error($connection));
  } else {
    mysqli_query($connection, "INSERT INTO cms_wardrobe(userid, slotid, figure, gender) VALUES('{$my_id}', '{$slot}', '{$figure}', '{$gender}')") or die(mysqli_error($connection));
  }
  // Now we need to attach this weird header so it updates the figure.
  // Took me a while to figure out and I still don't understand but meh.
  header('X-JSON: {"u": "http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $figure . '&size=s&direction=4&head_direction=4&gesture=sml","f":"' . $figure . '","g":77}');
}
?>