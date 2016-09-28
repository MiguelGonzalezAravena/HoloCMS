<?php
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided 'as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/
require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

$pagename = $name;
$pageid = 3;
$referral = isset($_GET['referral']) ? (int) $_GET['referral'] : '';

$check = mysqli_query($connection, "SELECT noob FROM users WHERE id = '{$my_id}'");
$row = mysqli_fetch_assoc($check);

if($row['noob'] != 0) {
  header('Location: index.php');
} else {
  require_once(dirname(__FILE__) . '/templates/community/subheader.php');
  require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
    <div id="container">
      <div id="content" style="position: relative" class="clearfix">
        <div id="column1" class="column">
          <div class="habblet-container">
            <div class="cbb clearfix lightgreen">
              <h2 class="title">Choose a pre-decorated room and get free furniture!</h2>
              <div id="roomselection-welcome-intro" class="box-content">
                Select the room you like best to get a new piece of furniture every day during your first week in Obbah!
              </div>
              <ul class="roomselection-welcome clearfix">
                <li class="odd">
                  <a class="roomselection-select new-button" href="<?php echo $path; ?>client.php?createRoom=0" target="client" onclick="return RoomSelectionHabblet.create(this, 0);"><b>Select</b><i></i></a>
                </li>
                <li class="even">
                  <a class="roomselection-select new-button" href="<?php echo $path; ?>client.php?createRoom=1" target="client" onclick="return RoomSelectionHabblet.create(this, 1);"><b>Select</b><i></i></a>
                </li>
                <li class="odd">
                  <a class="roomselection-select new-button" href="<?php echo $path; ?>client.php?createRoom=2" target="client" onclick="return RoomSelectionHabblet.create(this, 2);"><b>Select</b><i></i></a>
                </li>
                <li class="even">
                  <a class="roomselection-select new-button" href="<?php echo $path; ?>client.php?createRoom=3" target="client" onclick="return RoomSelectionHabblet.create(this, 3);"><b>Select</b><i></i></a>
                </li>
                <li class="odd">
                  <a class="roomselection-select new-button" href="<?php echo $path; ?>client.php?createRoom=4" target="client" onclick="return RoomSelectionHabblet.create(this, 4);"><b>Select</b><i></i></a>
                </li>
                <li class="even">
                  <a class="roomselection-select new-button" href="<?php echo $path; ?>client.php?createRoom=5" target="client" onclick="return RoomSelectionHabblet.create(this, 5);"><b>Select</b><i></i></a>
                </li>
              </ul>
            </div>
          </div>
          <script type="text/javascript">
            if(!$(document.body).hasClassName('process-template')) {
              Rounder.init();
            }
          </script>
        </div>
        <div id="column2" class="column">
          <div class="habblet-container">
            <div class="cbb clearfix lightgreen">
              <div class="welcome-intro clearfix">
                <img alt="<?php echo $myrow['name']; ?>" src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $myrow['figure']; ?>&size=b&action=crr=667&direction=3&head_direction=3&gesture=srp" width="64" height="110" class="welcome-habbo" />
                <div id="welcome-intro-welcome-user">Welcome <?php echo $name; ?>!</div>
                <div id="welcome-intro-welcome-party" class="box-content">When you've choosen a room you will automaticly go to it! Than you get 8 days after each other free furnitures! Enjoy <?php echo $sitename; ?>!</div>
              </div>
            </div>
          </div>
          <script type="text/javascript">
            if(!$(document.body).hasClassName('process-template')) {
              Rounder.init();
            }
          </script>
          <?php
            if(!empty($referral)) {
              $referrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$referral}' LIMIT 1"));
              $online = (IsUserOnline($referrow['id'])) ? 'online' : 'offline';
          ?>
          <div class="habblet-container">
            <div class="cbb clearfix white">
              <h2 class="title">Welcome</h2>
              <div id="inviter-info-habblet">
                <p>
                  <span class="text">Your friend <?php echo $referrow['name']; ?> is waiting for you in <?php echo $shortname; ?>!<em class="<?php echo $online; ?>"></em></span>
                  <span class="bottom"></span>
                </p>
                <img alt="<?php echo $referrow['name']; ?>" title="<?php echo $referrow['name']; ?>" src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $referrow['figure']; ?>&size=b&direction=4&head_direction=4&gesture=sml" />
                <div style="clear: left; text-align: center; padding-top: 10px; font-size: 10px">You can find him/her on your friendlist</div>
              </div>
            </div>
          </div>
          <script type="text/javascript">
            if(!$(document.body).hasClassName('process-template')) {
              Rounder.init();
            }
          </script>
          <?php } ?>
          <div class="habblet-container">
            <div class="cbb clearfix green">
              <h2 class="title">Got Shockwave?</h2>
              <div class="welcome-shockwave clearfix box-content">
                <div id="welcome-shockwave-text">
                  When you open <?php echo $sitename; ?> for the first time you might need to install Shockwave. But don't worry, it's as easy as 1-2-3!
                </div>
                <div id="welcome-shockwave-logo">
                  <img src="<?php echo $web_gallery; ?>v2/images/welcome/shockwave.gif" alt="shockwave" />
                </div>
              </div>
            </div>
          </div>
          <script type="text/javascript">
            if(!$(document.body).hasClassName('process-template')) {
              Rounder.init();
            }
          </script>
        </div>
        <script type="text/javascript">
          HabboView.run();
        </script>
        <!--[if lt IE 7]>
        <script type="text/javascript">
          Pngfix.doPngImageFix();
        </script>
        <![endif]-->
<?php
  require_once(dirname(__FILE__) . '/templates/community/footer.php');
}
?>