<?php
/*---------------------------------------------------+
| HabboCMS - Habbo Content Management System
+----------------------------------------------------+
| Copyright ? 2007 - Meth0d
| <meth0d@retroscripting.com>
+----------------------------------------------------+
| This product comes without any warrenty in any
| kind, shape, way or format.
+---------------------------------------------------*/

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

$pagename = "Credits";
$pageid = "7";
$body_id = "home";

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');

// Old page ported from HabboCMS to HoloCMS, with some improvements and function changes.

// Convert old core variables
$credits_count = $myrow['credits'];

echo "<div id='container'>
	<div id='content'>
		<div id='column1' class='column'>";

if (isset($_GET['months'])) {
	if ($_GET['months'] == "reset") {
		echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Reset Club Days</h2><div class='box-content'>
Bought too many ".$shortname." Club days? Causing problems? Or need to reset them for another reason? This tool will set your ".$shortname." Club days to zero.<br><br>If you are sure, click <a href='club.php?months=reset-them-now'>here</a> to cancel your ".$shortname." Club subscription.<br><br><b>Important:</b> No Credits will be refunded if you do this, neither will staff *ever* undo this action.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
	} elseif ($_GET['months'] == "reset-them-now") {
		mysqli_query($connection, "UPDATE users SET club = '0' WHERE name = '".$rawname."'") or die(mysqli_error($connection));
		echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Reset Club Days</h2><div class='box-content'>
Your ".$shortname." Club membership has been canceled. Again, no credits are bieng refunded. Have a nice day.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
	} elseif ($_GET['months'] == "1") {
		$price = "20";
		if ($credits_count > $price || $credits_count == $price) {
		$newcredits = $credits_count - $price;
			mysqli_query($connection, "UPDATE users SET credits = credits-".$price." WHERE name = '".$rawname."'") or die(mysqli_error($connection));
			mysqli_query($connection, "UPDATE users SET club = club+31 WHERE name = '".$rawname."'") or die(mysqli_error($connection));
			echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Purchase Successfull</h2><div class='box-content'>
You bought 1 month of ".$shortname." Club for $price Credits. You have $newcredits Credits left.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
		} else {
		echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Purchase Unsuccessfull</h2><div class='box-content'>
Sorry, but you don't have $price Credits. You only have $credits_count.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
		}
	} elseif ($_GET['months'] == "3") {
		$price = "50";
		if ($credits_count > $price || $credits_count == $price) {
		$newcredits = $credits_count - $price;
			mysqli_query($connection, "UPDATE users SET credits = credits-".$price." WHERE name = '".$rawname."'") or die(mysqli_error($connection));
			mysqli_query($connection, "UPDATE users SET club = club+93 WHERE name = '".$rawname."'") or die(mysqli_error($connection));
			echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Purchase Successfull</h2><div class='box-content'>
You bought 3 months of ".$shortname." Club for $price Credits. You have $newcredits Credits left.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
		} else {
		echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Purchase Unsuccessfull</h2><div class='box-content'>
Sorry, but you don't have $price Credits. You only have $credits_count.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
		}
	} elseif ($_GET['months'] == "6") {
		$price = "80";
		if ($credits_count > $price || $credits_count == $price) {
		$newcredits = $credits_count - $price;
			mysqli_query($connection, "UPDATE users SET credits = credits-".$price." WHERE name = '".$rawname."'") or die(mysqli_error($connection));
			mysqli_query($connection, "UPDATE users SET club = club+186 WHERE name = '".$rawname."'") or die(mysqli_error($connection));
			echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Purchase Successfull</h2><div class='box-content'>
You bought 6 months of ".$shortname." Club for $price Credits. You have $newcredits Credits left.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
		} else {
		echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Purchase Unsuccessfull</h2><div class='box-content'>
Sorry, but you don't have $price Credits. You only have $credits_count.
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
		}
	} else {
	echo "<div class='habblet-container '><div class='cbb clearfix lightbrown '><h2 class='title'>Purchase Unsuccessfull</h2><div class='box-content'>
Invalid amount of months!
</div></div></div><script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>";
	}
}

$usersql = mysqli_query($connection, "SELECT * FROM users WHERE name = '".$rawname."' and password = '".$rawpass."' LIMIT 1");
$clubdays = $myrow['club'];


echo "<div class='habblet-container '>		
						<div class='cbb clearfix hcred '>
	
							<h2 class='title'>".$shortname." Club: become a VIP!</h2>
						<div id ='habboclub-products'>
    <div id='habboclub-clothes-container'>
        <div class='habboclub-extra-image'></div>
        <div class='habboclub-clothes-image'></div>
    </div>

    <div class='clearfix'></div>
    <div id='habboclub-furniture-container'>
        <div class='habboclub-furniture-image'></div>
    </div>
