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

if(!isset($_SESSION['username'])) {
?>
  <p>
    Please log in first.
  </p>
  <p>
    <a href="#" class="new-button" onclick="habboclub.closeSubscriptionWindow(); return false;"><b>Done</b><i></i></a>
  </p>
<?php
  exit;
}

echo '<p>You are' . (!IsHCMember($my_id) ? ' not' : '') . ' a member of ' . $shortname . ' Club</p>';
echo '<p>' . (IsHCMember($my_id) ? 'You have ' . HCDaysLeft($my_id) . ' Club Day(s) left.' : '&nbsp;') . '</p>';
?>
