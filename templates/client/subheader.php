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
(!defined('IN_HOLOCMS') ? header('Location: ../index.php') : '');
?>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title><?php echo $shortname; ?> ~ Client</title>
    <script src="<?php echo $web_gallery; ?>static/js/visual.js" type="text/javascript"></script>
    <script src="<?php echo $web_gallery; ?>static/js/domready.js" type="text/javascript"></script>
    <script src="<?php echo $web_gallery; ?>static/js/libs.js" type="text/javascript"></script>
    <script src="<?php echo $web_gallery; ?>static/js/common.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/style.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/buttons.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/boxes.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/tooltips.css" type="text/css" />
    <script type="text/javascript">
      document.habboLoggedIn = true;
      var habboName = '<?php echo $name; ?>';
      var habboReqPath = '';
      var habboStaticFilePath = '<?php echo $web_gallery; ?>';
      var habboImagerUrl = '<?php echo $path; ?>habbo-imaging/';
      var habboPartner = 'HoloCMS';
      window.name = 'client';
    </script>
    <script src="<?php echo $web_gallery; ?>static/js/habboclient.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/habboclient.css" type="text/css" />
    <script type="text/javascript">
      var habboClient = true;
      HabboClientUtils.init();
    </script>
    <meta name="description" content="<?php echo ucfirst($shortname); ?> is a virtual world where you can meet and make friends." />
    <meta name="keywords" content="<?php echo strtolower($shortname); ?>, virtual world, play games, enter competitions, make friends" />
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/ie.css" type="text/css" />
    <![endif]-->
        <!--[if lt IE 7]>
    <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/ie6.css" type="text/css" />
    <script src="<?php echo $web_gallery; ?>static/js/pngfix.js" type="text/javascript"></script>
    <script type="text/javascript">
    try { document.execCommand('BackgroundImageCache', false, true); } catch(e) {}
    </script>

    <style type="text/css">
    body { behavior: url(/js/csshover.htc); }
    </style>
    <![endif]-->
    <meta name="build" content="9.0.50 - Loader Template - HoloCMS" />
  </head>