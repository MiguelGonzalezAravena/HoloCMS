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

mysqli_query($connection, "DELETE FROM cms_minimail WHERE deleted = '1' AND to_id = '{$my_id}'");
$bypass = true;
$page = 'trash';
$message = 'The trash has been emptied. Good Job!';
require_once(dirname(__FILE__) . '/loadMessage.php');
?>