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

$id = isset($_POST['accountId']) ? (int) $_POST['accountId'] : 0;
$sql = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$id}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);
?>
  <p>
    Are you sure you want to add <?php echo $row['name']; ?> to your friend list?
  </p>
  <p>
    <a href="#" class="new-button done"><b>Cancel</b><i></i></a>
    <a href="#" class="new-button add-continue"><b>Continue</b><i></i></a>
  </p>