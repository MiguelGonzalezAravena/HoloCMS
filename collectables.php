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

$pagename = 'Collectables';
$pageid = 'collectables';

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');

$sql = mysqli_query($connection, "SELECT * FROM cms_collectables WHERE month = '{$n}' OR month = '{$m}' AND year = '{$Y}' LIMIT 1");
$total = mysqli_num_rows($sql);
$row = mysqli_fetch_assoc($sql);
?>
  <script src="<?php echo $web_gallery; ?>static/js/credits.js" type="text/javascript"></script>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/collectibles.css" type="text/css" />
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="column1" class="column">
        <div class="habblet-container" id="collectible-current">
          <div class="cbb clearfix gray">
            <h2 class="title">Current Collectable</h2>
            <div id="collectible-current-content" class="clearfix">
              <div id="collectibles-current-img" style="background-image: url(<?php echo $row['image_large']; ?>)"></div>
              <h4><?php echo HoloText($row['title']); ?></h4>
              <p><?php echo date('F'); ?> <?php echo date('o'); ?></p>
              <p class="last"><?php echo HoloText($row['description']); ?></p>
              <?php if($logged_in && $total > 0) { ?>
              <p id="collectibles-purchase">
                <a href="#" class="new-button collectibles-purchase-current"><b>Purchase</b><i></i></a>
                <span class="collectibles-timeleft">Time left: <span id="collectibles-timeleft-value"></span></span>
              </p>
              <?php } ?>
            </div>
            <?php
            // calculate time
            $time = time();
            $day = date("j");
            $month = date("n");
            $year = date("y");
            $date = mktime(0,0,0, $month, 31, $year);
            $timeleft = $date-$time;
            ?>
            <script type="text/javascript">
              L10N.put('collectibles.purchase.title', 'Confirm Collectable Purchase');
              L10N.put('time.days', '{0}d');
              L10N.put('time.hours', '{0}h');
              L10N.put('time.minutes', '{0}min');
              L10N.put('time.seconds', '{0}s');
              Collectibles.init(<?php echo $timeleft; ?>);
            </script>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
          <div class="cbb clearfix red">
            <h2 class="title">Collectable Showroom</h2>
            <ul id="collectibles-list">
              <?php
                $sql = mysqli_query($connection, "SELECT * FROM cms_collectables WHERE showroom = '1' ORDER BY id DESC");
                $total = mysqli_num_rows($sql);
                if($total == 0) {
              ?>
              <li class="odd clearfix">
                No collectables in showroom.
              </li>
              <?php
                } else {
                  while($row = mysqli_fetch_assoc($sql)) {
                    $i++;
                    $even = ($IsEven($i)) ? 'even' : 'odd';
              ?>
                <li class="<?php echo $even; ?> clearfix">
                  <div class="collectibles-prodimg" style="background-image: url(<?php echo $row['image_small']; ?>)"></div>
                  <h4><?php echo month($row['month']); ?> <?php echo $row['year']; ?>: <?php echo HoloText($row['title']); ?></h4>
                  <p class="collectibles-proddesc last"><?php echo HoloText($row['description']); ?></p>
                </li>
              <?php
                  }
                }
              ?>
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
          <div class="cbb clearfix red">
            <h2 class="title">What are Collectables?</h2>
            <div id="collectibles-instructions" class="box-content">
              Collectables are special furniture sold only for a limited and set period of time. Experienced <?php echo $shortname . 's'; ?> would know them as rares. They always cost the same - 25 Credits.
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
          <div class="cbb clearfix red">
            <h2 class="title">Invest in Collectables</h2>
            <div class="box-content">
              <p class="collectibles-value-intro">
                <img src="<?php echo $web_gallery; ?>v2/images/collectibles/ukplane.png" alt="" width="79" height="47" />
                Collect your way to the riches!  Collectables not only make a great piece of Furni but also come with an amazing trade value.  As collectables will never be sold again (that's a promise), the value will keep increasing in time.
              </p>
              <p class="clear last">
                <img src="<?php echo $web_gallery; ?>v2/images/collectibles/chart.png" alt="" width="272" height="117" />
              </p>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>
