<?php
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided 'as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/
require_once(dirname(__FILE__) . '/../core.php');
require_once(dirname(__FILE__) . '/../includes/session.php');

$entryid = isset($_POST['entryId']) ? (int) $_POST['entryId'] : 0;
$widgetid = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;

// See permissions to delete here.
mysqli_query($connection, "DELETE FROM cms_guestbook WHERE id = '{$entryid}' LIMIT 1");
?>