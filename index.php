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

$do = isset($_GET['do']) ? FilterText($_GET['do']) : '';
$username = isset($_POST['username']) ? FilterText($_POST['username']) : '';
$registerCancel = isset($_GET['registerCancel']) ? FilterText($_GET['registerCancel']) : '';
$password = isset($_POST['password']) ? HoloHash($_POST['password'], $username) : '';
$remember_me = isset($_POST['_login_remember_me']) ? FilterText($_POST['_login_remember_me']) : '';
$error = isset($_GET['error']) ? (int) $_GET['error'] : 0;
$ageLimit = isset($_GET['ageLimit']) ? FilterText($_GET['ageLimit']) : '';
$submit = isset($_POST['sent']) ? FilterText($_POST['sent']) : '';

if($registerCancel == 'true') {
  session_unset();
}

if($do == 'version') {
?>
  <h1>HoloCMS Version</h1>
  <hr />
  <?php echo $sitename . ' is running HoloCMS v' . $holocms['version']; ?>
  <hr />
    <p>
      <strong>HoloCMS Version:</strong>
      <?php echo $holocms['version'] . ' ' . $holocms['stable'] . ' [' . $holocms['title'] . ']'; ?><br />
      <strong>HoloCMS Build Date:</strong>
      <?php echo $holocms['date']; ?><br />
      <strong>Holograph Emulator Compatability:</strong> Build for <a href="http://trac2.assembla.com/holograph/changeset/<?php echo $holograph['revision']; ?>" target="_blank">Revision <?php echo $holograph['revision']; ?></a> (<?php echo $holograph['type']; ?>)
    </p>
    <hr />
    <i><?php echo $remote_ip; ?> @ <?php echo $path; ?></i>
<?php
  exit;
}

if(!$logged_in) {
  if(!empty($username) && !empty($password)) {
    $sql = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$username}' AND password = '{$password}' LIMIT 1") or die(mysqli_error($connection));
    $rows = mysqli_num_rows($sql);
    if($rows < 1) {
      $login_error = 'Invalid username or password.';
    } else {
      $userdata = mysqli_fetch_assoc($sql);
      $userid = $userdata['id'];
      $check = mysqli_query($connection, "SELECT * FROM users_bans WHERE userid = '{$userid}' OR ipaddress = '{$remote_ip}' LIMIT 1") or die(mysqli_error($connection));
      $is_banned = mysqli_num_rows($check);
      if($is_banned < 1) {
        if($email_force_verify == true) {
          $temp1 = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$userid}' AND email_verified = '1'");
          if(mysqli_num_rows($temp1) < 1) {
            $login_error = 'Your email is not verified! Please verify your email with the link sent to you at the time of registration.';
          } else {
            $_SESSION['username'] = $username;
            $_SESSION['password'] = $password;
            if($remember_me == 'true') {
              setcookie('remember', 'remember', time() + 60*60*24*100, '/');
              setcookie('rusername', $_SESSION['username'], time() + 60*60*24*100, '/');
              setcookie('rpassword', $_SESSION['password'], time() + 60*60*24*100, '/');
            }
            $sql3 = mysqli_query($connection, "UPDATE users SET lastvisit = '{$date_full}' WHERE name = '{$username}'") or die(mysqli_error($connection));
            header('Location: security_check.php');
          }
        } else {
          $_SESSION['username'] = $username;
          $_SESSION['password'] = $password;
          if($remember_me == 'true') {
            setcookie('remember', 'remember', time() + 60*60*24*100, '/');
            setcookie('rusername', $_SESSION['username'], time() + 60*60*24*100, '/');
            setcookie('rpassword', $_SESSION['password'], time() + 60*60*24*100, '/');
          }
          $sql3 = mysqli_query($connection, "UPDATE users SET lastvisit = '{$date_full}' WHERE name = '{$username}'") or die(mysqli_error($connection));
          header('Location: security_check.php');
        }
      } else {
        $bandata = mysqli_fetch_assoc($check);
        $reason = $bandata['descr'];
        $expire = $bandata['date_expire'];
        $xbits = explode(' ', $expire);
        $xtime = explode(':', $xbits[1]);
        $xdate = explode('-', $xbits[0]);
        $stamp_now = mktime($H, $i, $s, $today, $month, $year);
        $stamp_expire = mktime($xtime[0], $xtime[1], $xtime[2], $xdate[0], $xdate[1], $xdate[2]);

        if($stamp_now < $stamp_expire) {
          $login_error = 'You have been banned! The reason for this ban is "' . $reason . '" The ban will expire at ' . $expire . '.';
        } else { // ban expired
          mysqli_query($connection, "DELETE FROM users_bans WHERE userid = '{$userid}' OR ipaddress = '{$remote_ip}' LIMIT 1") or die(mysqli_error($connection));
          $_SESSION['username'] = $username;
          $_SESSION['password'] = $password;
          if($remember_me == 'true') {
            setcookie('remember', 'remember', time() + 60*60*24*100, '/');
            setcookie('rusername', $_SESSION['username'], time() + 60*60*24*100, '/');
            setcookie('rpassword', HoloHash($_SESSION['password'], $_SESSION['username']), time() + 60*60*24*100, '/');
          }
          $sql3 = mysqli_query($connection, "UPDATE users SET lastvisit = '{$date_full}' WHERE name = '{$username}'") or die(mysqli_error($connection));
          header('Location: security_check.php');
        }
      }
    }
  } else if(!empty($submit)) {
    $login_error = 'Please do not leave any fields blank.';
  }

  if(!empty($error)) {
    $errorno = $error;
    if($errorno == 1) {
      $login_error = 'Invalid username or password.';
    } elseif($errorno == 2) {
      $login_error = 'Invalid username or password.';
    } elseif($ageLimit == 'true') {
      $login_error = 'You are too young to register.';
    }
  }

  require_once(dirname(__FILE__) . '/locale/' . $language . '/login.php');
  require_once(dirname(__FILE__) . '/templates/login/subheader.php');
  require_once(dirname(__FILE__) . '/templates/login/header.php');
  require_once(dirname(__FILE__) . '/templates/login/column1.php');
