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

$referral = isset($_GET['referral']) ? FilterText($_GET['referral']) : '';
$welcome = isset($_GET['welcome']) ? FilterText($_GET['welcome']) : '';

if($logged_in) {
  $username = $_SESSION['username'];
  $password = $_SESSION['password'];
  $sql = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$username}' LIMIT 1") or die(mysqli_error($connection));
  $row = mysqli_fetch_assoc($sql);
  if($row['password'] != $password) {
    session_destroy();
  }
}
?>
  <html>
  <head>
    <title>Redirecting...</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <style type="text/css">
      body {
        background-color: #e3e3db;
        text-align: center;
        font: 11px Verdana, Arial, Helvetica, sans-serif;
      }
      
      a {
        color: #fc6204;
      }
    </style>
  </head>
  <body>
    <?php if(!empty($welcome)) { ?>
    <script type="text/javascript">
      window.location.replace('welcome.php?referral=<?php echo $referral; ?>');
    </script>
    <noscript>
      <meta http-equiv="Refresh" content="0;URL=welcome.php">
    </noscript>
    <?php } else { ?>
    <script type="text/javascript">
      window.location.replace('index.php');
    </script>
    <noscript>
      <meta http-equiv="Refresh" content="0;URL=index.php">
    </noscript>
    <?php } ?>
    <p class="btn">If you are not automatically redirected, please <a href="<?php echo $path; ?>index.php" id="manual_redirect_link">click here</a></p>
  </body>
  </html>