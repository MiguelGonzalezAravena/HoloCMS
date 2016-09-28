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

$forwardId = isset($_GET['forwardId']) ? (int) $_GET['forwardId'] : '';
$roomId = isset($_GET['roomId']) ? (int) $_GET['roomId'] : '';
$wide = isset($_GET['wide']) ? (int) $_GET['wide'] : '';

$ssocheck = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$rawname}' and password = '{$rawpass}' LIMIT 1") or die(mysqli_error($connection));
$ssocheck2 = mysqli_fetch_assoc($ssocheck);
if(empty($ssocheck2['ticket_sso'])) {
  if(!empty($roomId) && $forwardId == 2) {
    if(!empty($wide)) {
      header('Location: reauthenticate.php?forwardId=' . $forwardId . '&roomId=' . $roomId . '&wide=' . $wide);
    } else {
      header('Location: reauthenticate.php?forwardId=' . $forwardId . '&roomId=' . $roomId);
    }
  } elseif(!empty($wide)) {
      header('Location: reauthenticate.php?wide=' . $wide);
  } else {
      header('Location: reauthenticate.php');
  }
}

if(HoloText(getContent('client-widescreen')) == 1) {
  $wide_enabled = true;
} else {
  $wide_enabled = false;
}

if(!empty($wide) ? $wide : false == false) {
  $wide_enabled = false;
} else {
  $wide_enabled = true;
}

if($wide_enabled == false) {
  $width = 720;
  $height = 540;
  $widemode = false;
} else {
  $width = 960;
  $height = 540;
  $widemode = true;
}

($logged_in) ? require_once(dirname(__FILE__) . '/includes/session.php') : header('Location: clientutils.php?key=LogInPlease');

require_once(dirname(__FILE__) . '/templates/client/subheader.php');
require_once(dirname(__FILE__) . '/templates/client/header.php');

if($online != 'online' && $enable_status_image == 1) {
  echo '<font color="white"><center><b>' . $sitename . ' is offline</b></center></font>';
  exit;
}

if($remote_ip == '127.0.0.1' || $remote_ip == 'localhost' && $server_on_localhost == 1) {
  $ip = '127.0.0.1';
}

if(!empty($roomId) && $forwardId == 2) {
  $roomId = $roomId;
  $checkSQL = mysqli_query($connection, "SELECT id FROM rooms WHERE id = '{$roomId}' LIMIT 1");
  $roomExists = mysqli_num_rows($checkSQL);
  if($roomExists > 0) {
    $forward = 1;
    echo '<!-- Forwarding to room ' . $roomId . ' -->';
  } else {
    $forward = 0;
    echo '<!-- Room doesn\'t exist; not forwarding -->';
  }
} else {
  echo '<!-- No room forward requested, normal loader -->';
  $forward = 0;
}

