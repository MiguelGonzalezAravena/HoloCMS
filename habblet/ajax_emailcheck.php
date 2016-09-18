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

$email = isset($_POST['email']) ? FilterText($_POST['email']) : '';
$email_check = preg_match("/^[a-z0-9_\.-]+@([a-z0-9]+([\-]+[a-z0-9]+)*\.)+[a-z]{2,7}$/i", $email);

if(strlen($email) < 6) {
	echo 'register.message.invalid_email';
} elseif($email_check != 1) {
	echo 'register.message.invalid_email';
} else {
	header('X-JSON: "emailOk"');
	echo 'register.message.email_chars_ok';
}
?>