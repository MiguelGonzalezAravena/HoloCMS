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
($logged_in) ? header('Location: index.php') : '';

require_once(dirname(__FILE__) . '/locale/' . $language . '/login.php');
$refer = false;
$refer_name = '';
$refer_figure = '';
$referral = false;

$error['captcha'] = '';
$referral = isset($_GET['referral']) ? (int) $_GET['referral'] : '';

//Referral
if(!empty($referral)) {
  //$referral = FilterText($_GET['referral']);
  $tempsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$referral}' LIMIT 1");
  if(mysqli_num_rows($tempsql) > 0) {
    $refer = true;
    $referrow = mysqli_fetch_assoc($tempsql);
    $refer_name = $referrow['name'];
    $refer_figure = $referrow['figure'];
  }
}

if(isset($_POST['bean_avatarName'])) {
  $refer = $_SERVER['HTTP_REFERER'];
  $pos = strrpos($refer, 'register.php');
  if($pos === false) {
    exit;
  }

  // Collect the variables we should've recieved
  $name = FilterText(isset($_POST['bean_avatarName']) ? $_POST['bean_avatarName'] : '');
  $password = FilterText(isset($_POST['password']) ? $_POST['password'] : '');
  $retypedpassword = FilterText(isset($_POST['retypedPassword']) ? $_POST['retypedPassword'] : '');
  $day = FilterText(isset($_POST['bean_day']) ? $_POST['bean_day'] : '');
  $month = FilterText(isset($_POST['bean_month']) ? $_POST['bean_month'] : '');
  $year = FilterText(isset($_POST['bean_year']) ? $_POST['bean_year'] : '');
  $email = FilterText(isset($_POST['bean_email']) ? $_POST['bean_email'] : '');
  $retypedemail = FilterText(isset($_POST['bean_retypedEmail']) ? $_POST['bean_retypedEmail'] : '');
  $accept_tos = isset($_POST['bean_termsOfServiceSelection']) ? $_POST['bean_termsOfServiceSelection'] : '';
  $figure = FilterText(isset($_POST['bean_figure']) ? $_POST['bean_figure'] : '');
  $gender = FilterText(isset($_POST['bean_gender']) ? $_POST['bean_gender'] : '');
  $newsletter = FilterText(isset($_POST['bean_marketing']) ? $_POST['bean_marketing'] : '');
  $referid = FilterText(isset($_POST['referral']) ? $_POST['referral'] : '');

  if(!empty($referral)) {
    $tempsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$referral}' LIMIT 1");
    if(mysqli_num_rows($tempsql) > 0) {
      $refer = true;
      $referrow = mysqli_fetch_assoc($tempsql);
      $refer_name = $referrow['name'];
      $refer_figure = $referrow['figure'];
    }
  }

  $_SESSION['bean_avatarName'] = isset($_POST['bean_avatarName']) ? $_POST['bean_avatarName'] : '';
  $_SESSION['password'] = isset($_POST['password']) ? $_POST['password'] : '';
  $_SESSION['retypedPassword'] = isset($_POST['retypedPassword']) ? $_POST['retypedPassword'] : '';
  $_SESSION['bean_day'] = isset($_POST['bean_day']) ? $_POST['bean_day'] : '';
  $_SESSION['bean_month'] = isset($_POST['bean_month']) ? $_POST['bean_month'] : '';
  $_SESSION['bean_year'] = isset($_POST['bean_year']) ? $_POST['bean_year'] : '';
  $_SESSION['bean_email'] = isset($_POST['bean_email']) ? $_POST['bean_email'] : '';
  $_SESSION['bean_retypedEmail'] = isset($_POST['bean_retypedEmail']) ? $_POST['bean_retypedEmail'] : '';
  $_SESSION['bean_termsOfServiceSelection'] = isset($_POST['bean_termsOfServiceSelection']) ? $_POST['bean_termsOfServiceSelection'] : '';
  $_SESSION['bean_figure'] = isset($_POST['bean_figure']) ? $_POST['bean_figure'] : '';
  $_SESSION['bean_gender'] = isset($_POST['bean_gender']) ? $_POST['bean_gender'] : '';
  $_SESSION['bean_marketing'] = isset($_POST['bean_marketing']) ? $_POST['bean_marketing'] : '';
  $_SESSION['referral'] = isset($_POST['referral']) ? $_POST['referral'] : '';

} elseif(isset($_SESSION['bean_avatarName'])) {

  $name = FilterText($_SESSION['bean_avatarName']);
  $password = FilterText($_SESSION['password']);
  $retypedpassword = FilterText($_SESSION['retypedPassword']);
  $day = FilterText($_SESSION['bean_day']);
  $month = FilterText($_SESSION['bean_month']);
  $year = FilterText($_SESSION['bean_year']);
  $email = FilterText($_SESSION['bean_email']);
  $retypedemail = FilterText($_SESSION['bean_retypedEmail']);
  $accept_tos = $_SESSION['bean_termsOfServiceSelection'];
  $figure = FilterText($_SESSION['bean_figure']);
  $gender = FilterText($_SESSION['bean_gender']);
  $newsletter = FilterText($_SESSION['bean_marketing']);
  $referid = FilterText($_SESSION['referral']);
  if(!empty($referral)) {
    //$referral = FilterText($_SESSION['referral']);
    $tempsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$referral}' LIMIT 1");
    if(mysqli_num_rows($tempsql) > 0) {
      $refer = true;
      $referrow = mysqli_fetch_assoc($tempsql);
      $refer_name = $referrow['name'];
      $refer_figure = $referrow['figure'];
    }
  }
}

