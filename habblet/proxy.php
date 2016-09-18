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
$allow_guests = true;

require_once(dirname(__FILE__) . '/../core.php'); 
require_once(dirname(__FILE__) . '/../includes/session.php');

$hid = isset($_GET['hid']) ? FilterText($_GET['hid']) : '';
$first = isset($_GET['first']) ? FilterText($_GET['first']) : '';

if($hid == 'h120') {
?>
  <head>
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/rooms.css" type="text/css" />
    <script src="<?php echo $web_gallery; ?>static/js/rooms.js" type="text/javascript"></script>
    <script src="<?php echo $web_gallery; ?>static/js/rooms.js" type="text/javascript"></script>
  </head>
  <div id="rooms-habblet-list-container-h120" class="recommendedrooms-lite-habblet-list-container">
    <ul class="habblet-list">
      <?php
        $i = 0;
        $getem = mysqli_query($connection, "SELECT *, COUNT(vote) AS votes FROM rooms, room_votes WHERE room_votes.roomid = rooms.id GROUP BY id ORDER BY votes DESC LIMIT 5") or die(mysqli_error($connection));

        while ($row = mysqli_fetch_assoc($getem)) {
          if(!empty($row['owner'])) { // Public Rooms (and possibly bugged rooms) have no owner, thus do not display them
            $i++;
            $even = (IsEven($i)) ? 'odd' : 'even';

            // Calculate percentage
            if($row['visitors_now'] == 0) {
              $row['visitors_now'] = 1;
            }

            $data[$i] = ($row['visitors_now'] / $row['visitors_max']) * 100;

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
            $roomname = ($row['showname'] == 1) ? $row['name'] : '';
      ?>
      <li class="<?php echo $even; ?>">
        <span class="clearfix enter-room-link room-occupancy-<?php echo $room_fill; ?>" title="Go to room" roomid="<?php echo $row['id']; ?>">
          <span class="room-enter">Enter</span>
          <span class="room-name"><?php echo $roomname; ?></span>
          <span class="room-description"><?php echo $row['descr']; ?></span>
          <span class="room-owner">Owner: <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['owner']; ?>"><?php echo $row['owner']; ?></a></span>
        </span>
      </li>
    <?php
          }
        }
    ?>
    </ul>
    <div id="room-more-data-h120" style="display: none">
      <ul class="habblet-list room-more-data">
        <?php
          $i = 0;
          $getem = mysqli_query($connection, "SELECT *,COUNT(vote) AS votes FROM rooms, room_votes WHERE room_votes.roomid = rooms.id GROUP BY id ORDER BY votes DESC LIMIT 15 OFFSET 5") or die(mysqli_error($connection));

          while ($row = mysqli_fetch_assoc($getem)) {
            if(!empty($row['owner'])) { // Public Rooms (and possibly bugged rooms) have no owner, thus do not display them
              $i++;
              $even = (IsEven($i)) ? 'odd' : 'even';

              // Calculate percentage
              $row['visitors_now'] = ($row['visitors_now'] == 0) ? 1 : $row['visitors_now'];
              $data[$i] = ($row['visitors_now'] / $row['visitors_max']) * 100;

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
              
              $roomname = ($row['showname'] == 1) ? $row['name'] : '';
        ?>
        <li class="<?php echo $even; ?>">
          <span class="clearfix enter-room-link room-occupancy-<?php echo $room_fill; ?>" title="Go to room" roomid="<?php echo $row['id']; ?>">
            <span class="room-enter">Enter</span>
            <span class="room-name"><?php echo $roomname; ?></span>
            <span class="room-description"><?php echo $row['descr']; ?></span>
            <span class="room-owner">Owner: <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['owner']; ?>"><?php echo $row['owner']; ?></a></span>
          </span>
        </li>
        <?php
            }
          }
        ?>
      </ul>
    </div>
    <div class="clearfix">
      <a href="#" class="room-toggle-more-data" id="room-toggle-more-data-h120">Show more rooms</a>
    </div>
  </div>
  <script type="text/javascript">
    L10N.put('show.more', 'Show more rooms');
    L10N.put('show.less', 'Show fewer rooms');
    var roomListHabblet_h120 = new RoomListHabblet('rooms-habblet-list-container-h120', 'room-toggle-more-data-h120', 'room-more-data-h120');
  </script>
<?php } elseif($hid == 'h122') { ?>
    <head>
      <script src="<?php echo $web_gallery; ?>static/js/moredata.js" type="text/javascript"></script>
    </head>
    <div id="hotgroups-habblet-list-container" class="habblet-list-container groups-list">
      <ul class="habblet-list two-cols clearfix">
        <?php
          $i = 0;
          $j = 1;
          $getem = mysqli_query($connection, "SELECT * FROM groups_details ORDER BY views DESC LIMIT 10") or die(mysqli_error($connection));

          while ($row = mysqli_fetch_assoc($getem)) {
            $i++;
            if(IsEven($i)) {
              $left = 'right';
            } else {
              $left = 'left';
              $j++;
            }
        
            $even = (IsEven($j)) ? 'even' : 'odd';
        ?>
        <li class="<?php echo $even; ?> <?php echo $left; ?>" style="background-image: url(<?php echo $path; ?>habbo-imaging/badge.php?badge=<?php echo $row['badge']; ?>)">
          <a class="item" href="<?php echo $path; ?>group_profile.php?id=<?php echo $row['id']; ?>"><span class="index"><?php echo $i; ?>.</span> <?php echo $row['name']; ?></a>
        </li>
        <?php } ?>
      </ul>
      <div id="hotgroups-list-hidden-h122" style="display: none">
        <ul class="habblet-list two-cols clearfix">
          <?php
            $i = 10;
            $j = 1;
            $getem = mysqli_query($connection, "SELECT * FROM groups_details ORDER BY views DESC LIMIT 40 OFFSET 10") or die(mysqli_error($connection));

            while ($row = mysqli_fetch_assoc($getem)) {
              $i++;

              if(IsEven($i)) {
                $left = 'left';
              } else {
                $left = 'right';
                $j++;
              }

              $even = (IsEven($j)) ? 'odd' : 'even';
          ?>
          <li class="<?php echo $even; ?> <?php echo $left; ?>" style="background-image: url(<?php echo $path; ?>habbo-imaging/badge.php?badge=<?php echo $row['badge']; ?>)">
            <a class="item" href="<?php echo $path; ?>group_profile.php?id=<?php echo $row['id']; ?>"><span class="index"><?php echo $i; ?>.</span> <?php echo $row['name']; ?></a>
          </li>
          <?php } ?>
        </ul>
      </div>
      <div class="clearfix">
        <a href="#" class="hotgroups-toggle-more-data secondary" id="hotgroups-toggle-more-data-h122">Show more Groups</a>
      </div>
      <script type="text/javascript">
        L10N.put('show.more.groups', 'Show more Groups');
        L10N.put('show.less.groups', 'Show less Groups');
        var hotGroupsMoreDataHelper = new MoreDataHelper('hotgroups-toggle-more-data-h122', 'hotgroups-list-hidden-h122', 'groups');
      </script>
    </div>
<?php } ?>