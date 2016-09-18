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

$query = isset($_GET['query']) ? FilterText($_GET['query']) : '';
$scope = isset($_GET['scope']) ? (int) $_GET['scope'] : 0;
?>
  <ul>
    <li>Click on link below to insert it into the document</li>
    <?php
    switch($scope) {
      case 1:
        $i = 0;
        $getem = mysqli_query($connection, "SELECT * FROM users WHERE name LIKE '%{$query}%' LIMIT 10");
        while ($row = mysqli_fetch_assoc($getem)) {
          $i++;
    ?>
    <li>
      <a href="#" class="linktool-result" type="habbo" value="<?php echo $row['id']; ?>" title="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></a>
    </li>
    <?php
        }
        break;
      case 2:
        $i = 0;
        $getem = mysqli_query($connection, "SELECT * FROM rooms WHERE name LIKE '%{$query}%' LIMIT 10");
        while ($row = mysqli_fetch_assoc($getem)) {
          $i++;
    ?>
    <li>
      <a href="#" class="linktool-result" type="room" value="<?php echo $row['id']; ?>" title="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></a>
    </li>
    <?php
        }
        break;
      case 3:
        $i = 0;
        $getem = mysqli_query($connection, "SELECT * FROM groups_details WHERE name LIKE '%{$query}%' LIMIT 10");
        while ($row = mysqli_fetch_assoc($getem)) {
          $i++;
    ?>
    <li>
      <a href="#" class="linktool-result" type="group" value="<?php echo $row['id']; ?>" title="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></a>
    </li>
    <?php
        }
        break;
    }
    ?>
  </ul>