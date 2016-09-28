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

if($cored != true) {
  require_once(dirname(__FILE__) . '/core.php');
  require_once(dirname(__FILE__) . '/includes/session.php');
}
$pageid = 'profile';
$pagename = 'Page not found';
require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
<div id="container">
  <div id="content" style="position: relative" class="clearfix">
    <div id="column1" class="column">
      <div class="habblet-container">
        <div class="cbb clearfix red">
          <h2 class="title">Page not found!</h2>
          <div id="notfound-content" class="box-content">
            <p class="error-text">Sorry, but the page you were looking for was not found.</p>
            <img id="error-image" src="<?php echo $web_gallery; ?>v2/images/error.gif" />
            <p class="error-text">Please use the 'Back' button to get back to where you started.</p>
          </div>
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
        <div class="cbb clearfix green">
          <h2 class="title">Were you looking for...</h2>
          <div id="notfound-looking-for" class="box-content">
            <p>
              <b>A friend's group or personal page?</b><br />
              See if it is listed on the <a href="<?php echo $path; ?>community.php">Community</a> page.
            </p>
            <p>
              <b>Rooms that rock?</b><br />
              Browse the <a href="<?php echo $path; ?>community.php">Recommended Rooms</a> list.
            </p>
            <p>
              <b>What other users are in to?</b><br />
              Check out the <a href="<?php echo $path; ?>tags.php">Top Tags</a> list.
            </p>
            <p>
              <b>How to get Credits?</b><br />
              Have a look at the <a href="<?php echo $path; ?>credits.php">Credits</a> page.
            </p>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
    </div>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>