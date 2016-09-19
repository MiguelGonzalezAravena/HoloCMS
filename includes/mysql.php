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
(!defined('IN_HOLOCMS')) ? header('Location: ../index.php') : '';


$connection = mysqli_connect($sqlhostname, $sqlusername, $sqlpassword, $sqldb) or die('<br><font size="2" face="Tahoma"><b>HoloCMS Configuration Error:</b><br />I was unable to connect to the provided MySQL server. Please review the error message above for details.</font>');
// Set charset to UTF-8
mysqli_set_charset($connection, 'utf8');
// This echo must be UTF-8 (not other).
//echo mysqli_character_set_name($connection);
?>