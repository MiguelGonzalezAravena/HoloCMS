<?php
/*==================================+
|| # HoloCMS - Website and Content Management System
|+==================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+==================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+==================================*/
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
?>
  <br />
  <div class="copy" align="center">HoloCMS v<?php echo $holocms['version']; ?> [<?php echo $holocms['title']; ?> ] <?php echo $holocms['stable']; ?><br />
    <font size="1">Build <?php echo $holocms['date']; ?></font>
  </div>
</div>
<?php echo $analytics; ?>
</body>
</html>