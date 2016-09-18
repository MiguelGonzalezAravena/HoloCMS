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

$roomType = isset($_POST['roomType']) ? (int) $_POST['roomType'] : 0;
echo $roomType;
?>
<br /><br />
<?php
if(isset($roomType)) {
  $sql = mysqli_query($connection, "SELECT noob, gift, sort, roomid, lastgift FROM users WHERE id = '{$my_id}'");
  $row = mysqli_fetch_assoc($sql);
  if($row['noob'] == 0 & $row['sort'] == 0 && $row['roomid'] == 0) {
    switch ($roomType) {
      case 0:
        mysqli_query($connection, "INSERT INTO rooms(name, description, owner, category, model, floor, wallpaper, state, password, showname, superusers, visitors_now, visitors_max) VALUES('{$rawname}\'s room', '{$rawname} has entered the building', '{$rawname}', 0, 's', 601, 1501, 0, '', '1', '0', 0, 25)") or die(mysqli_error($connection));
        $sql = mysqli_query($connection, "SELECT id FROM rooms WHERE name = '{$rawname}\'s room' AND description = '{$rawname} has entered the building' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $row = mysqli_fetch_assoc($sql);
        mysqli_query($connection, "UPDATE users SET roomid = '{$row['id']}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1183', '{$my_id}', '{$row['id']}', '1', '6', '2', '0.00')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h, wallpos) VALUES('1196', '{$my_id}', '{$row['id']}', '0', '0', '0', '0.00', ':w=3,0 l=13,71 r')") or die(mysqli_error($connection));
        mysqli_query($connection, "UPDATE users SET noob = '1', lastgift = '{$date_normal}', sort = {$roomType} + 1 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1189', '{$my_id}', '0', '0', '0', '0', '0.00')");
        break;
      case 1:
        mysqli_query($connection, "INSERT INTO rooms(name, description, owner, category, model, floor, wallpaper, state, password, showname, superusers, visitors_now, visitors_max) VALUES ('{$rawname}\'s room', '{$rawname} has entered the building', '{rawname}', 0, 's', 0, 607, 0, '', '1', '0', 0, 25)") or die(mysqli_error($connection));
        $sql = mysqli_query($connection, "SELECT id FROM rooms WHERE name = '{$rawname}\'s room' AND description = '{$rawname}\has entered the building' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $row = mysqli_fetch_assoc($sql);
        mysqli_query($connection, "UPDATE users SET roomid = '{$row['id']}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1184', '{$my_id}', '{$row['id']}', '3', '6', '4', '0.00')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h, wallpos) VALUES('1196', '{$my_id}', '{$row['id']}', '0', '0', '0', '0.00', ':w=3,0 l=13,71 r')") or die(mysqli_error($connection));
        mysqli_query($connection, "UPDATE users SET noob = '1', lastgift = '{$date_normal}, sort = {$roomType} + 1 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES ('1190', '{$my_id}', '0', '0', '0', '0', '0.00')");
        break;
      case 2:
        mysqli_query($connection, "INSERT INTO rooms(name, description, owner, category, model, floor, wallpaper, state, password, showname, superusers, visitors_now, visitors_max) VALUES('{$rawname}\'s room', '{$rawname} has entered the building', '{$rawname}', 0, 's', 301, 1901, 0, '', '1', '0', 0, 25)") or die(mysqli_error($connection));
        $sql = mysqli_query($connection, "SELECT id FROM rooms WHERE name = '{$rawname}\'s room' AND description = '{$rawname} has entered the building' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $row = mysqli_fetch_assoc($sql);
        mysqli_query($connection, "UPDATE users SET roomid = '{$row['id']}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1185', '{$my_id}', '{$row['id']}', '2', '2', '4', '0.00')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h, wallpos) VALUES('1196', '{$my_id}', '{$row['id']}', '0', '0', '0', '0.00', ':w=3,0 l=13,71 r')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1191', '{$my_id}', '0', '0', '0', '0', '0.00')");
        mysqli_query($connection, "UPDATE users SET noob = '1', lastgift = '{$date_normal}', sort = {$roomType} + 1 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        break;
      case 3:
        mysqli_query($connection, "INSERT INTO rooms(name, description, owner, category, model, floor, wallpaper, state, password, showname, superusers, visitors_now, visitors_max) VALUES ('{$rawname}\'s room', '{$rawname} has entered the building', '{$rawname}', 0, 's', 110, 1801, 0, '', '1', '0', 0, 25)") or die(mysqli_error($connection));
        $sql = mysqli_query($connection, "SELECT id FROM rooms WHERE name = '{$rawname}\'s room' AND description = '{$rawname} has entered the building' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $row = mysqli_fetch_assoc($sql);
        mysqli_query($connection, "UPDATE users SET roomid = '{$row['id']}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1186', '{$my_id}', '{$row['id']}', '1', '2', '2', '0.00')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h, wallpos) VALUES('1196', '{$my_id}', '{$row['id']}', '0', '0', '0', '0.00', ':w=3,0 l=13,71 r')") or die(mysqli_error($connection));
        mysqli_query($connection, "UPDATE users SET noob = '1', lastgift = '{$date_normal}', sort = {$roomType} + 1 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES ('1192', '{$my_id}', '0', '0', '0', '0', '0.00')");
        break;
      case 4:
        mysqli_query($connection, "INSERT INTO rooms(name, description, owner, category, model, floor, wallpaper, state, password, showname, superusers, visitors_now, visitors_max) VALUES('{$rawname}\'s room', '{$rawname} has entered the building', '{$rawname}', 0, 's', 104, 503, 0, '', '1', '0', 0, 25)") or die(mysqli_error($connection));
        $sql = mysqli_query($connection, "SELECT id FROM rooms WHERE name = '{$rawname}\'s room' AND description = '{$rawname} has entered the building' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $row = mysqli_fetch_assoc($sql);
        mysqli_query($connection, "UPDATE users SET roomid = '{$row['id']}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1187', '{$my_id}', '{$row['id']}', '3', '6', '0', '0.00')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h, wallpos) VALUES('1196', '{$my_id}', '{$row['id']}', '0', '0', '0', '0.00', ':w=3,0 l=13,71 r')") or die(mysqli_error($connection));
        mysqli_query($connection, "UPDATE users SET noob = '1', lastgift = '{$date_normal}', sort = {$roomType} + 1 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1193', '{$my_id}', '0', '0', '0', '0', '0.00')");
        break;
      case 5:
        mysqli_query($connection, "INSERT INTO rooms(name, description, owner, category, model, floor, wallpaper, state, password, showname, superusers, visitors_now, visitors_max) VALUES('{$rawname}\'s room', '{$rawname} has entered the building', '{$rawname}', 0, 's', 107, 804, 0, '', '1', '0', 0, 25)") or die(mysqli_error($connection));
        $sql = mysqli_query($connection, "SELECT id FROM rooms WHERE name = '{$rawname}\'s room' AND description = '{$rawname} has entered the building' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $row = mysqli_fetch_assoc($sql);
        mysqli_query($connection, "UPDATE users SET roomid = '{$row['id']}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1188', '{$my_id}', '{$row['id']}', '3', '6', '0', '0.00')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h, wallpos) VALUES('1196', '{$my_id}', '{$row['id']}', '0', '0', '0', '0.00', ':w=3,0 l=13,71 r')") or die(mysqli_error($connection));
        mysqli_query($connection, "UPDATE users SET noob = '1', lastgift = '{$date_normal}', sort = {$roomType} + 1 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO furniture(tid, ownerid, roomid, x, y, z, h) VALUES('1194', '{$my_id}', '0', '0', '0', '0', '0.00')");
        break;
    }
  }
}
?>