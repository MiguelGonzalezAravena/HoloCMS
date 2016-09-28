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
(!defined('IN_HOLOCMS')) ? header('Location: index.php') : '';
?>
        <!--[if lt IE 7]>
          <script type="text/javascript">
            Pngfix.doPngImageFix();
          </script>
        <![endif]-->
        <div id="footer">
          <p>
            <a href="<?php echo $path; ?>index.php" target="_self">Homepage</a> | 
            <a href="<?php echo $path; ?>disclaimer.php" target="_self">Terms of Service</a> | 
            <a href="<?php echo $path; ?>privacy.php" target="_self">Privacy Policy</a>
            <?php if($rank['iAdmin'] == 1 || $user_rank > 5) { ?>
             | <a href="<?php echo $path; ?>housekeeping.php" target="_self"><b>Housekeeping</b></a>
            <?php } ?>
          </p>
          <?php /*@@* DO NOT EDIT OR REMOVE THE LINE BELOW WHATSOEVER! *@@ You ARE allowed to remove the link to the HoloCMS site though*/ ?>
          <p>
            Powered by <a href="https://github.com/MiguelGonzalezAravena/HoloCMS" target="_blank">HoloCMS</a> &copy; Miguel González Aravena.
          </p>
          <?php /*@@* DO NOT EDIT OR REMOVE THE LINE ABOVE WHATSOEVER! *@@ You ARE allowed to remove the link to the HoloCMS site though*/ ?>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  HabboView.run();
</script>
<?php echo $analytics; ?>
</body>
</html>