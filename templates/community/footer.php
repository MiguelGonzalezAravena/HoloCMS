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
$noads = false;

if($noads == true) {
  // Nothing here.
} else if($pageid == 'forum') {
  // And nothing here.
} else {
  $sql = mysqli_query($connection, "SELECT * FROM cms_banners WHERE status = '1' ORDER BY id ASC");
?>
      <div id="column3" class="column">
        <script type="text/javascript">
          HabboView.run();
        </script>
        <div class="habblet-container">
          <div class="ad-container">
            <?php
              while($row = mysqli_fetch_assoc($sql)) {
                if($row['advanced'] == 1) {
                  echo HoloText($row['html']) . '<br />';
                } else {
            ?>
            <a target="blank" href="<?php echo $row['url']; ?>"><img src="<?php echo $row['banner']; ?>"></a><br />
            <a target="blank" href="<?php echo $row['url']; ?>"><?php echo HoloText($row['text']); ?></a><br />
            <?php
                }
              }
            ?>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <?php } ?>
      <!--[if lt IE 7]>
      <script type="text/javascript">
        Pngfix.doPngImageFix();
      </script>
      <![endif]-->
    </div>
    <div id="footer">
      <p>
        <a href="<?php echo $path; ?>index.php" target="_self">Homepage</a> | 
        <a href="<?php echo $path; ?>disclaimer.php" target="_self">Terms of Service</a> | 
        <a href="<?php echo $path; ?>privacy.php" target="_self">Privacy Policy</a>
        </p>
      <?php /*@@* DO NOT EDIT OR REMOVE THE LINE BELOW WHATSOEVER! *@@ You ARE allowed to remove the link to the HoloCMS site though*/ ?>
      <p>
        Powered by <a href="https://github.com/MiguelGonzalezAravena/HoloCMS" target="_blank">HoloCMS</a> &copy; 2016 Miguel González Aravena.<br />
      </p>
      <?php /*@@* DO NOT EDIT OR REMOVE THE LINE ABOVE WHATSOEVER! *@@ You ARE allowed to remove the link to the HoloCMS site though*/ ?>
    </div>
  </div>
</div>
  <script type="text/javascript">
    HabboView.run();
  </script>
  <?php echo $analytics; ?>
  </body>
</html>