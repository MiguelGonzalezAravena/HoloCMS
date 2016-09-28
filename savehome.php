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
require_once(dirname(__FILE__) . '/core.php');

$stickienotes = isset($_POST['stickienotes']) ? FilterText($_POST['stickienotes']) : '';
$widgets = isset($_POST['widgets']) ? FilterText($_POST['widgets']) : '';
$stickers = isset($_POST['stickers']) ? FilterText($_POST['stickers']) : '';
$background = isset($_POST['background']) ? FilterText($_POST['background']) : '';

(empty($stickienotes) && empty($widgets) && empty($stickers) && empty($background)) ? exit : '';
// Split and count the data we've just recieved
$note = explode('/', $stickienotes);
$widget = explode('/', $widgets);
$sticker = explode('/', $stickers);
$background = explode(':', $background);
$check = mysqli_query($connection, "SELECT groupid, active FROM cms_homes_group_linker WHERE userid = '{$my_id}' AND active = '1' LIMIT 1") or die(mysqli_error($connection));
$linked = mysqli_num_rows($check);
if($linked > 0) {
	$linkdata = mysqli_fetch_assoc($check);
	$groupid = $linkdata['groupid'];
}

if(!empty($background[1])) {
	$bg = str_replace('b_', '', $background[1]);
	echo $bg;
	$check = mysqli_query($connection, "SELECT id FROM cms_homes_inventory WHERE userid = '{$my_id}' AND type = '4' AND data = '" . FilterText($bg) . "' LIMIT 1") or die(mysqli_error($connection));
	$valid = mysqli_num_rows($check);
	if($valid > 0) {
		if(!isset($groupid)) {
			$check = mysqli_query($connection, "SELECT data FROM cms_homes_stickers WHERE userid = '{$my_id}' AND groupid = '-1' AND type = '4' LIMIT 1") or die(mysqli_error($connection));
		} else {
			$check = mysqli_query($connection, "SELECT data FROM cms_homes_stickers WHERE groupid = '{$groupid}' AND type = '4' LIMIT 1") or die(mysqli_error($connection));
		}
		$exists = mysqli_num_rows($check);
		if($exists > 0) {
			if(!isset($groupid)) {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET data = '{$bg}' WHERE type = '4' AND userid = '{$my_id}' AND groupid = '-1' LIMIT 1") or die(mysqli_error($connection));
			} else {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET data = '{$bg}' WHERE type = '4' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
			}
		} else {
			if(!isset($groupid)) {
				mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, x, y, z, data, type, subtype, skin) VALUES('{$my_id}', '-1', '-1', '-1', '-1', '{$bg}', '4', '0', '-1')") or die(mysqli_error($connection));
			} else {
				mysqli_query($connection, "INSERT INTO cms_homes_stickers(userid, groupid, x, y, z, data, type, subtype, skin) VALUES('{$my_id}', '{$groupid}', '-1', '-1', '-1', '{$bg}', '4', '0', '-1')") or die(mysqli_error($connection));
			}
		}
	}
}

// Loop through each array of data we encountered and save the stuff that was passed onto us
foreach($widget as $raw) {
	$bits = explode(':', $raw);
	$id = $bits[0];
	$data = FilterText($bits[1]);
	if(!empty($data) && !empty($id) && is_numeric($id)) {
		$coordinates = explode(',', $data);
		$x = $coordinates[0];
		$y = $coordinates[1];
		$z = $coordinates[2];
		if(is_numeric($x) && is_numeric($y) && is_numeric($z)) {
			if(isset($groupid)) {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET x = '{$x}', y = '{$y}', z = '{$z}' WHERE id = '{$id}' AND type = '2' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
			} else {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET x = '{$x}', y = '{$y}', z = '{$z}' WHERE id = '{$id}' AND type = '2' AND userid = '{$my_id}' AND groupid = '-1' LIMIT 1") or die(mysqli_error($connection));
			}
		}
	}
}

foreach($sticker as $raw) {
	$bits = explode(':', $raw);
	$id = $bits[0];
	$data = FilterText($bits[1]);
	if(!empty($data) && !empty($id) && is_numeric($id)) {
		$coordinates = explode(',', $data);
		$x = $coordinates[0];
		$y = $coordinates[1];
		$z = $coordinates[2];
		if(is_numeric($x) && is_numeric($y) && is_numeric($z)) {
			if(isset($groupid)) {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET x = '{$x}', y = '{$y}', z = '{$z}' WHERE id = '{$id}' AND type = '1' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
			} else {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET x = '{$x}', y = '{$y}', z = '{$z}' WHERE id = '{$id}' AND type = '1' AND userid = '{$my_id}' AND groupid = '-1' LIMIT 1") or die(mysqli_error($connection));
			}
		}
	}
}

foreach($note as $raw) {
	$bits = explode(':', $raw);
	$id = $bits[0];
	$data = FilterText($bits[1]);
	if(!empty($data) && !empty($id) && is_numeric($id)) {
		$coordinates = explode(',', $data);
		$x = $coordinates[0];
		$y = $coordinates[1];
		$z = $coordinates[2];
		if(is_numeric($x) && is_numeric($y) && is_numeric($z)) {
			if(isset($groupid)) {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET x = '{$x}', y = '{$y}', z = '{$z}' WHERE id = '{$id}' AND type = '3' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
			} else {
				mysqli_query($connection, "UPDATE cms_homes_stickers SET x = '{$x}', y = '{$y}', z = '{$z}' WHERE id = '{$id}' AND type = '3' AND userid = '{$my_id}' AND groupid = '-1' LIMIT 1") or die(mysqli_error($connection));
			}
		}
	}
}

if(isset($groupid)) {
?>
	<script language="JavaScript" type="text/javascript">waitAndGo('group_profile.php?id=<?php echo $groupid; ?>');</script>
<?php
	exit;
} else {
?>
	<script language="JavaScript" type="text/javascript">waitAndGo('user_profile.php?name=<?php echo $name; ?>');</script>
<?php
	exit;
}
?>