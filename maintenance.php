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
$is_maintenance = true;

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/locale/' . $language . '/maintenance.php');

($maintenance != 1 ? header('Location: index.php') : '');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title>
      <?php echo $shortname; ?>
    </title>
    <link href="<?php echo $web_gallery; ?>maintenance/style.css" type="text/css" rel="stylesheet" />
  </head>
  <body>
    <div id="page-container">
      <div id="header-container"></div>
      <div id="maintenance-container">
        <div id="content-container">
          <div id="inner-container">
            <div id="left_col">
              <!-- bubble -->
              <div class="bubble">
                <div class="bubble-body">
                  <img src="<?php echo $web_gallery; ?>maintenance/alert_triangle.gif" width="30" height="29" alt="" border="0" align="left" class="triangle" />
                  <b><?php echo $locale['maintenance_frank']; ?></b>
                  <div class="clear"></div>
                </div>
              </div>
              <div class="bubble-bottom">
                <div class="bubble-bottom-body">
                  <img src="<?php echo $web_gallery; ?>maintenance/bubble_tail_left.gif" alt="" width="22" height="31" />
                </div>
              </div>
              <!-- \bubble -->
              <img src="<?php echo $web_gallery; ?>maintenance/frank_habbo_down.gif" width="57" height="87" alt="" border="0" />
            </div>
            <div id="right_col">
              <!-- bubble -->
              <div class="bubble">
                <div class="bubble-body">
                  <?php echo $locale['maintenance_greggers']; ?>
                    <div class="clear"></div>
                </div>
              </div>
              <div class="bubble-bottom">
                <div class="bubble-bottom-body">
                  <img src="<?php echo $web_gallery; ?>maintenance/bubble_tail_left.gif" alt="" width="22" height="31" />
                </div>
              </div>
              <!-- \bubble -->
              <img src="<?php echo $web_gallery; ?>maintenance/workman_habbo_down.gif" width="125" height="118" alt="" border="0" />
            </div>
          </div>
        </div>
      </div>
      <div id="footer-container">
        <center><a href="<?php echo $path; ?>housekeeping/" target="_self">Administrator Login</a></center>
      </div>
    </div>
    <?php echo $analytics; ?>
  </body>
  </html>