<?php
session_start();
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided 'as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/

/*-------------------------------------------------------*\
| ****** NOTE REGARDING THE VARIABLES IN THIS FILE ****** |
+---------------------------------------------------------+
| If you get any errors while attempting to connect to    |
| MySQL, you will need to email your webhost because we   |
| cannot tell you the correct values for the variables    |
| in this file.                                           |
\*-------------------------------------------------------*/

//	****** MASTER DATABASE SETTINGS ******
//	These are the settings required to connect to your MySQL Database.
$sqlhostname = 'z37udk8g6jiaqcbx.cbetxkdyhwsb.us-east-1.rds.amazonaws.com';
$sqlusername = 'ngi4v6jtse1swr17';
$sqlpassword = 'uoao3754s2irptgz';
$sqldb = 'm0wwy64nt6johmj1';
$language = 'en';

//	****** STATUS CHECKS SYSTEM ******
//	This option will allow HoloCMS to perform full status checks. This,
//	however, slows down your site A LOT. It is therefore disabled by
//	default.
$enable_status_image = 1;

//	****** SITE PATH ******
//	The full URL to your site; with an slash added on the end.
$path = 'http://127.0.0.1/HoloCMS/';

//	****** REFFERAL REWARD ******
//	The amount of credits a user recieves upon referring a friend to the
//	hotel. Set to '500' by default.
$reward = 500;

//	****** HOLOCMS SYSTEM ADMINISTRATOR ******
//	User ID of the System Administrator. Will be granted access to sensitive
//	features. Set to '1' by default. This setting will not change your
//	ingame priveliges.
$sysadmin = 1;

//	****** HOLOCMS ENCRYPTION SYSTEM ******
//	How HoloCMS stores passowrds.
//	Do NOT manually change this unless you know what you are doing,
//	doing so may corrupt your database.
$encryption = 'new';
$hashtext = '';
$first_figure = 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77';
$first_gender = 'M';

//	****** BADGES ******
//	Where badges are located.
$cimagesurl = $path . 'c_images/';
$web_gallery = $path . 'web-gallery/';
$badgesurl = 'badges/';
$housekeeping = $path . 'housekeeping/';

//	****** EMAIL VERIFY ******
//	Email verification settings
$email_verify = true;
$email_force_verify = false;
$email_verify_reward = 500;
$notify_maintenance = false;
?>