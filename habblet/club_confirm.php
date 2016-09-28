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

$months = isset($_POST['optionNumber']) ? (int) $_POST['optionNumber'] : 0;

if(!$_SESSION['username']) {
?>
<p>Please log in first.</p>
<p>
  <a href="#" class="new-button" onclick="habboclub.closeSubscriptionWindow(); return false;"><b>Done</b><i></i></a>
</p>
<?php
  exit;
}

switch($months) {
	case 1:
    $price = 20;
    $valid = 1;
    break;
	case 3:
    $price = 50;
    $valid = 1;
    break;
	case 6:
    $price = 80;
    $valid = 1;
    break;
}

if($valid != 1) {
  $price = 20;
  $months = 1;
  $valid = 1;
}

?>
<div id="hc_confirm_box">
  <img src="<?php echo $web_gallery; ?>album1/piccolo_happy.gif" alt="" align="left" style="margin:10px;" />
  <p><b>Confirm</b></p>
  <p><?php echo $months; ?> month(s) of <?php echo $shortname; ?> Club (<?php echo $months * 31; ?> days) costs <?php echo $price; ?> Credits. You have: <?php echo $myrow['credits']; ?> Credits.</p>
  <p>
    <a href="#" class="new-button" onclick="habboclub.closeSubscriptionWindow(); return false;"><b>Cancel</b><i></i></a>
    <a href="#" ondblclick="habboclub.showSubscriptionResultWindow(<?php echo $months; ?>, '<?php echo strtoupper($shortname); ?> CLUB'); return false;" onclick="habboclub.showSubscriptionResultWindow(<?php echo $months; ?>, '<?php echo strtoupper($shortname); ?> CLUB'); return false;" class="new-button"><b>Buy</b><i></i></a>
  </p>
</div>
<div class="clear"></div>