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
(!defined('IN_HOLOCMS')) ? header('Location: ..index.php') : '';
$pagename = (!isset($pagename) || empty($pagename)) ? $shortname : $pagename;
$body_id = isset($body_id) ? $body_id : '';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title><?php echo $shortname; ?> ~ <?php echo $pagename; ?> </title>
  <script type="text/javascript">
    var andSoItBegins = (new Date()).getTime();
  </script>

  <link rel="shortcut icon" href="favicon.ico" type="image/vnd.microsoft.icon" />
  <script src="<?php echo $web_gallery; ?>static/js/visual.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/libs.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/common.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/fullcontent.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/libs2.js" type="text/javascript"></script>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/style.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/buttons.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/boxes.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/tooltips.css" type="text/css" />
  <link rel="alternate" type="application/rss+xml" title="<?php $sitename; ?> News RSS" href="<?php echo $path; ?>rss.php"/>

  <script type="text/javascript">
    document.habboLoggedIn = true;
    var habboName = '<?php echo $name; ?>';
    var habboReqPath = '';
    var habboStaticFilePath = '<?php echo $web_gallery; ?>';
    var habboImagerUrl = '<?php echo $path; ?>habbo-imaging/';
    var habboPartner = 'Meth0d.org';
    window.name = 'habboMain';
  </script>

  <?php if($notify_maintenance) { ?>
  <link href="<?php echo $web_gallery; ?>maintenance/style_admin.css" type="text/css" rel="stylesheet" />
  <?php } ?>

  <?php if($pageid == 'forum') { ?>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/myhabbo.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/skins.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/dialogs.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/buttons.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/control.textarea.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/boxes.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/myhabbo.css" type="text/css" />

  <script src="<?php echo $web_gallery; ?>static/js/homeview.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/homeauth.js" type="text/javascript"></script>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/group.css" type="text/css" />
  <style type="text/css">
    #playground, #playground-outer {
      width: 752px;
      height: 1360px;
    }
  </style>

  <script type="text/javascript">
    document.observe("dom:loaded", function() {
      initView(55918, 1478728);
    });
  </script>

  <link href="<?php echo $web_gallery; ?>styles/discussions.css" type="text/css" rel="stylesheet"/>
  <?php } ?>

  <?php if($body_id == 'home' || empty($body_id)) { ?>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/welcome.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/personal.css" type="text/css" />

  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/group.css" type="text/css" />
  <script src="<?php echo $web_gallery; ?>static/js/group.js" type="text/javascript"></script>

  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/rooms.css" type="text/css" />
  <script src="<?php echo $web_gallery; ?>static/js/rooms.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/moredata.js" type="text/javascript"></script>
  <?php } ?>

  <?php if($pageid == 1 || $pageid == 7) { ?>
  <script src="<?php echo $web_gallery; ?>static/js/habboclub.js" type="text/javascript"></script>
  <?php } ?>

  <?php if($body_id == 'profile') { ?>
  <script src="<?php echo $web_gallery; ?>static/js/settings.js" type="text/javascript"></script>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/settings.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/friendmanagement.css" type="text/css" />
  <?php } ?>

  <?php if($pageid == 1) { ?>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/minimail.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/control.textarea.css" type="text/css" />
  <script src="<?php echo $web_gallery; ?>static/js/minimail.js" type="text/javascript"></script>
  <?php } ?>

  <meta name="description" content="<?php echo ucfirst($sitename); ?> is a virtual world where you can meet and make friends." />
  <meta name="keywords" content="<?php echo strtolower($sitename); ?>, <?php echo strtolower($shortname); ?>, virtual world, play games, enter competitions, make friends" />
  <!--[if lt IE 8]>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/ie.css" type="text/css" />
  <![endif]-->
  <!--[if lt IE 7]>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/ie6.css" type="text/css" />
  <script src="<?php echo $web_gallery; ?>static/js/pngfix.js" type="text/javascript"></script>
  <script type="text/javascript">
    try {
      document.execCommand('BackgroundImageCache', false, true);
    } catch(e) {}
  </script>

  <style type="text/css">
    body {
      behavior: url(<?php echo $web_gallery; ?>csshover.htc);
    }
  </style>
  <![endif]-->
  <meta name="build" content="9.0.47 - Community Template - HoloCMS" />
</head>