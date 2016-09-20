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
require_once(dirname(__FILE__) . '/../core.php');
?>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title><?php echo $shortname; ?> Help Tool</title>
    <link href="content3/styles/style.css" type="text/css" rel="stylesheet" />
    <link href="content3/styles/style-iot.css" type="text/css" rel="stylesheet" />
    <script language="javascript">
      function scrollDown() {
        window.scroll(0, 10000);
      }
    </script>
    <!--
    CSS revision: 1
    IOT version: 2.1.00 HOLO
    CSS build date: 20/01/2008 
    IOT deployment date: 20/01/2008 10:32 AM GMT+1
    -->
  </head>
  <body id="" onLoad="scrollDown();">
    <div id="">
      <table id="" border="0" cellpadding="0" cellspacing="0" width="720">
        <tr>
          <td style="background: url(<?php echo $path;?>iot/content3/images/process/top_left.gif) no-repeat; width: 8px; height: 77px;">&nbsp;</td>
          <td style="background: url(<?php echo $path;?>iot/content3/images/process/top_mid.gif) repeat-x;" valign="top">
            <div style="margin: 0; padding: 10px 0 0 27px; height: 67px;"><img src="<?php echo $path;?>iot/content3/images/top_bar/habbo_logo_uk.gif" /></div>
          </td>
          <td style="background: url(<?php echo $path;?>iot/content3/images/process/top_header_left.gif) no-repeat; width: 3px; height: 77px;"></td>
          <td style="background: url(<?php echo $path;?>iot/content3/images/process/top_header_mid.gif) repeat-x; height: 77px;">
            <div style="height: 43px; padding: 31px 0 0 4px; margin: 0; color: #fff; text-transform: uppercase; font-weight: bold; display: block;"><?php echo $shortname; ?> Help Tool</div>
          </td>
          <td style="background: url(<?php echo $path;?>iot/content3/images/process/top_header_mid.gif) repeat-x; height: 54px; padding: 23px 0 0 0;" align="right" valign="top"></td>
          <td style="background: url(<?php echo $path;?>iot/content3/images/process/top_right.gif) no-repeat; width: 26px; height: 77px;">&nbsp;</td>
        </tr>
      </table>
    </div>
    <div id="main-content-process">