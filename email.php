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

$key = isset($_GET['key']) ? FilterText($_GET['key']) : '';
$remove = isset($_GET['remove']) ? FilterText($_GET['remove']) : '';

if(!empty($key)) {
  $keysql = mysqli_query($connection, "SELECT * FROM cms_verify WHERE key_hash = '{$key}' LIMIT 1");
  if(mysqli_num_rows($keysql) > 0) {
    $keyrow = mysqli_fetch_assoc($keysql);
    $email_verify_status = mysqli_fetch_assoc(mysqli_query($connection, "SELECT email_verified FROM users WHERE id = '{$keyrow['id']}' LIMIT 1"));
    $reward = ($email_verify_status['email_verified'] == -1) ? false : true;
    mysqli_query($connection, "UPDATE users SET email_verified = '1', email = '{$keyrow['email']}' WHERE id = '{$keyrow['id']}' LIMIT 1");
    if($reward == true) {
      mysqli_query($connection, "UPDATE users SET credits = credits + {$email_verify_reward} WHERE id = '{$keyrow['id']}' LIMIT 1");
      mysqli_query($connection, "INSERT INTO cms_transactions(userid, date, amount, descr) VALUES('{$keyrow['id']}', '{$date_full}', '{$email_verify_reward}', 'Verifying your email address')") or die(mysqli_error($connection));
    }
    mysqli_query($connection, "DELETE FROM cms_verify WHERE key_hash = '{$key}' LIMIT 1");
    $sucess = 1;
  } else {
    $sucess = 0;
  }
} else {
  $sucess = 0;
}

if(!empty($remove)) {
  $keysql = mysqli_query($connection, "SELECT * FROM cms_verify WHERE key_hash = '{$remove}' LIMIT 1");
  if(mysqli_num_rows($keysql) > 0) {
    $keyrow = mysqli_fetch_assoc($keysql);
    mysqli_query($connection, "UPDATE users SET email = '', email_verified = '-1', newsletter = '0' WHERE id = '{$keyrow['id']}' LIMIT 1");
    mysqli_query($connection, "DELETE FROM cms_verify WHERE key_hash = '{$remove}' LIMIT 1");
    $sucess = 2;
  } else {
    $sucess = 0;
  }
}

require_once(dirname(__FILE__) . '/locale/' . $language . '/login.php');
require_once(dirname(__FILE__) . '/templates/login/subheader.php');
require_once(dirname(__FILE__) . '/templates/login/header.php');

if($sucess == 1) {
?>
  <div id="process-content">
    <div id="email-verified-container">
      <div class="cbb clearfix green">
        <h2 class="title heading">Email link handled successfully</h2>
        <div class="box-content">
          <ul>
            <li>Your email address is now verified.</li>
          </ul>
          <a href="<?php echo $path; ?>">Continue to <?php echo $shortname; ?> front page.</a>
        </div>
      </div>
    </div>
<?php } else if($sucess == 2) { ?>
  <div id="process-content">
    <div id="email-verified-container">
      <div class="cbb clearfix green">
        <h2 class="title heading">Email link handled successfully</h2>
        <div class="box-content">
          <ul>
            <li>You should no longer receive emails from <?php echo $sitename; ?>. Your email address has been deleted.</li>
          </ul>
          <a href="<?php echo $path; ?>">Continue to <?php echo $shortname; ?> front page.</a>
        </div>
      </div>
    </div>
<?php } else { ?>
  <div id="process-content">
    <div id="email-verified-container">
      <div class="cbb clearfix red">
        <h2 class="title heading">Error handling email link</h2>
        <div class="box-content">
          <ul>
            <li>The verification code is invalid or the action has already been done.</li>
          </ul>
          <a href="<?php echo $path; ?>">Continue to <?php echo $shortname; ?> front page.</a>
        </div>
      </div>
    </div>
<?php
}
require_once(dirname(__FILE__) . '/templates/login/footer.php');
?>