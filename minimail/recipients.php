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

$i = 0;
$output = array();
$json_data = array();

$getem = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$my_id}' OR friendid = '{$my_id}'") or die(mysqli_error($connection));

while ($row = mysqli_fetch_assoc($getem)) {
	$i++;

	if($row['friendid'] == $my_id) {
		$request = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['userid']}'");
	} else {
		$request = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['friendid']}'");
	}

	$friendrow = mysqli_fetch_assoc($friendsql);

	$json_data = array(
		'id' => $friendrow['id'],
		'name' => $friendrow['name']
	);
}
?>
/*-secure-<?php
if(sizeof($json_data) > 0) {
	array_push($output, $json_data);
}

echo json_encode($output);
?>*/