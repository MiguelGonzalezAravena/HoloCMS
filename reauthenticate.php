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

$noads = true;
$username = $name;
$password = isset($_POST['password']) ? FilterText($_POST['password']) : '';
//Hashes and salts the password --encryption--
$password_hash = HoloHash($password, $username);
$page = isset($_POST['page']) ? FilterText($_POST['page']) : '';
$sent = isset($_POST['sent']) ? FilterText($_POST['sent']) : '';
$error = isset($_GET['error']) ? (int) $_GET['error'] : 0;
$roomId = isset($_GET['roomId']) ? (int) $_GET['roomId'] : 0;
$forwardId = isset($_GET['forwardId']) ? (int) $_GET['forwardId'] : 0;
$wide = isset($_GET['wide']) ? FilterText($_GET['wide']) : '';

if(!empty($sent)) {
  header('Location: reauthenticate.php?error=2');
} else if(!empty($password)) {
  //Checks the hashed password --encrpytion--
  $sql = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$username}' and password = '{$password_hash}' LIMIT 1") or die(mysqli_error($connection));
  $rows = mysqli_num_rows($sql);
  if($rows < 1) {
    header('Location: reauthenticate.php?error=1');
  } else {
    $_SESSION['username'] = $username;
    //Makes the hash the password for this session --encryption--
    $_SESSION['password'] = $password_hash;
    require_once(dirname(__FILE__) . '/includes/sso.php');
    header('Location: ' . $page);
  }
}

$errorno = '';
$errorno = (!empty($error)) ? $error : 0;
if($errorno == 1) {
  $error = 1;
} else if($errorno == 2) {
  $error = 2;
} else {
  $error = 0;
}

require_once(dirname(__FILE__) . '/locale/' . $language . '/login.php');
require_once(dirname(__FILE__) . '/templates/login/subheader.php');
?>
  <body id="popup" class="process-template">
    <div id="overlay"></div>
    <div id="container">
      <div class="cbb process-template-box clearfix">
        <div id="content">
          <div id="header" class="clearfix">
            <h1><a href="<?php echo $path; ?>index.php"></a></h1>
            <ul class="stats">
              <li class="stats-online"><span class="stats-fig"><?php echo $online_count; ?></span>
                <?php echo $locale['users_online_now']; ?>
              </li>
              <?php echo ($enable_status_image == 1 ? '<li class="stats-visited"><img src="' . $web_gallery . 'v2/images/' . $online . '.gif" alt="Server Status" border="0" /></li>' : ''); ?>
            </ul>
          </div>
          <div id="process-content">
            <div id="column1" class="column">
              <div class="cbb clearfix green">
                <h2 class="title">Please enter your password</h2>
                <div class="box-content">
                  <p>You need to enter your password because you have closed the hotel window.</p>
                  <p>If you are not <strong><?php echo $name; ?></strong>, please <a href="<?php echo $path; ?>logout.php">sign out</a>.</p>
                  <p>If you have forgotten your password, please <a href="<?php echo $path; ?>forgot.php">click here</a>.</p>
                </div>
              </div>
            </div>
            <div id="column2" class="column">
              <?php if($error == 1) { ?>
              <div class="action-error flash-message">
                <div class="rounded">
                  <ul>
                    <li>The supplied password was incorrect.</li>
                  </ul>
                </div>
              </div>
              <?php } else if($error == 2) { ?>
              <div class="action-error flash-message">
                <div class="rounded">
                  <ul>
                    <li>Please enter your password</li>
                  </ul>
                </div>
              </div>
              <?php } ?>
              <div class="cbb gray clearfix">
                <h2 class="title">Sign in</h2>
                <div class="box-content clearfix" id="login-habblet">
                  <form action="<?php echo $path; ?>reauthenticate.php" method="post" class="login-habblet">
                    <?php
                      if(!empty($roomId) && $forwardId == 2) {
                        if(!empty($wide)) {
                          $forwardid = 'client.php?forwardId=' . $forwardId . '&roomId=' . $roomId . '&wide=' . $wide;
                        } else {
                          $forwardid = 'client.php?forwardId=' . $forwardId . '&roomId=' . roomId;
                        }
                      } elseif(!empty($wide)) {
                        $forwardid = 'client.php?wide=' . $wide;
                      } else {
                        $forwardid = 'client.php';
                      }
                    ?>
                    <input type="hidden" name="page" value="<?php echo $forwardid ?>" />
                    <ul>
                      <li>
                        <label for="login-username" class="login-text">Username</label>
                        <span class="username"><?php echo $name; ?></span>
                      </li>
                      <li>
                        <label for="login-password" class="login-text">Password</label>
                        <input tabindex="2" type="password" class="login-field" name="password" id="password" />
                        <input type="submit" name="sent" value="Sign in" class="submit" id="login-submit-button" />
                        <a style="float: left; margin-left: 0pt; display: none" class="new-button" id="login-submit-new-button" href="#"><b style="padding-left: 10px; padding-right: 7px; width: 55px;">Sign in</b><i></i></a>
                      </li>
                    </ul>
                  </form>
                </div>
              </div>
            </div>
            <script type="text/javascript">
              HabboView.add(LoginFormUI.init);
              HabboView.add(RememberMeUI.init);
            </script>
<?php require_once(dirname(__FILE__) . '/templates/login/footer.php'); ?>