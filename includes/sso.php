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
$myticket = $myrow['ticket_sso'];

if(empty($myticket) || strlen($myticket) < 39) {
  $myticket = GenerateTicket();
  mysqli_query($connection, "UPDATE users SET ticket_sso = '{$myticket}', ipaddress_last = '{$remote_ip}' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
}
?>