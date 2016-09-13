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
require_once(dirname(__FILE__) . '/../core.php');
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(isset($_SESSION['acp']) ? header('Location: index.php?loginThrowBack=true') : '');
$notify_logout = isset($_GET['notify_logout']) ? FilterText($_GET['notify_logout']) : false;

$pagename = 'Login';
$form_name = isset($_POST['username']) ? FilterText($_POST['username']) : '';
$form_pass = isset($_POST['username']) && isset($_POST['password']) ? HoloHash($_POST['password'], $_POST['username']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';

if(!empty($form_name) && !empty($form_pass)) {
  $check = mysqli_query($connection, "SELECT id, name FROM users WHERE name = '{$form_name}' AND password = '{$form_pass}' AND rank > 5 LIMIT 1") or die(mysqli_error($connection));
  $valid = mysqli_num_rows($check);

  if($valid > 0) {
    $row = mysqli_fetch_assoc($check);

    $_SESSION['acp'] = true;
    $_SESSION['hkusername'] = $row['name'];
    $_SESSION['hkpassword'] = $form_pass;

    $my_id = $row['id'];

    // Log them in on the site as well if needed
    if(!$_SESSION['username']) {
      $_SESSION['username'] = $row['name'];
      $_SESSION['password'] = $form_pass;
    }

    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES ('Housekeeping', '{$_SESSION['hkusername']} authenticated from {$remote_ip}', 'login.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
    header('Location: index.php?p=dashboard');
  } else {
    $msg = 'Invalid username, password, or access level.';
  }
} else if(!empty($submit) && (empty($form_name) || empty($form_pass))) {
  $msg = 'Please fill in all fields.';
} else if($notify_logout == true) {
  $msg = 'You have been logged out successfully.';
} else {
  $msg = 'No housekeeping session found.';
}

require_once(dirname(__FILE__) . '/subheader.php');
?>
  <body style="background-image:url(./images/blank.gif)">
    <div id="loading-layer" style="display:none">
      <div id="loading-layer-shadow">
        <div id="loading-layer-inner">
          <img src="./images/loading_anim.gif" style="vertical-align:middle" border="0" alt="Loading..." />
          <br />
          <span style="font-weight:bold" id="loading-layer-text">Loading Data. Please Wait...</span>
        </div>
      </div>
    </div>
    <div id="ipdwrapper">
      <!-- IPDWRAPPER -->
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <div align="center">
        <div style="width:500px">
          <div class="outerdiv" id="global-outerdiv">
            <!-- OUTERDIV -->
            <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
              <tr>
                <td id="rightblock">
                  <div>
                    <form id="loginform" action="index.php?p=login&do=submit" method="post">
                      <input type="hidden" name="qstring" value="" />
                      <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                          <td width="200" class="tablerow1" valign="top" style="border:0px;width:200px">
                            <div style="text-align:center;padding-top:20px">
                              <img src="./images/acp-login-lock.gif" alt="Housekeeping" border="0" />
                            </div>
                            <br />
                            <div class="desctext" style="font-size:10px">
                              <div align="center"><strong>Welcome to Housekeeping</strong></div>
                              <br />
                              <div style="font-size:9px;color:gray">Please login with your valid moderator/administrator credentials. This service is monitored 24/7.
                                <br />
                                <br />If you have forgot your password, please use the <a href="../forgot.php">recovery tool</a> or contact your system administrator.</div>
                            </div>
                          </td>
                          <td width="300" style="width:300px" valign="top">
                            <table width="100%" cellpadding="5" cellspacing="0" border="0">
                              <tr>
                                <td colspan="2" align="center">
                                  <br />
                                  <img src="./images/holocms-logo.png" alt="HoloCMS">
                                  <div style="font-weight:bold;color:red">
                                    <?php echo $msg; ?>
                                  </div>
                                  <br />
                                </td>
                              </tr>
                              <tr>
                                <td align="right"><strong>User Name</strong></td>
                                <td>
                                  <input style="border:1px solid #AAA" type="text" size="20" name="username" id="namefield" value="<?php echo (empty($form_name) ? $name : $form_name); ?>" />
                                </td>
                              </tr>
                              <tr>
                                <td align="right"><strong>Password</strong></td>
                                <td>
                                  <input style="border:1px solid #AAA" type="password" size="20" name="password" value="" />
                                </td>
                              </tr>
                              <tr>
                                <td colspan="2" align="center">
                                  <input type="submit" name="submit" style="border:1px solid #AAA" value="Log In" />
                                </td>
                              </tr>
                              <tr>
                                <td colspan="2">
                                  <br />
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </form>
                  </div>
                </td>
              </tr>
            </table>
          </div>
          <!-- / OUTERDIV -->
        </div>
      </div>
      <script type="text/javascript">
      <!--
      if (top.location != self.location) {
        top.location = self.location
      }

      try {
        window.onload = function() {
          document.getElementById('namefield').focus();
        }
      } catch (error) {
        alert(error);
      }

      //-->
      </script>