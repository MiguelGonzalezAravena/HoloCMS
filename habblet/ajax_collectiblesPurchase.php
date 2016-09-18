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
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$sql = mysqli_query($connection, "SELECT credits FROM users WHERE id = '{$my_id}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);

// Has the user enough credits?
$credits = ($row['credits'] - 25);

// user hasn't enough credits
if($credits < 0) {
?>
  <p>Purchasing the collectable failed.</p>
  <p>You don't have enough credits.<br /></p>
  <p>
    <a href="#" class="new-button" id="collectibles-close"><b>Cancel</b><i></i></a>
  </p>
<?php
} else {
  // It seems like the user has enough credits, we're now going to 'buy' the collectable
  $sql = mysqli_query($connection, "SELECT * FROM cms_collectables WHERE month = '{$n}' OR month = '{$m}' AND year = '{$Y}' LIMIT 1") or die(mysqli_error($connection));
  $row = mysqli_fetch_assoc($sql);
  mysqli_query($connection, "UPDATE users SET credits = credits - 25 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
  mysqli_query($connection, "INSERT INTO furniture(ownerid, roomid, tid) VALUES('{$my_id}', '0', '{$row['tid']}')") or die(mysqli_error($connection));
  mysqli_query($connection, "INSERT INTO cms_transactions(userid, amount, date, descr) VALUES('{$my_id}', '25', '{$date_full}', 'Bought a collectable')") or die(mysqli_error($connection));
  // katsjing sound
  @SendMUSData('UPRC' . $my_id);
  // reload hand
  @SendMUSData('UPRH' . $my_id);
  // Now we say in a message he has the furniture!
?>
  <p>You've succesfully bought a <?php echo HoloText($row['title']); ?>.</p>
  <p>
    <a href="#" class="new-button" id="collectibles-close"><b>OK</b><i></i></a>
  </p>
<?php } ?>