?>
  <div id="clientembed-container">
    <?php
      $sql = mysqli_query($connection, "SELECT value FROM cms_system WHERE systemVar = 'loader'");
      $row = mysqli_fetch_assoc($sql);
      if($row['value'] == 1) {
    ?>
    <div id="clientembed-loader" style="display:none">
      <div><b>opening <?php echo $shortname; ?>...</b></div>
    </div>
    <?php } ?>
    <div id="clientembed">
      <script type="text/javascript" language="javascript">
        try {
          var _shockwaveDetectionSuccessful = true;
          _shockwaveDetectionSuccessful = ShockwaveInstallation.swDetectionCheck();
          if(!_shockwaveDetectionSuccessful) {
            log(50);
          }
          if(_shockwaveDetectionSuccessful) {
            HabboClientUtils.cacheCheck();
          }
        } catch (e) {
          try {
            HabboClientUtils.logClientJavascriptError(e);
          } catch (e2) {}
        }

        HabboClientUtils.extWrite('<object classid="clsid:166B1BCA-3F9C-11CF-8075-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=10,0,0,0" id="<?php echo $shortname; ?>" width="<?php echo $width; ?>" height="<?php echo $height; ?>"><param name="src" value="<?php echo $dcr; ?>"><param name="swRemote" value="swSaveEnabled=\'true\' swVolume=\'true\' swRestart=\'false\' swPausePlay=\'false\' swFastForward=\'false\' swTitle=\'<?php echo $sitename; ?>\' swContextMenu=\'true\' "><param name="swStretchStyle" value="stage"><param name="swText" value="><param name="bgColor" value="#000000"><param name="sw6" value="client.connection.failed.url=<?php echo $path; ?>clientutils.php?key=connection_failed;external.variables.txt=<?php echo $variables; ?>"><param name="sw8" value="use.sso.ticket=1;sso.ticket=<?php echo $myticket; ?>"><param name="sw2" value="connection.info.host=<?php echo $ip; ?>;connection.info.port=<?php echo $port; ?>"><param name="sw4" value="site.url=<?php echo $path; ?>;url.prefix=<?php echo $path; ?>">   <param name="sw3" value="connection.mus.host=<?php echo $ip; ?>;connection.mus.port=<?php echo $fip; ?>"><param name="sw1" value="client.allow.cross.domain=1;client.notify.cross.domain=0"><param name="sw7" value="external.texts.txt=<?php echo $texts; ?>;user_isp=<?php echo $remote_ip; ?>"><?php echo ($forward == 1 ? '<param name="sw9" value="forward.type=' . $forwardId . ';forward.id=' . $roomId . ';processlog.url=">' : ''); ?><param name="sw5" value="client.reload.url=<?php echo $path; ?>client.php?x=reauthenticate;client.fatal.error.url=<?php echo $path; ?>clientutils.php?key=error"><embed src="<?php echo $dcr; ?>" bgColor="#000000" width="<?php echo $width; ?>" height="<?php echo $height; ?>" swRemote="swSaveEnabled=\'true\' swVolume=\'true\' swRestart=\'false\' swPausePlay=\'false\' swFastForward=\'false\' swTitle=\'<?php echo $sitename; ?>\' swContextMenu=\'true\'" swStretchStyle="stage" swText=" type="application/x-director" pluginspage="http://www.macromedia.com/shockwave/download/" sw6="client.connection.failed.url=<?php echo $path; ?>clientutils.php?key=connection_failed;external.variables.txt=<?php echo $variables; ?>" sw8="use.sso.ticket=1;sso.ticket=<?php echo $myticket; ?>" sw2="connection.info.host=<?php echo $ip; ?>;connection.info.port=<?php echo $port; ?>" sw4="site.url=<?php echo $path; ?>;url.prefix=<?php echo $path; ?>" sw3="connection.mus.host=<?php echo $ip; ?>;connection.mus.port=<?php echo $fip; ?>" sw1="client.allow.cross.domain=1;client.notify.cross.domain=0" sw7="external.texts.txt=<?php echo $texts; ?>;user_isp=<?php echo $remote_ip; ?>" <?php echo ($forward == 1 ? 'sw9="forward.type=' . $forwardId . ';forward.id=' . $roomId . ';processlog.url="' : ''); ?> sw5="client.reload.url=<?php echo $path; ?>client.php?x=reauthenticate;client.fatal.error.url=<?php echo $path; ?>clientutils.php?key=error"></embed><noembed>client.pluginerror.message</noembed></object>');
      </script>
      <noscript>
        <object classid="clsid:166B1BCA-3F9C-11CF-8075-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=10,0,0,0" id="<?php echo $shortname; ?>" width="<?php echo $width; ?>" height="<?php echo $height; ?>">
          <param name="src" value="<?php echo $dcr; ?>">
          <param name="swRemote" value="swSaveEnabled='true' swVolume='true' swRestart='false' swPausePlay='false' swFastForward='false' swTitle='<?php echo $sitename; ?>' swContextMenu='true'">
          <param name="swStretchStyle" value="stage">
          <param name="swText" value="">
          <param name="bgColor" value="#000000">
          <?php echo ($forward == 1 ? '<param name="sw9" value="forward.type=' . $forwardId . ';forward.id=' . $roomId . ';processlog.url=">' : ''); ?>
          <param name="sw6" value="client.connection.failed.url=<?php echo $path; ?>clientutils.php?key=connection_failed;external.variables.txt=<?php echo $variables; ?>">
          <param name="sw8" value="use.sso.ticket=1;sso.ticket=<?php echo $myticket; ?>">
          <param name="sw2" value="connection.info.host=<?php echo $ip; ?>;connection.info.port=<?php echo $port; ?>">
          <param name="sw4" value="site.url=<?php echo $path; ?>;url.prefix=<?php echo $path; ?>">
          <param name="sw3" value="connection.mus.host=<?php echo $ip; ?>;connection.mus.port=<?php echo $fport; ?>">
          <param name="sw1" value="client.allow.cross.domain=1;client.notify.cross.domain=0">
          <param name="sw7" value="external.texts.txt=<?php echo $texts; ?>;user_isp=<?php echo $remote_ip; ?>">
          <param name="sw5" value="client.reload.url=<?php echo $path; ?>client.php?x=reauthenticate;client.fatal.error.url=<?php echo $path; ?>clientutils.php?key=error">
          <!--[if IE]>client.pluginerror.message<![endif]-->
          <embed src="<?php echo $dcr; ?>" bgColor="#000000" width="<?php echo $width; ?>" height="<?php echo $height; ?>" swRemote="swSaveEnabled='true' swVolume='true' swRestart='false' swPausePlay='false' swFastForward='false' swTitle='<?php echo $sitename; ?>' swContextMenu='true'" swStretchStyle="stage" swText="" type="application/x-director" pluginspage="http://www.macromedia.com/shockwave/download/" sw6="client.connection.failed.url=<?php echo $path; ?>clientutils.php?key=connection_failed;external.variables.txt=<?php echo $variables; ?>" sw8="use.sso.ticket=1;sso.ticket=<?php echo $myticket; ?>" sw2="connection.info.host=<?php echo $ip; ?>;connection.info.port=<?php echo $port; ?>" sw4="site.url=<?php echo $path; ?>;url.prefix=<?php echo $path; ?>" sw3="connection.mus.host=<?php echo $ip; ?>;connection.mus.port=<?php echo $fip; ?>" sw1="client.allow.cross.domain=1;client.notify.cross.domain=0" sw7="external.texts.txt=<?php echo $texts; ?>;user_isp=<?php echo $remote_ip; ?>" <?php echo ($forward == 1 ? 'sw9="forward.type=' . $forwardId . ';forward.id=' . $roomId . ';processlog.url="' : ''); ?> sw5="client.reload.url=<?php echo $path; ?>client.php?x=reauthenticate;client.fatal.error.url=<?php echo $path; ?>clientutils.php?key=error" ></embed>
          <noembed>client.pluginerror.message</noembed>
        </object>
      </noscript>
    </div>
    <?php if($row['loader'] == 1) { ?>
    <script type="text/javascript">
      HabboClientUtils.showLoader(['opening <?php echo $shortname; ?>&nbsp;&nbsp;&nbsp;', 'opening <?php echo $shortname; ?>.&nbsp;&nbsp;', 'opening <?php echo $shortname; ?>..&nbsp;', 'opening <?php echo $shortname; ?>...']);
    </script>
    <?php } ?>
  </div>
  <?php echo $analytics; ?>
</body>
</html>