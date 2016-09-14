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

$id = isset($_POST['messageId']) ? (int) $_POST['messageId'] : 0;
$start = isset($_POST['start']) ? (int) $_POST['start'] : 0;
$label = isset($_POST['label']) ? FilterText($_POST['label']) : '';

$sql = mysqli_query($connection, "SELECT NOW()");
$date = mysqli_result($sql, 0);
$sql = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE id = '{$id}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);
mysqli_query($connection, "INSERT INTO cms_help(username, ip, message, date, picked_up, subject, roomid) VALUES('{$name}',  '{$remote_ip}', 'Minimail Message: {$row['message']}', '{$date}', '0', 'Reported Minimail Message: {$row['subject']}', '0')");
mysqli_query($connection, "DELETE FROM messenger_friendships WHERE userid = '{$my_id}' AND friendid = '{$row['senderid']}' LIMIT 1");
mysqli_query($connection, "DELETE FROM messenger_friendships WHERE userid = '{$row['senderid']}' AND friendid = '{$my_id}' LIMIT 1");
mysqli_query($connection, "DELETE FROM cms_minimail WHERE id = '{$id}' LIMIT 1");
$bypass = true;
$page = $label;
$startpage = $start;
$message = 'Message reported sucessfully, and friend removed.';
require_once(dirname(__FILE__) . '/loadMessage.php');
?>