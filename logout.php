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
require_once(dirname(__FILE__) . '/locale/' . $language . '/login.php');

  mysqli_query($connection, "UPDATE users SET online = '0' WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
  // Destroy the 'remember me' cookie by making it expire 100 days ago
  setcookie('remember', '', time()-60*60*24*100, '/');
  setcookie('rusername', '', time()-60*60*24*100, '/');
  setcookie('rpassword', '', time()-60*60*24*100, '/');
  setcookie('cookpass', '', time()-60*60*24*100, '/');

  require_once(dirname(__FILE__) . '/templates/login/subheader.php');
  require_once(dirname(__FILE__) . '/templates/login/header.php');

if(isset($login_error) && $is_banned > 0) {
?>
  <div id="process-content">
    <div class="action-error flash-message">
      <div class="rounded">
        <b><?php echo $login_error; ?></b>
      </div>
    </div>
    <div style="text-align: center">
      <div style="width:100px; margin: 10px auto"><a href="<?php echo $path; ?>index.php" id="logout-ok" class="new-button fill"><b><?php echo $locale['ok']; ?></b><i></i></a></div>
      <div id="column1" class="column"></div>
      <div id="column2" class="column"></div>
    </div>
    <?php
} elseif($_SESSION['username']) {
  session_destroy();
?>
  <div id="process-content">
    <div class="action-confirmation flash-message">
      <div class="rounded">
        <b><?php echo $locale['logged_out']; ?></b>
      </div>
    </div>
    <div style="text-align: center">
      <div style="width:100px; margin: 10px auto"><a href="<?php echo $path; ?>index.php" id="logout-ok" class="new-button fill"><b><?php echo $locale['ok']; ?></b><i></i></a></div>
      <div id="column1" class="column"></div>
      <div id="column2" class="column"></div>
    </div>
<?php } else { ?>
  <div id="process-content">
    <div class="action-error flash-message">
      <div class="rounded">
        <b><?php echo $locale['error_not_logged_in']; ?></b>
      </div>
    </div>
    <div style="text-align: center">
      <div style="width:100px; margin: 10px auto"><a href="index.php" id="logout-ok" class="new-button fill"><b><?php echo $locale['ok']; ?></b><i></i></a></div>
      <div id="column1" class="column">
      </div>
      <div id="column2" class="column">
      </div>
    </div>
<?php
}
require_once(dirname(__FILE__) . '/templates/login/footer.php');
?>