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
?>
  <div id="faq-footer" class="clearfix">
    <p><a href="<?php echo $path; ?>disclaimer.php" target="_self">Terms of Service</a> | <a href="<?php echo $path; ?>privacy.php" target="_self">Privacy Policy</a></p>
    <?php /*@@* DO NOT EDIT OR REMOVE THE LINE BELOW WHATSOEVER! *@@*/ ?>
    <p>Powered by <a href="http://github.com/MiguelGonzalezAravena/HoloCMS" target="_blank">HoloCMS</a> &copy 2016 Miguel González Aravena.<br />
    HABBO is a registered trademark of Sulake Corporation. All rights reserved to their respective owner(s).<br />
    We are not endorsed, affiliated, or sponsered by Sulake Corporation Oy.</p>
    <?php /*@@* DO NOT EDIT OR REMOVE THE LINE ABOVE WHATSOEVER! *@@*/ ?>
  </div>
  <script type="text/javascript">
    HabboView.run();
  </script>
<?php echo $analytics; ?>
</body>
</html>