?>
  <div id="column2" class="column">
    <div class="habblet-container ">
      <?php if(isset($login_error)) { ?>
      <div class="action-error flash-message">
        <div class="rounded">
          <ul>
            <li><?php echo $login_error; ?></li>
          </ul>
        </div>
      </div>
      <?php } ?>
      <div class="cbb loginbox clearfix">
        <h2 class="title">Sign in</h2>
        <div class="box-content clearfix" id="login-habblet">
          <form name="form" action="<?php echo $path; ?>index.php?do=process_login" method="post" class="login-habblet">
            <input type="hidden" name="sent" value="true" />
            <ul>
              <li>
                <label for="login-username" class="login-text">Username</label>
                <input tabindex="1" type="text" class="login-field" name="username" id="login-username" value="<?php echo $username; ?>" />
              </li>
              <li>
                <label for="login-password" class="login-text">Password</label>
                <input tabindex="2" type="password" class="login-field" name="password" id="login-password" />
                <input type="submit" value="Sign in" class="submit" id="login-submit-button" />
                <a href="#" id="login-submit-new-button" class="new-button" style="float: left; margin-left: 0;display:none"><b style="padding-left: 10px; padding-right: 7px; width: 55px">Sign in</b><i></i></a>
              </li>
              <li class="no-label">
                <input tabindex="3" type="checkbox" name="_login_remember_me" id="login-remember-me" value="true" />
                <label for="login-remember-me">Remember me</label>
              </li>
              <li class="no-label">
                <a href="<?php echo $path; ?>register.php" class="login-register-link"><span>Register for free</span></a>
              </li>
              <li class="no-label">
                <a href="<?php echo $path; ?>forgot.php" id="forgot-password"><span>I forgot my password/username</span></a>
              </li>
            </ul>
          </form>
        </div>
      </div>
      <div id="remember-me-notification" class="bottom-bubble" style="display:none;">
        <div class="bottom-bubble-t">
          <div></div>
        </div>
        <div class="bottom-bubble-c">
          By selecting 'remember me' you will stay signed in on this computer until you click 'Sign Out'. If this is a public computer please do not use this feature.
        </div>
        <div class="bottom-bubble-b">
          <div></div>
        </div>
      </div>
      <script type="text/javascript">
        HabboView.add(LoginFormUI.init);
        HabboView.add(RememberMeUI.init);
      </script>
    </div>
    <script type="text/javascript">
      if(!$(document.body).hasClassName('process-template')) {
        Rounder.init();
      }
    </script>
    <div class="habblet-container ">
      <div class="ad-container">
        <div id="geoip-ad" style="display:none"></div>
      </div>
    </div>
    <script type="text/javascript">
      if(!$(document.body).hasClassName('process-template')) {
        Rounder.init();
      }
    </script>
    <div class="habblet-container ">
    </div>
    <script type="text/javascript">
      if(!$(document.body).hasClassName('process-template')) {
        Rounder.init();
      }
    </script>
    <div class="habblet-container ">
      <div class="ad-container">
        <a href="register.php"><img src="./web-gallery/v2/images/landing/uk_party_frontpage_image.gif" alt="" /></a>
      </div>
    </div>
    <script type="text/javascript">
      if(!$(document.body).hasClassName('process-template')) {
        Rounder.init();
      }
    </script>
  </div>
  <div id="column3" class="column">
  </div>
  <div id="column-footer">
    <div class="habblet-container ">
      <div class="habblet box-content" id="tag-cloud-slim">
        <span class="tags-habbos-like"><?php echo $shortname; ?>s like</span>
        <?php require_once(dirname(__FILE__) . '/tagcloud.php'); ?>
      </div>
    </div>
    <script type="text/javascript">
      if(!$(document.body).hasClassName('process-template')) {
        Rounder.init();
      }
    </script>
  <!--[if lt IE 7]>
  <script type="text/javascript">
  Pngfix.doPngImageFix();
  </script>
  <![endif]-->
<?php
  require_once(dirname(__FILE__) . '/templates/login/footer.php');
  } else {
    header('Location: me.php');
  }
?>