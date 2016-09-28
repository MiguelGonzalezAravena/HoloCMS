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
(!defined('IN_HOLOCMS')) ? header('Location: ../index.php') : '';

$pagename = (empty($pagename) && isset($searchname)) ? $searchname : 'User profile';

$xid = (isset($groupid)) ? $groupid : $user_row['id'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title><?php echo $shortname; ?> ~ <?php echo HoloText($pagename); ?></title>
  <script type="text/javascript">
    var andSoItBegins = (new Date()).getTime();
  </script>
  <script src="<?php echo $web_gallery; ?>static/js/visual.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/libs.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/common.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/fullcontent.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/libs2.js" type="text/javascript"></script>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/style.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/buttons.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/boxes.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/tooltips.css" type="text/css" />
  <link rel="alternate" type="application/rss+xml" title="<?php echo $sitename; ?> News RSS" href="./rss.php"/>
  <script type="text/javascript">
    document.habboLoggedIn = true;
    var habboName = '<?php echo $name; ?>';
    var habboReqPath = '';
    var habboStaticFilePath = '<?php echo $web_gallery; ?>';
    var habboImagerUrl = '<?php echo $path; ?>habbo-imaging/';
    var habboPartner = 'HoloCMS';
    window.name = 'habboMain';
  </script>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/myhabbo.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/skins.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/dialogs.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/buttons.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/control.textarea.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>styles/myhabbo/boxes.css" type="text/css" />
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/myhabbo.css" type="text/css" />
  <link href="<?php echo $web_gallery; ?>styles/myhabbo/assets.css" type="text/css" rel="stylesheet" />
  <script src="<?php echo $web_gallery; ?>static/js/homeview.js" type="text/javascript"></script>
  <script src="<?php echo $web_gallery; ?>static/js/homeauth.js" type="text/javascript"></script>
  <link rel="stylesheet" href="<?php echo $web_gallery; ?>v2/styles/group.css" type="text/css" />
  <style type="text/css">
  <?php if(isset($groupid)) { ?>
    #playground, #playground-outer {
      width: 922px;
      height: 1360px;
    }
  <?php } else if(IsHCMember($user_row['id'])) { ?>
    #playground, #playground-outer {
      width: 922px;
      height: 1360px;
    }
  <?php } else { ?>
    #playground, #playground-outer {
      width: 752px;
      height: 1360px;
    }
  <?php } ?>
  </style>
  <script src="<?php echo $web_gallery; ?>static/js/homeedit.js" type="text/javascript"></script>
  <script language="JavaScript" type="text/javascript">
    document.observe('dom:loaded', function() {
      initView(<?php echo $xid; ?>, <?php echo $xid; ?>);
    });
    function isElementLimitReached() {
      if(getElementCount() >= 200) {
        showHabboHomeMessageBox('Error', 'You have already placed the maximum number of items on the page. Remove a sticker, note or widget to be able to place this item.', 'Close');
        return true;
      }
      return false;
    }

    function cancelEditing(expired) {
      location.replace('<?php echo (!isset($groupid) ? 'user_profile.php?name=' . $searchname : 'group_profile.php?id=' . $groupid); ?>' + (expired ? '?expired=true' : ''));
    }

    function getSaveEditingActionName() {
      return 'savehome.php';
    }

    function showEditErrorDialog() {
      var closeEditErrorDialog = function(e) {
        if (e) {
          Event.stop(e);
        }
        Element.remove($('myhabbo-error'));
        Overlay.hide();
      }
      var dialog = Dialog.createDialog('myhabbo-error', '', false, false, false, closeEditErrorDialog);
      Dialog.setDialogBody(dialog, '<p>Error occured! Please try again in couple of minutes.</p><p><a href="#" class="new-button" id="myhabbo-error-close"><b>Close</b><i></i></a></p><div class="clear"></div>');
      Event.observe($('myhabbo-error-close'), 'click', closeEditErrorDialog);
      Dialog.moveDialogToCenter(dialog);
      Dialog.makeDialogDraggable(dialog);
    }

    function showSaveOverlay() {
      var invalidPos = getElementsInInvalidPositions();
      if (invalidPos.length > 0) {
        showHabboHomeMessageBox('Sorry!', 'Sorry, but you can\'t place your stickers, notes or widgets here. Close the window to continue editing your page.', 'Close');
        $A(invalidPos).each(function(el) {
          Effect.Pulsate(el);
        });
        return false;
      } else {
        Overlay.show(null, 'Saving');
        return true;
      }
    }
  </script>

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
  <meta name="build" content="21.0.53 - HoloCMS Homes" />
</head>