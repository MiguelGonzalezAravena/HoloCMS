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

$wide_enabled = getContent('client-widescreen') == 1 ? true : false;
?>
  <body id="client"<?php echo ($wide_enabled ? ' class="wide"' : ''); ?>>
    <div id="client-topbar" style="display:none">
      <div class="logo"><img src="<?php echo $web_gallery; ?>images/popup/popup_topbar_habbologo.gif" alt="" align="middle" /></div>
      <div class="habbocount">
        <div id="habboCountUpdateTarget">
          <?php echo $online_count . ' ' . $shortname; ?>s online now
        </div>
        <script language="JavaScript" type="text/javascript">
          setTimeout(function() {
            HabboCounter.init(600);
          }, 20000);
        </script>
      </div>
      <div class="logout"><a href="#" onclick="self.close(); return false;">Close Hotel</a></div>
    </div>