if(isset($_POST['bean_avatarName']) || isset($_SESSION['bean_avatarName'])) {
  // Start validating the stuff the user has submitted
  $filter = preg_replace("/[^a-z\d\-=\?!@:\.]/i", '', $name);
  $email_check = preg_match("/^[a-z0-9_\.-]+@([a-z0-9]+([\-]+[a-z0-9]+)*\.)+[a-z]{2,7}$/i", $email);

  $tmp = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$name}' LIMIT 1") or die(mysqli_error($connection));
  $tmp = mysqli_num_rows($tmp);

  // If this variable stays false, we're safe and can add the user. If not, it means that
  // we've encountered errors and we can not proceed, so instead show the errors and do not
  // add the user to the database.
  $failure = false;

  // Name validation
  if($tmp > 0) {
    $error['name'] = 'This username is in use. Please choose another name.';
    $failure = true;
  } elseif($filter !== $name) {
    $error['name'] = 'Your username is invalid or contains invalid characters.';
    $failure = true;
  } elseif(strlen($name) > 24) {
    $error['name'] = 'The name you have chosen is too long.';
    $failure = true;
  } elseif(strlen($name) < 1) {
    $error['name'] = 'Please enter a username.';
    $failure = true;
  }

  // MOD- Names validation
  $pos = strrpos($refer, 'MOD-');
  if ($pos === true) {
    $error['name'] = 'This name is not allowed.';
    $failure = true;
  }

  // Password validation
  if($password !== $retypedpassword) {
    $error['password'] = 'The passwords do not match. Please try again.';
    $failure = true;
  } elseif(strlen($password) < 6) {
    $error['password'] = 'Your password is too short.';
    $failure = true;
  /*} elseif(strlen($password) > 20) {
    $error['password'] = 'Please shorten your password to 20 characters or less!';
    $failure = true;*/
  }

  // E-Mail validation
  if(strlen($email) < 6) {
    $error['mail'] = 'Please supply a valid e-mail address.';
    $failure = true;
  } elseif($email_check !== 1) {
    $error['mail'] = 'Please supply a valid e-mail address.';
    $failure = true;
  } elseif($email !== $retypedemail) {
    $error['mail'] = 'The e-mail addresses don\'t match.';
    $failure = true;
  }

  // Date of birth validation
  if($day < 1 || $day > 31 || $month > 12 || $month < 1 || $year < 1920 || $year > 2008) {
    $error['dob'] = 'Please supply a valid date of birth.';
    $failure = true;
  }
  
  // captcha check
  if(!empty($_POST['bean_captchaResponse']) && !empty($_SESSION['register-captcha-bubble']) && $_SESSION['register-captcha-bubble'] == $_POST['bean_captchaResponse']) {
    unset($_SESSION['register-captcha-bubble']);
  } else {
    $error['captcha'] = 'The code that you filled in isn\'t right, please try again.';
    $failure = true;
  }

  // Terms of Service validation
  if($accept_tos !== 'true') {
    $error['tos'] = 'Please read and accept the Terms of Service to register.';
    $failure = true;
  }

  // Try to (we really can't properly) validate figure
  if(!empty($figure)) {
    // Todo: Add some extra validation
  } else {
    $error['password'] = 'An unknown error occured. Please wait for the figure editor to load the next time or refresh if it doesn\'t.';
    $failure = true;
  }

  // Check gender
  if($gender !== 'M' && $gender !== 'F') {
    $gender = 'M';
    $failure = true;
  }
  
  // Newsletter
  if($newsletter == 'true') {
    $newsletter = '1';
  } else {
    $newsletter = '0';
  }
  
  // Finally, if everything's OK we add the user to the database, log him in, etc
  if($failure == false) {
    $scredits = config('start_credits');

    $dob = $day . '-' . $month . '-' . $year;

    $password = HoloHash($password, $name);

    mysqli_query($connection, "INSERT INTO users(name, password, email, birth, figure, sex, rank, hbirth, ipaddress_last, postcount, tickets, credits, lastvisit, newsletter, email_verified) VALUES('{$name}', '{$password}', '{$email}', '{$dob}', '{$figure}', '{$gender}', '1', '{$date_normal}', '{$remote_ip}', '0', '100', '{$scredits}', '{$date_full}', '{$newsletter}', '0')") or die(mysqli_error($connection));

    $check = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$name}' ORDER BY id ASC LIMIT 1") or die(mysqli_error($connection));
    $row = mysqli_fetch_assoc($check);
    $userid = $row['id'];

    if($scredits > 0) {
      mysqli_query($connection, "INSERT INTO cms_transactions(userid, date, amount, descr) VALUES('{$userid}', '{$date_full}','{$scredits}','Welcome to {$sitename}!')") or die(mysqli_error($connection));
    }
    
    if($email_verify == true) {
      $hash = '';
      $length = 8;
      $possible = '0123456789qwertyuiopasdfghjkzxcvbnm';
      $i = 0;
      while($i < $length) {
        $char = substr($possible, mt_rand(0, strlen($possible) - 1), 1);
        if(!strstr($hash, $char)) {
          $hash .= $char;
          $i++;
        }
      }
      $hash = sha1($hash);
      $num = $key;
      mysqli_query($connection, "INSERT INTO cms_verify(id, email, key_hash) VALUES('{$userid}', '{$email}', '{$hash}')");

      if($email_verify_reward != '0') {
        $reward_text = 'By verifying your email, you will earn a reward of ' . $email_verify_reward . ' pixels to spend in the Obbah Badge Shop and Obbah Ranks Shop.';
      } else {
        $reward_text = '';
      }

      $subject = 'Welcome to ' . $shortname;
      $from = HoloText(getContent('newsletter-3from'), true);
      $fromname = HoloText(getContent('newsletter-4fromname'), true);
      $headers  = '';
      $headers  = 'Return-Path: <' . $from . '>' . "\r\n";
      $headers  = 'From: ' . $fromname . ' <' . $from . '>' . "\r\n";
      $headers .= 'MIME-Version: 1.0' . "\r\n";
      $headers .= 'Content-Type: multipart/related; ' . "\r\n";
      $headers .= ' boundary="----=_Part_116200_21286957.1233466802029"' . "\r\n";
      $to = $email;
      $message = '------=_Part_116200_21286957.1233466802029
      Content-Type: multipart/alternative; 
        boundary="----=_Part_116201_12539834.1233466802029"

      ------=_Part_116201_12539834.1233466802029
      Content-Type: text/plain; charset=ISO-8859-1
      Content-Transfer-Encoding: 7bit

      ' . $shortname . '

      Welcome to ' . $shortname . ', ' . $name . '!

      ' . $reward_text . '
      Please activate your account by clicking here:
      ' . $path . 'email.php?key=' . $hash.'

      Here are your user details:
      ' . $shortname . ' name: ' . $name . '
      Birthdate: '.$dob.'

      Keep this information safe - you need your username and birthdate to reset your password if you forget it.

      See you in ' . $shortname . ' soon!
      ' . $shortname . ' Staff
      ' . $path . '

      If you did not register to ' . $sitename . ', please click the following link to remove your information:
      ' . $path . 'email.php?remove=' . $hash . '

      Replies to this email will not be processed. If you need assistance, please visit our support pages:
      ' . $path . 'help.php

      ------=_Part_116201_12539834.1233466802029
      Content-Type: text/html;charset=ISO-8859-1
      Content-Transfer-Encoding: 7bit

      <html><head><style type="text/css">
      a { color: #fc6204; }
      </style></head>
      <body style="background-color: #e3e3db; margin: 0; padding: 0; font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000;">

      <div style="background-color: #bce0ee; padding: 14px; border-bottom: 3px solid #000;">
        <img src="' . $path . 'web-gallery/v2/images/habbo.png" alt="' . $shortname . '" width="160" height="66" />
      </div>

      <div style="padding: 14px 14px 50px 14px; background-color: #e3e3db;">
        <div style="background-color: #fff; padding: 14px; border: 1px solid #ccc">
      <h1 style="font-size: 16px">Welcome to ' . $shortname . ', ' . $name . '!</h1>

      <p>
      ' . $reward_text . '
      Please activate your account by <a href="' . $path . 'email.php?key=' . $hash . '">clicking here</a>.
      </p>

      <p>
      Here are your user details:
      </p>

      <blockquote>
      <p>
      <b>' . $shortname . ' name:</b> ' . $name . '<br>
      <b>Birthday:</b> ' . $dob . '
      </p>
      </blockquote>

      <p>
      Keep this information safe. You will  need to know your username and birthday to reset your password if you forget it.
      </p>

      <p>See you in ' . $shortname . '!<br><br>
      ' . $shortname . ' Staff<p>
      ' . $path . '</p>

      <p>
      If you did not register at ' . $shortname . ', please click the following link to <a href="' . $path . 'email.php?remove=' . $hash . '">remove your information</a>.
      </p>

      <p>
      Please do no reply to this email.  If you need assistance, visit <a href="' . $path . 'help.php">our support pages</a>.
      </p>
        </div>
      </div>

      </body>
      </html>';
      @mail($to, $subject, $message, $headers);
    }
    
    // Referral
    if(isset($_POST['referral'])) {
      $tempsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$referral}' LIMIT 1");
      if(mysqli_num_rows($tempsql) > 0) {
        $referrow = mysqli_fetch_assoc($tempsql);
        $referid = $referrow['id'];
        mysqli_query($connection, "UPDATE users SET credits = credits + {$reward} WHERE id = '{$referid}'");
        mysqli_query($connection, "INSERT INTO cms_transactions (userid, date, amount, descr) VALUES ('{$referid}', '{$date_full}', '{$reward}', 'Referring a user.')") or die(mysqli_error($connection));
        mysqli_query($connection, "INSERT INTO messenger_friendships (userid,friendid) VALUES ('{$userid}', '{$referid}')");
        $location = 'security_check.php?welcome=true&referral=' . $referral;
      } else {
        $location = 'security_check.php?welcome=true';
      }
    } else {
      $location = 'security_check.php?welcome=true';
    }

    $_SESSION['username'] = $name;
    $_SESSION['password'] = $password;

    header('Location: ' . $location);
    exit; // cut off the script
    // And we're done!
  }


}