</div>
	
						
					</div>
				</div>
				<script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
			 
				<div class='habblet-container '>		
						<div class='cbb clearfix lightbrown '>
	
							<h2 class='title'>Benefits</h2>
						<div id='habboclub-info' class='box-content'>
    <p>".$shortname." Club is our VIP members-only club - absolutely no riff-raff admitted! Members enjoy a wide range of benefits, including exclusive clothes, free gifts and an extended Friends List. See below for all the sparkly, attractive reasons to join.</p>
    <h3 class='heading'>1. Extra Clothes &amp; Accessories</h3>
    <p class='content habboclub-clothing'>Show off your new status with a variety of extra clothes and accessories, along with special hairstyles and colours.</p>
    <h3 class='heading'>2. Free Furni</h3>
    <p class='content habboclub-furni'>Once a month, every month, you'll get an exclusive piece of ".$shortname." Club furni.</p>        
    <p class='content'>Important note: club time is cumulative. This means that if you have a break in membership, and then rejoin, you'll start back in the same place you left off.</p>
    <h3 class='heading'>3. Exclusive Room Layouts</h3>
    <p class='content'>Special Guest Room layouts, only for ".$shortname." Club members. Perfect for showing off your new furni!</p>
    <p class='habboclub-room' />
    <h3 class='heading'>4. Access All Areas</h3>
    <p class='content'>Jump the annoying queues when rooms are loading. And that's not all - you'll also get access to HC-only Public Rooms.</p>
    <h3 class='heading'>5. Homepage Upgrades</h3>
    <p class='content'>Join ".$shortname." Club and say goodbye to homepage ads! And this means you can make the most of the HC skins and backgrounds too.</p>
    <h3 class='heading'>6. More Friends</h3>
    <p class='content habboclub-communicator'>600 people! Now that's a lot of buddies however you look at it. More than you can poke with a medium-sized stick, or a big-sized small stick.</p>
    <h3 class='heading'>7. Special Commands</h3>
    <p class='content habboclub-commands right'>Use the :chooser command to see a clickable list of all the users in the room. Pretty handy when you want to sit next to your mate, or kick out a troublemaker.</p>
    <br />
    <p>Use the :furni command to list all the items in a room. Everything is listed, even those sneakily hidden items.</p>
</div>
	
						
					</div>
				</div>
				<script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
			 
</div>
<div id='column2' class='column'>
				<div class='habblet-container '>		
						<div class='cbb clearfix hcred '>
	
							<h2 class='title'>My Membership</h2>
<div id='hc-membership-info' class='box-content'>
<p>
Credits in your purse: <a href='credits.php'>".$credits_count."</a>
</p>
<p>
Remaining ".$shortname." Club Day(s): $clubdays
</p>
</div>";

if($myrow['credits'] == "20" || $myrow['credits'] > 20){ ?>
<div id='hc-buy-container' class='box-content'>
<div id='hc-buy-buttons' class='hc-buy-buttons rounded rounded-hcred'>
<form>
<table>
<tr>
	<td><input type='button' onClick=parent.location='club.php?months=1' VALUE='Buy 1 month(s)' class='submit'></td>
    <td>20 Credits</td>
</tr>
<tr>
	<td><input type='button' onClick=parent.location='club.php?months=3' VALUE='Buy 3 month(s)' class='submit'></td>
    <td>50 Credits</td>
</tr>
<tr>
	<td><input type='button' onClick=parent.location='club.php?months=6' VALUE='Buy 6 month(s)' class='submit'></td>
    <td>80 Credits</td>
</tr>
</table>
</form>
</div>
</div>
<?php } else { ?>
<div id="hc-buy-container" class="box-content">
        <div id="hc-buy-buttons" class="hc-buy-buttons rounded rounded-hcred">
            <form class="subscribe-form" method="post">
                <table width="100%">
                  <p class="credits-notice">To join <?php echo $shortname; ?> Club you first need to buy some Credits:</p>
                  <p class="credits-notice"><?php echo $shortname; ?> Club membership starts from 20 credits</p>                  
                  <a class="new-button fill" href="credits.php"><b>Get some credits</b><i></i></a>
                </table>
            </form>
        </div>
    </div>
<?php } ?>
	
						
echo "					</div>
				</div>
				<script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
			 
				<div class='habblet-container '>		
	
						
	
						
					
				</div>
				<script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
			 
				<div class='habblet-container '>		
						<div class='cbb clearfix lightbrown '>
	
							<h2 class='title'>Discount!</h2>
<div class='box-content'>
Hurrah! A major discount on all ".$shortname." Club subscriptions! Buy one on this page now and save up to 15 credits!
</div>
	
						
					</div>
				</div>
				<script type='text/javascript'>if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
			 
</div>
			 
</div>";

require_once(dirname(__FILE__) . '/templates/community/footer.php');

?>