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

$feedItemIndex = isset($_POST['feedItemIndex']) ? (int) $_POST['feedItemIndex'] : '';
//(empty($feedItemIndex)) ? exit : '';
mysqli_query($connection, "DELETE FROM cms_alerts WHERE userid = '{$my_id}' ORDER BY id ASC LIMIT 1") or die(mysqli_error($connection));
echo 'SUCCESS';
?>