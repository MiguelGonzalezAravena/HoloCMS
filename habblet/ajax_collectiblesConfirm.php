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

$sql = mysqli_query($connection, "SELECT title FROM cms_collectables WHERE month = '{$n}' OR month = '{$m}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);
?>
  <p>Are you sure you want to purchase <?php echo HoloText($row['title']); ?>? It will cost 25 credits.</p>
  <p>
    <a href="#" class="new-button" id="collectibles-purchase"><b>Purchase</b><i></i></a>
    <a href="#" class="new-button" id="collectibles-close"><b>Cancel</b><i></i></a>
  </p>