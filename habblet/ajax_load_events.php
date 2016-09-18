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

$category = $_POST['eventTypeId'];
?>

<ul class="habblet-list">
<?php
$getem = mysqli_query($connection, "SELECT * FROM events WHERE category = '$category'");
while ($row = mysqli_fetch_assoc($getem)) {
  $roomrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM rooms WHERE id = '{$row['roomid']}'"));
  $userrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['userid']}'"));
  $i++;
  $even = (IsEven($i)) ? 'odd' : 'even';

  // Calculate percentage
  $roomrow['incnt_max'] = ($roomrow['incnt_max'] == 0) ? 1 : $roomrow['incnt_max'];
  $data[$i] = ($roomrow['incnt_now'] / $roomrow['incnt_max']) * 100;

  // Base room icon based on this - percantage levels may not be habbolike
  if($data[$i] == 99 || $data[$i] > 99) {
    $room_fill = 5;
  } elseif($data[$i] > 65) {
    $room_fill = 4;
  } elseif($data[$i] > 32) {
    $room_fill = 3;
  } elseif($data[$i] > 0) {
    $room_fill = 2;
  } elseif($data[$i] < 1) {
    $room_fill = 1;
  }
?>
    <li class="<?php echo $even; ?> room-occupancy-<?php echo $room_fill; ?>" roomid="<?php echo $row['roomid']; ?>">
      <div title="Go to the room where this event is held">
        <span class="event-name"><a href="./client.php?forwardId=2&amp;roomId=<?php echo $row['roomid']; ?>" onclick="HabboClient.roomForward(this, '<?php echo $row['roomid']; ?>', 'private'); return false;"><?php echo $row['name']; ?></a></span>
        <span class="event-owner"> by <a href="<?php echo $path; ?>user_profile.php?id=<?php echo $row['userid']; ?>"><?php echo $userrow['name']; ?></a></span>
        <p><?php echo $row['description']; ?> (<span class="event-date"><?php echo $row['date']; ?></span>)</p>
      </div>
    </li>
<?php } ?>
</ul>