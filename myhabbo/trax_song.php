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

$id = isset($_GET['songId']) ? (int) $_GET['songId'] : 0;

$mysql = mysqli_query($connection, "SELECT * FROM soundmachine_songs WHERE id = '{$id}' LIMIT 1");
$mysql = mysqli_fetch_assoc($mysql);
$song = $mysql['data'];
$song = substr($song, 0, -1);
$song = str_replace(':4:', '&track4=', $song);
$song = str_replace(':3:', '&track3=', $song);
$song = str_replace(':2:', '&track2=', $song);
$song = str_replace('1:', '&track1=', $song);
$sql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$mysql['userid']}' LIMIT 1");
$userrow = mysqli_fetch_assoc($sql);
$output = 'status=0&name=' . HoloText($mysql['title']) . '&author=' . $userrow['name'] . $song;
echo $output;
?>