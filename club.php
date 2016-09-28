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
$allow_guests = true;

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

$pagename = $shortname . ' Club';
$pageid = 7;
$body_id = 'home';

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content">
      <div id="column1" class="column">
        <div class="habblet-container ">
          <div class="cbb clearfix hcred ">
            <h2 class="title"><?php echo $pagename; ?>: become a VIP!</h2>
            <div id="habboclub-products">
              <div id="habboclub-clothes-container">
                <div class="habboclub-extra-image"></div>
                <div class="habboclub-clothes-image"></div>
              </div>
              <div class="clearfix"></div>
              <div id="habboclub-furniture-container">
                <div class="habboclub-furniture-image"></div>
              </div>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container ">
          <div class="cbb clearfix lightbrown ">
            <h2 class="title">Benefits</h2>
            <div id="habboclub-info" class="box-content">
              <p>
                <?php echo $pagename; ?> is our VIP members-only club - absolutely no riff-raff admitted! Members enjoy a wide range of benefits, including exclusive clothes, free gifts and an extended Friends List. See below for all the sparkly, attractive reasons to join.</p>
              <h3 class="heading">1. Extra Clothes &amp; Accessories</h3>
              <p class="content habboclub-clothing">Show off your new status with a variety of extra clothes and accessories, along with special hairstyles and colours.</p>
              <h3 class="heading">2. Free Furni</h3>
              <p class="content habboclub-furni">Once a month, every month, you'll get an exclusive piece of
                <?php echo $pagename; ?> furni.</p>
              <p class="content">Important note: club time is cumulative. This means that if you have a break in membership, and then rejoin, you'll start back in the same place you left off.</p>
              <h3 class="heading">3. Exclusive Room Layouts</h3>
              <p class="content">Special Guest Room layouts, only for
                <?php echo $pagename; ?> members. Perfect for showing off your new furni!</p>
              <p class="habboclub-room" />
              <h3 class="heading">4. Access All Areas</h3>
              <p class="content">Jump the annoying queues when rooms are loading. And that's not all - you'll also get access to HC-only Public Rooms.</p>
              <h3 class="heading">5. Homepage Upgrades</h3>
              <p class="content">Join
                <?php echo $pagename; ?> and say goodbye to homepage ads! And this means you can make the most of the HC skins and backgrounds too.</p>
              <h3 class="heading">6. More Friends</h3>
              <p class="content habboclub-communicator">600 people! Now that's a lot of buddies however you look at it. More than you can poke with a medium-sized stick, or a big-sized small stick.</p>
              <h3 class="heading">7. Special Commands</h3>
              <p class="content habboclub-commands right">Use the :chooser command to see a clickable list of all the users in the room. Pretty handy when you want to sit next to your mate, or kick out a troublemaker.</p>
              <br />
              <p>Use the :furni command to list all the items in a room. Everything is listed, even those sneakily hidden items.</p>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if (!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <div id="column2" class="column">
        <div class="habblet-container ">
          <div class="cbb clearfix hcred ">
            <h2 class="title">My Membership</h2>
            <div id="hc-membership-info" class="box-content">
              <?php
                if(!$logged_in) {
                  echo 'Please sign in to see your ' . $pagename. ' status.';
                } else {
                  require_once(dirname(__FILE__) . '/habblet/ajax_club.php');
                  if($myrow['credits'] >= 20) {
              ?>
              <div id="hc-buy-container" class="box-content">
                <div id="hc-buy-buttons" class="hc-buy-buttons rounded rounded-hcred">
                  <form>
                    <table>
                      <tr>
                        <td><a class="new-button fill" onclick="habboclub.buttonClick(1, '<?php echo strtoupper($shortname); ?> CLUB'); return false;" href="#"><b>Buy 1 month</b><i></i></a></td>
                        <td>&nbsp;20 Credits</td>
                      </tr>
                      <tr>
                        <td><a class="new-button fill" onclick="habboclub.buttonClick(3, '<?php echo strtoupper($shortname); ?> CLUB'); return false;" href="#"><b>Buy 3 months</b><i></i></a></td>
                        <td>&nbsp;50 Credits</td>
                      </tr>
                      <tr>
                        <td><a class="new-button fill" onclick="habboclub.buttonClick(6, '<?php echo strtoupper($shortname); ?> CLUB'); return false;" href="#"><b>Buy 6 months</b><i></i></a></td>
                        <td>&nbsp;80 Credits</td>
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
                      <p class="credits-notice">To join
                        <?php echo $pagename; ?> you first need to buy some Credits;
                          <?php echo $pagename; ?> membership starts from 20 credits</p>
                      <a class="new-button fill" href="credits.php"><b>Get some credits</b><i></i></a>
                    </table>
                  </form>
                </div>
              </div>
              <?php
                  }
                }
              ?>
            </div>
          </div>
          <script type="text/javascript">
            if(!$(document.body).hasClassName('process-template')) {
              Rounder.init();
            }
          </script>
          <div class="habblet-container">
          </div>
          <script type="text/javascript">
            if(!$(document.body).hasClassName('process-template')) {
              Rounder.init();
            }
          </script>
          <?php
           /*
          <div class='habblet-container'>
            <div class='cbb clearfix lightbrown'>
              <h2 class='title'>Discount!</h2>
              <div class='box-content'>
                Hurrah! A major discount on all <?php echo $pagename; ?> subscriptions! Buy one on this page now and save up to 15 credits!
              </div>
            </div>
          </div>
          <script type='text/javascript'>
          if (!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
          </script> */
          ?>
        </div>
      </div>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>