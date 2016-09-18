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

$name = FilterText($_POST['name']);
$filter = preg_replace("/[^a-z\d\-=\?!@:\.]/i", "", $name);

$tmp = mysqli_query($connection, "SELECT id FROM users WHERE name = '".$name."' LIMIT 1") or die(mysqli_error($connection));
$tmp = mysqli_num_rows($tmp);

if($tmp > 0){
	header('X-JSON: {"registration_name": "Sorry, but this username is taken. Please choose another one."}');
} elseif($filter !== $name){
	header('X-JSON: {"registration_name": "Sorry, but this username contains invalid characters."}');
} elseif(strlen($name) > 24){
	header('X-JSON: {"registration_name": "Sorry, but this username is too long."}');
} elseif(strlen($name) < 1){
	header('X-JSON: {"registration_name": "Please enter a username."}');
} else {
	$pos = strrpos($refer, 'MOD-');
	if ($pos == true) {
		header('X-JSON: {"registration_name": "This name is not allowed."}');
	} else {
		header('X-JSON: {}');
	}
}
?>