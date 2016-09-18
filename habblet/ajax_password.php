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

$password = isset($_POST['password']) ? FilterText($_POST['password']) : '';

if(strlen($password) < 6) {
	echo 'Password must be at least 6 characters long.';
} else {
	header('X-JSON: "charOk"');
	echo 'Password is secure!';
}
?>