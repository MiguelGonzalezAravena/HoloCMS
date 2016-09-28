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
$id = isset(_GET['id']) ? (int) $_GET['id'] : 0;

if(!empty($id)) {
  $sql = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$id}'");
  $row = mysqli_fetch_assoc($sql);
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
    <script type="text/javascript">
      window.location.replace('user_profile.php?tag=<?php echo $row['name']; ?>');
    </script>
    <noscript>
      <meta http-equiv="Refresh" content="0;URL=user_profile.php?tag=<?php echo $row['name']; ?>">
    </noscript>
    <p class="btn">If you are not automatically redirected, please <a href="<?php echo $path; ?>user_profile.php?tag=<?php echo $row['name']; ?>" id="manual_redirect_link">click here</a></p>
  </body>
  </html>
<?php }else{ ?>
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
      <script type="text/javascript">
        window.location.replace('index.php');
      </script>
      <noscript>
        <meta http-equiv="Refresh" content="0;URL=index.php">
      </noscript>
      <p class="btn">If you are not automatically redirected, please <a href="<?php echo $path; ?>index.php" id="manual_redirect_link">click here</a></p>
    </body>
    </html>
<?php } ?>