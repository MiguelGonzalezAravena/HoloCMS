<?php
/*==================================+
|| # HoloCMS - Website and Content Management System
|+==================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+==================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+==================================*/

($hkzone != true ? header('Location: index.php?throwBack=true') : '');

if($user_rank > 6) {
  $strRank = 'Administrator';
} elseif($user_rank > 5) {
  $strRank = 'Moderator';
} else {
  $strRank = 'Faggot'; // no wai!
}

$lyrics = 'I was gonna clean my room until I got high
I gonna get up and find the broom but then I got high
my room is still messed up and I know why
cause I got high
I was gonna go to class before I got high
I coulda cheated and I coulda passed but I got high
I am taking it next semester and I know why
cause I got high
I was gonna go to work but then I got high
I just got a new promotion but I got high
now I\'m selling dope and I know why
I was gonna go to court before I got high
I was gonna pay my child support but then I got high
they took my whole paycheck and I know why
cause I got high
I wasnt gonna run from the cops but I was high
I was gonna pull right over and stop but I was high
Now I am a paraplegic - because I got high
I was gonna pay my car note until I got high
I was gonna gamble on the boat but then I got high
now the tow truck is pulling away and I know why
because I got high
I was gonna make love to you but then I got high
I was gonna eat yo pussy too but then I got high
now I\'m jacking off and I know why
I messed up my entire life because I got high
I lost my kids and wife because I got high
now I\'m sleeping on the sidewalk and I know why
I\'m gonna stop singing this song because I\'m high
I\'m singing this whole thing wrong because I\'m high
and if I dont sell one copy I know why
cause I\'m high';

$lyrics = explode("\n", $lyrics); // put diffrent lines in array and..
$chosen = $lyrics[ mt_rand(0, count($lyrics) - 1) ]; // ..pick a random one.

?>
  <body>
    <div id="loading-layer" style="display:none">
      <div id="loading-layer-shadow">
        <div id="loading-layer-inner">
          <img src="./images/loading_anim.gif" style="vertical-align:middle" border="0" alt="Loading..." />
          <br />
          <span style="font-weight:bold" id="loading-layer-text">Loading Data. Please Wait...</span>
        </div>
      </div>
    </div>
    <div id="ipdwrapper">
      <!-- IPDWRAPPER -->
      <!-- TOP TABS -->
      <div class="tabwrap-main">
        <div class="tab<?php echo ($tab == 1 ? 'on' : 'off'); ?>-main"><img src="images/dashboard.png" style="vertical-align:middle" /> <a href="index.php?p=dashboard">Dashboard</a></div>
        <div class="tab<?php echo ($tab == 2 ? 'on' : 'off'); ?>-main"><img src="images/system.png" style="vertical-align:middle" /> <a href="index.php?p=server">Server</a></div>
        <div class="tab<?php echo ($tab == 3 ? 'on' : 'off'); ?>-main"><img src="images/tools.png" style="vertical-align:middle" /> <a href="index.php?p=site">Site & Content</a></div>
        <div class="tab<?php echo ($tab == 4 ? 'on' : 'off'); ?>-main"><img src="images/components.png" style="vertical-align:middle" /> <a href="index.php?p=holocms">HoloCMS</a></div>
        <div class="tab<?php echo ($tab == 5 ? 'on' : 'off'); ?>-main"><img src="images/admin.png" style="vertical-align:middle" /> <a href="index.php?p=users">Users & Moderation</a></div>
        <div class="tab<?php echo ($tab == 6 ? 'on' : 'off'); ?>-main"><img src="images/help.png" style="vertical-align:middle" /> <a href="index.php?p=help">Help</a></div>
        <div class="logoright">
          <br />
          <font size="2" color="black"><?php echo $chosen; ?></font>
          &nbsp;&nbsp;&nbsp;
        </div>
      </div>
      <!-- / TOP TABS -->
      <div class="sub-tab-strip">
        <div class="global-memberbar">
          Welcome <strong><?php echo $strRank; ?> <?php echo $admin_username; ?></strong> [<a href="../index.php" target="_blank">Site Home</a> &middot; <a href="index.php?p=logout">Log Out</a>]
        </div>
        <div class="navwrap">
          <a href="index.php?p=dashboard"><?php echo $sitename; ?> Housekeeping</a>
        </div>
      </div>
      <div class="outerdiv" id="global-outerdiv">
        <!-- OUTERDIV -->