require_once(dirname(__FILE__) . '/templates/login/register_subheader.php');
require_once(dirname(__FILE__) . '/templates/login/register_header.php');
?>
  <div id="process-content">
    <div id="column1" class="column">
      <div class="habblet-container ">
        <?php if(!empty($refer_name) && !empty($refer_name)) { ?>
        <div id="inviter-info">
          <p>
            Your friend <?php echo $refer_name; ?> is waiting for you in <?php echo $shortname; ?>!
          </p>
          <img alt="<?php echo $refer_name; ?>" title="<?php echo $refer_name; ?>" src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $refer_figure; ?>&size=b&direction=4&head_direction=4&gesture=sml" />
        </div>
        <?php } ?>
        <form method="post" action="<?php echo $path; ?>register.php" id="registerform" autocomplete="off">
          <input type="hidden" name="bean_figure" id="register-figure" value="<?php echo $first_figure; ?>" />
          <input type="hidden" name="bean_gender" id="register-gender" value="<?php echo $first_gender; ?>" />
          <input type="hidden" name="bean_editorState" id="register-editor-state" value="" />
          <?php if($refer == true) { ?>
          <input type="hidden" name="referral" id="register-referrer" value="<?php echo $referral; ?>" />
          <?php
            }

            if($error['captcha'] != 'The code that you filled in isn\'t right, please try again.') {
          ?>
          <div id="register-column-left">
            <div id="register-section-2">
              <div class="rounded rounded-blue">
                <h2 class="heading"><span class="numbering white">2.</span>CHOOSE YOUR NAME</h2>
                <fieldset id="register-fieldset-name">
                  <div class="register-label white"><?php echo $shortname; ?> name</div>
                  <input type="text" name="bean_avatarName" id="register-name" class="register-text" value="<?php echo (isset($_POST['bean_avatarName']) ? FilterText($_POST['bean_avatarName']) : ''); ?>" size="25" />
                  <span id="register-name-check-container" style="display:none">
                    <a class="new-button search-icon" href="#" id="register-name-check"><b><span></span></b><i></i></a>
                  </span>
                </fieldset>
                <div id="name-error-box">
                  <?php if(isset($error['name'])) { ?>
                  <div class="register-error">
                    <div class="rounded rounded-red">
                      <div id="name-error-content">
                        <?php echo $error['name']; ?>
                      </div>
                    </div>
                  </div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div id="register-section-3">
              <div id="registration-overlay"></div>
              <div class="cbb clearfix gray">
                <h2 class="title heading"><span class="numbering white">3.</span>Your Details</h2>
                <div class="box-content">
                  <?php if(isset($error['password'])) { ?>
                  <div class="register-error">
                    <div class="rounded rounded-red">
                      <div id="password-error-content">
                        <div>
                          <?php echo $error['password']; ?>
                        </div>
                      </div>
                    </div>
                  </div>
                  <?php } ?>
                  <fieldset id="register-fieldset-password">
                    <div class="register-label">
                      <label for="register-password">My password will be:</label>
                    </div>
                    <div class="register-label">
                      <input type="password" name="password" id="register-password" class="register-text" size="25" value="" />
                    </div>
                    <div class="register-label">
                      <label for="register-password2">Confirm password</label>
                    </div>
                    <div class="register-label">
                      <input type="password" name="retypedPassword" id="register-password2" class="register-text" size="25" value="" />
                    </div>
                  </fieldset>
                  <div id="password-error-box"></div>
                  <?php if(isset($error['dob'])) { ?>
                  <div class="register-error">
                    <div class="rounded rounded-red">
                      <div id="birthday-error-content">
                        <div>
                          <?php echo $error['dob']; ?>
                        </div>
                      </div>
                    </div>
                  </div>
                  <?php } ?>
                  <fieldset>
                    <div class="register-label">
                      <label>I was born on:</label>
                    </div>
                    <div id="register-birthday">
                      <select name="bean_day" id="bean_day" class="dateselector">
                        <option value="">Day</option>
                        <?php for ($i = 1; $i <= 31; $i++) { ?>
                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                        <?php } ?>
                      </select>
                      <select name="bean_month" id="bean_month" class="dateselector">
                        <option value="">Month</option>
                        <?php for ($i = 1; $i <= 12; $i++) { ?>
                        <option value="<?php echo $i; ?>"><?php echo month($i); ?></option>
                        <?php } ?>
                      </select>
                      <select name="bean_year" id="bean_year" class="dateselector">
                        <option value="">Year</option>
                        <?php for ($i = date("Y"); $i >= 1900; $i--) { ?>
                          <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </fieldset>
                  <div id="email-error-box">
                    <?php if(isset($error['mail'])) { ?>
                    <div class="register-error">
                      <div class="rounded rounded-red">
                        <div id="email-error-content">
                          <div>
                            <?php echo $error['mail']; ?>
                          </div>
                        </div>
                      </div>
                    </div>
                    <?php } ?>
                  </div>
                  <fieldset>
                    <div class="register-label">
                      <label for="register-email">And my email address is:</label>
                    </div>
                    <div class="register-label">
                      <input type="text" name="bean_email" id="register-email" class="register-text" value="<?php echo (isset($_POST['bean_email']) ? FilterText($_POST['bean_email']) : ''); ?>" size="25" maxlength="48" />
                    </div>
                    <div class="register-label">
                      <label for="register-email2">Retype your email address</label>
                    </div>
                    <div class="register-label">
                      <input type="text" name="bean_retypedEmail" id="register-email2" class="register-text" value="" size="25" maxlength="48" />
                    </div>
                  </fieldset>
                  <div id="register-marketing-box">
                    <input type="checkbox" name="bean_marketing" id="bean_marketing" value="true" checked="checked" />
                    <label for="bean_marketing">Yes, please send me
                      <?php echo $shortname; ?> updates, including the newsletter!</label>
                  </div>
                  <fieldset id="register-fieldset-captcha">
                    <noscript>
                      <div class="register-label"><img src="<?php echo $path; ?>captcha/CaptchaSecurityImages.php?width=170&height=40&characters=10" /></div>
                      <div id="captcha-error-box">
                        <?php if(isset($error['captcha'])) { ?>
                        <div class="register-error">
                          <div class="rounded rounded-red">
                            <div id="email-error-content">
                              <div>
                                <?php echo $error['captcha']; ?>
                              </div>
                            </div>
                          </div>
                        </div>
                        <?php } ?>
                      </div>
                      <div class="register-label">
                        <label for="register-captcha">Type in the security code shown in the image below.</label>
                      </div>
                      <div id="captcha_response">
                        <input type="text" name="bean_captchaResponse" id="recaptcha_response_field" class="register-text" value="" size="25" />
                      </div>
                    </noscript>
                  </fieldset>
                  <div id="terms-error-box">
                    <?php if(isset($error['tos'])) { ?>
                    <div class="register-error">
                      <div class="rounded rounded-red">
                        Please accept the terms of service
                      </div>
                    </div>
                    <?php } ?>
                  </div>
                  <fieldset id="register-fieldset-terms">
                    <div class="rounded rounded-darkgray" id="register-terms">
                      <div id="register-terms-content">
                        <p><a href="<?php echo $path; ?>disclaimer.php" target="_blank" id="register-terms-link">Terms of Service</a></p>
                        <p class="last">
                          <input type="checkbox" name="bean_termsOfServiceSelection" id="register-terms-check" value="true" />
                          <label for="register-terms-check">By clicking on continue, I confirm that I have read and accept the Terms of Use and Privacy Policy.</label>
                        </p>
                      </div>
                    </div>
                  </fieldset>
                </div>
              </div>
              <div id="form-validation-error-box" style="display:none">
                <div class="register-error">
                  <div class="rounded rounded-red">
                    Sorry, registration failed. Please check the information you gave in the red boxes.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    <?php } else { ?>
    <div id="register-column-left">
      <div id="register-section-2">
        <div class="rounded rounded-blue">
          <h2 class="heading"><span class="numbering white">2.</span>CHOOSE YOUR NAME</h2>
          <fieldset id="register-fieldset-name">
            <div class="register-label white"><?php echo $shortname; ?> name</div>
            <div class="register-input"><?php echo HoloText($name); ?></div>
          </fieldset>
        </div>
      </div>
      <div id="register-section-3">
        <div class="cbb clearfix gray">
          <h2 class="title heading"><span class="numbering white">3.</span>Your Info</h2>
          <div class="box-content">
            <fieldset id="register-fieldset-password">
              <div class="register-label">
                <label for="register-password">Password</label>
              </div>
              <div class="register-input">*******</div>
            </fieldset>
            <fieldset>
              <div class="register-label">
                <label>Date of birth</label>
              </div>
              <div class="register-input"><?php echo HoloText($day); ?> / <?php echo HoloText($month); ?> /  <?php echo HoloText($year); ?></div>
            </fieldset>
            <div id="email-error-box">
            </div>
            <fieldset>
              <div class="register-label">
                <label for="register-email">Your email address:</label>
              </div>
              <div class="register-input">
                <?php echo HoloText($email); ?>
              </div>
            </fieldset>
            <div id="register-marketing-box">
              <input type="checkbox" name="bean_marketing" id="bean_marketing" value="true" checked="checked" />
              <label for="bean_marketing">Yes! I want the latest <?php echo $shortname; ?> news sent straight to my inbox.</label>
            </div>
            <fieldset id="register-fieldset-captcha">
              <div class="register-label"><img id="captcha" src="<?php echo $path; ?>captcha/CaptchaSecurityImages.php?width=170&height=40&characters=10" alt="" width="170" height="40" /></div>
              <div id="captcha-error-box">
                <div class="register-error">
                  <div class="rounded rounded-red">The security code was invalid</div>
                </div>
              </div>
              <div class="register-label">
                <label for="register-captcha">Type in the security code shown in the image below.</label>
              </div>
              <div id="captcha_response">
                <input type="text" name="bean_captchaResponse" id="recaptcha_response_field" class="register-text error" value="" size="25" />
              </div>
            </fieldset>
            <div id="terms-error-box">
            </div>
            <fieldset id="register-fieldset-terms">
              <div class="rounded rounded-darkgray" id="register-terms">
                <div id="register-terms-content">
                  <p><a href="<?php echo $path; ?>disclaimer.php" target="_blank" id="register-terms-link">Terms of Service</a></p>
                  <p class="last">
                    <input type="checkbox" name="bean_termsOfServiceSelection" id="register-terms-check" value="true" checked="checked" />
                    <label for="register-terms-check">By clicking on continue, I confirm that I have read and accept the Terms of Use and Privacy Policy.</label>
                  </p>
                </div>
              </div>
            </fieldset>
          </div>
        </div>
        <div id="form-validation-error-box" style="display:none">
          <div class="register-error">
            <div class="rounded rounded-red">
              Sorry, registration failed. Please check the information you gave in the red boxes.
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>
    <div id="register-column-right">
      <div id="register-avatar-editor-title">
        <h2 class="heading"><span class="numbering white">3.</span>Create Your <?php echo $shortname; ?></h2>
      </div>
      <div id="avatar-error-box">
      </div>
      <div id="register-avatar-editor">
        <p><b>You don't have Flash installed. This is why we can only show you a selection of pre-generated Habbos. If you install Flash, you'll be able to choose from the hundreds of different options!</b></p>
        <h3>Girls</h3>
        <div class="register-avatars clearfix">
          <div class="register-avatar" style="background-image: url(http://www.habbo.co.uk/habbo-imaging/avatar/hr-505-40.hd-625-5.ch-665-66.lg-715-77.sh-740-88.ha-1020-.he-1605-72.ea-1404-69.wa-2009-72,s-0.g-1.d-4.h-4.a-0,b1c6d189e50bdb212298d8abb4fecd6f.gif)">
            <input type="radio" name="randomFigure" value="F-hr-505-40.hd-625-5.ch-665-66.lg-715-77.sh-740-88.ha-1020-.he-1605-72.ea-1404-69.wa-2009-72" checked="checked" />
          </div>
          <div class="register-avatar" style="background-image: url(http://www.habbo.co.uk/habbo-imaging/avatar/hd-600-3.ch-685-72.lg-715-62.sh-730-72.hr-545-45,s-0.g-1.d-4.h-4.a-0,a84223ce0944cfa29266ac6479f3dc28.gif)">
            <input type="radio" name="randomFigure" value="F-hd-600-3.ch-685-72.lg-715-62.sh-730-72.hr-545-45" />
          </div>
          <div class="register-avatar" style="background-image: url(http://www.habbo.co.uk/habbo-imaging/avatar/hd-600-1.ch-685-72.lg-715-72.sh-907-68.hr-890-39.ca-1818-.he-1610-,s-0.g-1.d-4.h-4.a-0,14edf197f523577dfa41db90af0ad9ca.gif)">
            <input type="radio" name="randomFigure" value="F-hd-600-1.ch-685-72.lg-715-72.sh-907-68.hr-890-39.ca-1818-.he-1610-" />
          </div>
        </div>
        <h3>Boys</h3>
        <div class="register-avatars clearfix">
          <div class="register-avatar" style="background-image: url(http://www.habbo.co.uk/habbo-imaging/avatar/hd-180-2.ch-235-62.lg-281-62.sh-290-62.hr-165-34.ca-1802-,s-0.g-1.d-4.h-4.a-0,9f489bd657bd52e81e274526b9b91c93.gif)">
            <input type="radio" name="randomFigure" value="M-hd-180-2.ch-235-62.lg-281-62.sh-290-62.hr-165-34.ca-1802-" />
          </div>
          <div class="register-avatar" style="background-image: url(http://www.habbo.co.uk/habbo-imaging/avatar/hr-893-48.hd-205-3.ch-878-70.lg-280-78.sh-906-64.ea-1403-78,s-0.g-1.d-4.h-4.a-0,eb135383bd46a25b7464d07f27604df8.gif)">
            <input type="radio" name="randomFigure" value="M-hr-893-48.hd-205-3.ch-878-70.lg-280-78.sh-906-64.ea-1403-78" />
          </div>
          <div class="register-avatar" style="background-image: url(http://www.habbo.co.uk/habbo-imaging/avatar/hr-889-36.hd-207-5.ch-210-62.lg-280-62.sh-300-62.wa-2009-62.ea-1404-66.ha-1010-62.fa-1201-.ca-1805-62.he-1608-,s-0.g-1.d-4.h-4.a-0,5d541e21a3bc762448e1e21955f59f17.gif)">
            <input type="radio" name="randomFigure" value="M-hr-889-36.hd-207-5.ch-210-62.lg-280-62.sh-300-62.wa-2009-62.ea-1404-66.ha-1010-62.fa-1201-.ca-1805-62.he-1608-" />
          </div>
        </div>
        <p>If you dislike the <?php echo $shortname; ?> above, you may change it later via the account settings page</p>
      </div>
      <div id="register-buttons">
        <input type="submit" value="Continue" class="continue" id="register-button-continue" />
        <a href="<?php echo $path; ?>index.php?registerCancel=true" class="cancel">Exit registration</a>
      </div>
    </div>
  </form>
</div>
<script type="text/javascript">
  if(!$(document.body).hasClassName('process-template')) {
    Rounder.init();
  }
</script>
</div>
<?php require_once(dirname(__FILE__) . '/templates/login/footer.php'); ?>