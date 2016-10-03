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
$allow_guests = false;

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/includes/mus.php') : '');

$pagename = 'Account Settings';
$body_id = 'profile';
$pageid = '2';
$tab = isset($_GET['tab']) ? FilterText($_GET['tab']) : 1;
$figureData = isset($_POST['figureData']) ? FilterText($_POST['figureData']) : '';
$newGender = isset($_POST['newGender']) ? FilterText($_POST['newGender']) : '';
$save = isset($_POST['save']) ? FilterText($_POST['save']) : '';
$motto = isset($_POST['motto']) ? FilterText($_POST['motto']) : '';
$directemail = isset($_POST['directemail']) ? FilterText($_POST['directemail']) : '';
$pass1 = isset($_POST['password']) ? $_POST['password'] : '';
$pass1_hash = HoloHash($pass1, $myrow['name']);
$day1 = isset($_POST['day']) ? (int) $_POST['day'] : '';
$month1 = isset($_POST['month']) ? (int) $_POST['month'] : '';
$year1 = isset($_POST['year']) ? (int) $_POST['year'] : '';
$formatted_dob = $day1 . '-' . $month1 . '-' . $year1;
$mail1 = isset($_POST['email']) ? FilterText($_POST['email']) : '';
$newpass = isset($_POST['pass']) ? FilterText($_POST['pass']) : '';
$newpass_hash = HoloHash($newpass, $rawname);
$newpass_conf = isset($_POST['confpass']) ? FilterText($_POST['confpass']) : '';
$birthday = explode('-', $myrow['birth']);

$themail = $mail1;
$newsletter = ($directemail == 'on') ? 1 : 0;
$receive_news = $myrow['newsletter'];
$slot1_url = '';
$slot2_url = '';
$slot3_url = '';
$slot4_url = '';
$slot5_url = '';
$error = '';

if(!empty($tab)) {
  if($tab < 1 || $tab > 8 ) {
    header('Location: account.php?tab=1');
  }
}

switch($tab) {
  case 1:
    if(!empty($figureData)) {
      $refer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
      $pos = strrpos($refer, 'account.php');
      if($pos == false) {
        echo '<h1>Security check failure.</h1>';
        exit;
      }
      if($newGender != 'M' && $newGender != 'F') {
        $result = 'An error occured. Please try again.';
        $error = 1;
      } else {
        if(empty($figureData)) {
          $result = 'An error occured trying to process your request.';
          $error = 1;
        } else {
          mysqli_query($connection, "UPDATE users SET figure = '{$figureData}', sex = '{$newGender}' WHERE name = '{$rawname}' LIMIT 1") or die(mysqli_error($connection));
          $result = 'Account settings updated successfully.';
          $mylook1 = $figureData;
          $mysex1 = $newGender;
          @SendMUSData('UPRA' . $my_id);
        }
      }
    } else {
      $mylook1 = $myrow['figure'];
      $mysex1 = $myrow['sex'];
    }
    // Wardrobe handler
    $slot1 = mysqli_query($connection, "SELECT figure, gender FROM cms_wardrobe WHERE slotid = '1' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    $slot1 = mysqli_fetch_assoc($slot1);
    if(!empty($slot1['figure'])) {
      $slot1_url = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $slot1['figure'] . '&size=s&direction=4&head_direction=4&gesture=sml';
    }
    $slot2 = mysqli_query($connection, "SELECT figure, gender FROM cms_wardrobe WHERE slotid = '2' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    $slot2 = mysqli_fetch_assoc($slot2);
    if(!empty($slot2['figure'])) {
      $slot2_url = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $slot2['figure'] . '&size=s&direction=4&head_direction=4&gesture=sml';
    }
    $slot3 = mysqli_query($connection, "SELECT figure, gender FROM cms_wardrobe WHERE slotid = '3' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    $slot3 = mysqli_fetch_assoc($slot3);
    if(!empty($slot3['figure'])) {
      $slot3_url = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $slot3['figure'] . '&size=s&direction=4&head_direction=4&gesture=sml';
    }
    $slot4 = mysqli_query($connection, "SELECT figure, gender FROM cms_wardrobe WHERE slotid = '4' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    $slot4 = mysqli_fetch_assoc($slot4);
    if(!empty($slot4['figure'])) {
      $slot4_url = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $slot4['figure'] . '&size=s&direction=4&head_direction=4&gesture=sml';
    }
    $slot5 = mysqli_query($connection, "SELECT figure, gender FROM cms_wardrobe WHERE slotid = '5' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    $slot5 = mysqli_fetch_assoc($slot5);
    if(!empty($slot5['figure'])) {
      $slot5_url = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $slot5['figure'] . '&size=s&direction=4&head_direction=4&gesture=sml';
    }
    break;
  case 2: 
    if(!empty($save)) {
      if(strlen(HoloText($motto)) > 32) {
        $result = 'Sorry, but the motto you have chosen is too long!';
        $error = 1;
      } else {
        mysqli_query($connection, "UPDATE users SET mission = '{$motto}' WHERE name = '{$rawname}' and password = '{$rawpass}' LIMIT 1");
        $result = 'Changes saved successfully.';
        @SendMUSData('UPRA' . $my_id);
        $motto = HoloText($motto);
      }
    } else {
      $motto = HoloText($myrow['mission']);
    }
    break;
  case 3:
    if(!empty($save)) {
      //checks password --encryption--
      if($pass1_hash == $myrow['password'] && $formatted_dob == $myrow['birth']) {
        $email_check = preg_match("/^[a-z0-9_\.-]+@([a-z0-9]+([\-]+[a-z0-9]+)*\.)+[a-z]{2,7}$/i", $mail1);
        echo $newsletter . '<br />';
        echo $myrow['newsletter'] . '<br />';
        if($newsletter != $myrow['newsletter']) {
          mysqli_query($connection, "UPDATE users SET newsletter = '{$newsletter}' WHERE name = '{$rawname} AND password = '{$rawpass}'");
          $receive_news = $newsletter;
        }
        if($email_check == 1 && $mail1 != $myrow['email']) {
          mysqli_query($connection, "UPDATE users SET email = '{$mail1}', email_verified = '-1' WHERE name = '{$rawname}' and password = '{$rawpass}'") or die(mysqli_error($connection));
          if($email_verify) {
            $hash = '';
            $length = 8;
            $possible = '0123456789qwertyuiopasdfghjkzxcvbnm';
            $i = 0;
            while ($i < $length) {
              $char = substr($possible, mt_rand(0, strlen($possible) - 1), 1);
              if (!strstr($hash, $char)) {
                $hash .= $char;
                $i++;
              }
            }
            $hash = sha1($hash);
            $sql = mysqli_query($connection, "SELECT * FROM cms_verify WHERE id = '{$my_id}' LIMIT 1");
            $num = mysqli_num_rows($sql);
            if($num > 0) {
              $sql1 = "UPDATE cms_verify SET key_hash = '{$hash}', email = '{$mail1}' WHERE id = '{$my_id}' LIMIT 1";
            } else {
              $sql1 = "INSERT INTO cms_verify(id, email, key_hash) VALUES ('{$my_id}', '{$mail1}, '{$hash}')";
            }
            mysqli_query($connection, $sql1);

            $subject = 'Welcome to ' . $shortname;
            $from = HoloText(getContent('newsletter-3from'), true);
            $fromname = HoloText(getContent('newsletter-4fromname'), true);
            $headers  = '';
            $headers  = 'Return-Path: <' . $from . '>' . "\r\n";
            $headers  = 'From: '.$fromname.' <' . $from . '>' . "\r\n";
            $headers .= 'MIME-Version: 1.0' . "\r\n";
            $headers .= 'Content-Type: multipart/related; ' . "\r\n";
            $headers .= ' boundary="----=_Part_116200_21286957.1233466802029"' . "\r\n";
            $to = $mail1;
            $name = $myrow['name'];
            $dob = $myrow['birth'];
            $message = '------=_Part_116200_21286957.1233466802029
            Content-Type: multipart/alternative; 
              boundary="----=_Part_116201_12539834.1233466802029"

            ------=_Part_116201_12539834.1233466802029
            Content-Type: text/plain; charset=ISO-8859-1
            Content-Transfer-Encoding: 7bit

            ' . $shortname . '

            Welcome to ' . $shortname . ', ' . $name . '!

            Please activate your account by clicking here:
            ' . $path . 'email.php?key=' . $hash . '

            Here are your user details:
            ' . $shortname . ' name: ' . $name . '
            Birthdate: ' . $dob . '

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
          $result = 'Your e-mail address has been changed to ' . $mail1;
        } else if($email_check != 1) {
          $result = 'Invalid e-mail address';
          $error = 1;
        }
      } else {
        $result = 'The given information doesn\'t match what we have on record';
        $error = 1;
      }
    } else {
      $themail = $myrow['email'];
      $birthday = explode('-', $myrow['birth']);
      $newsletter = ($myrow['rea'] == 1) ? 'checked="checked"' : '';
    }
    break;
  case 4:
    if(!empty($save)) {
      if($pass1_hash == $myrow['password'] && $formatted_dob == $myrow['birth']) {
        if($newpass == $newpass_conf) {
          if(strlen($newpass) < 6) {
            $result = 'Password is too short, 6 characters minimum';
            $error = 1;
          } else {
            if(strlen($newpass) > 25) {
              $result = 'Password is too long, 25 characters maximum';
              $error = 1;
            } else {
              //Updates password --encryption--
              mysqli_query($connection, "UPDATE users SET password = '{$newpass_hash}' WHERE name = '{$rawname}' and password = '{$rawpass}'") or die(mysqli_error($connection));
              $result = 'Your password has been changed successfully. You will need to login again.';
            }
          }
        } else {
          $result = 'The passwords don\'t match';
          $error = 1;
        }
      } else {
        $result = 'The given information doesn\'t match what we have on record';
        $error = 1;
      }
    }
    break;
  case 7:
    if(!empty($save)) {
      if($pass1_hash == $myrow['password'] && $formatted_dob == $myrow['birth']) {
        if($newpass == $newpass_conf) {
          if(strlen($newpass) < 6) {
            $result = 'Password is too short, 6 characters minimum';
            $error = 1;
          } else {
            if(strlen($newpass) > 25) {
              $result = 'Password is too long, 25 characters maximum';
              $error = 1;
            } else {
              //Updates password --encryption--
              mysqli_query($connection, "UPDATE users SET password = '{$newpass_hash}' WHERE name = '{$rawname}' and password = '{$rawpass}'") or die(mysqli_error($connection));
              $result = 'Your password has been changed successfully. You will need to login again.';
            }
          }
        } else {
          $result = 'The passwords don\'t match';
          $error = 1;
        }
      } else {
        $result = 'The given information doesn\'t match what we have on record';
        $error = 1;
      }
    }
    break;
}

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');

// Save it in a variable to avoid having to check wether this user is HC member or not each time
$hc_member = IsHCMember($my_id);
?>
  <div id="container">
    <div id="content">
      <div>
        <div class="content">
          <div class="habblet-container" style="float:left; width:210px;">
            <div class="cbb settings">
              <h2 class="title">Account Settings</h2>
              <div class="box-content">
                <div id="settingsNavigation">
                  <ul>
                    <li class="<?php echo ($tab == 1 ? 'selected' : ''); ?>">
                      <?php echo ($tab == 1 ? 'Looks' : '<a href="' . $path . 'account.php?tab=1">Looks</a>'); ?>
                    </li>
                    <li class="<?php echo ($tab == 2 ? 'selected' : ''); ?>">
                      <?php echo ($tab == 2 ? 'Motto &amp; Preferences' : '<a href="' . $path . 'account.php?tab=2">Motto &amp; Preferences</a>'); ?>
                    </li>
                    <li class="<?php echo ($tab == 3 ? 'selected' : ''); ?>">
                      <?php echo ($tab == 3 ? 'Email' : '<a href="' . $path . 'account.php?tab=3">Email</a>'); ?>
                    </li>
                    <li class="<?php echo ($tab == 4 ? 'selected' : ''); ?>">
                      <?php echo ($tab == 4 ? 'Password' : '<a href="' . $path . 'account.php?tab=4">Password</a>'); ?>
                    </li>
                    <li class="<?php echo ($tab == 5 ? 'selected' : ''); ?>">
                      <?php echo ($tab == 5 ? 'Friend Management' : '<a href="' . $path . 'account.php?tab=5">Friend Management</a>'); ?>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <?php if(!IsHCMember($my_id)) { ?>
            <div class="cbb habboclub-tryout">
              <h2 class="title">Join <?php echo $shortname; ?> Club</h2>
              <div class="box-content">
                <div class="habboclub-banner-container habboclub-clothes-banner"></div>
                <p class="habboclub-header">
                  <?php echo $shortname; ?> Club is our VIP members-only club: absolutely no riff-raff admitted! Members enjoy a wide range of benifits, including exclusive clothes, free gifts and an extended Friend List.</p>
                <p class="habboclub-link"><a href="<?php echo $path; ?>club.php">Check out <?php echo $shortname; ?> Club &gt;&gt;</a></p>
              </div>
            </div>
            <?php } ?>
          </div>
          <?php if($tab == 1) { ?>
          <div class="habblet-container" style="float:left; width: 560px;">
            <div class="cbb clearfix settings">
              <h2 class="title">Change your looks</h2>
              <div class="box-content">
                <?php
                  if(!empty($result)) {
                    echo '<div class="rounded rounded-' . ($error == 1 ? 'red' : 'green') . '">' . $result . '<br /></div><br />';
                  }
                ?>
              <br />
              <div>&nbsp;</div>
              <div id="settings-editor">
                You need to have a Flash player installed on your computer before being able to edit your <?php echo $shortname; ?> character. You can download the player from here: <a target="_blank" href="http://www.adobe.com/go/getflashplayer">http://www.adobe.com/go/getflashplayer</a>
              </div>
              <?php if($hc_member) { ?>
              <div id="settings-wardrobe" style="display: none">
                <ol id="wardrobe-slots">
                  <li>
                    <p id="wardrobe-slot-1" style="background-image: url(<?php echo $slot1_url; ?>)">
                      <span id="wardrobe-store-1" class="wardrobe-store"></span>
                      <span id="wardrobe-dress-1" class="wardrobe-dress"></span>
                    </p>
                  </li>
                  <li>
                    <p id="wardrobe-slot-2" style="background-image: url(<?php echo $slot2_url; ?>)">
                      <span id="wardrobe-store-2" class="wardrobe-store"></span>
                      <span id="wardrobe-dress-2" class="wardrobe-dress"></span>
                    </p>
                  </li>
                  <li>
                    <p id="wardrobe-slot-3" style="background-image: url(<?php echo $slot3_url; ?>)">
                      <span id="wardrobe-store-3" class="wardrobe-store"></span>
                      <span id="wardrobe-dress-3" class="wardrobe-dress"></span>
                    </p>
                  </li>
                  <li>
                    <p id="wardrobe-slot-4" style="background-image: url(<?php echo $slot4_url; ?>)">
                      <span id="wardrobe-store-4" class="wardrobe-store"></span>
                      <span id="wardrobe-dress-4" class="wardrobe-dress"></span>
                    </p>
                  </li>
                  <li>
                    <p id="wardrobe-slot-5" style="background-image: url(<?php echo $slot5_url; ?>)">
                      <span id="wardrobe-store-5" class="wardrobe-store"></span>
                      <span id="wardrobe-dress-5" class="wardrobe-dress"></span>
                    </p>
                  </li>
                </ol>
                <script type="text/javascript">
                <?php if(!empty($slot1['figure'])) { ?>
                Wardrobe.add(1, '<?php echo $slot1['figure']; ?>', '<?php echo $slot1['gender']; ?>', true);
                $('wardrobe-dress-' + 1).show();
                <?php } ?>
                <?php if(!empty($slot2['figure'])) { ?>
                Wardrobe.add(2, '<?php echo $slot2['figure']; ?>', '<?php echo $slot2['gender']; ?>', true);
                $('wardrobe-dress-' + 2).show();
                <?php } ?>
                <?php if(!empty($slot3['figure'])) { ?>
                Wardrobe.add(3, '<?php echo $slot3['figure']; ?>', '<?php echo $slot3['gender']; ?>', true);
                $('wardrobe-dress-' + 3).show();
                <?php } ?>
                <?php if(!empty($slot4['figure'])) { ?>
                Wardrobe.add(4, '<?php echo $slot4['figure']; ?>', '<?php echo $slot4['gender']; ?>', true);
                $('wardrobe-dress-' + 4).show();
                <?php } ?>
                <?php if(!empty($slot5['figure'])) { ?>
                Wardrobe.add(5, '<?php echo $slot5['figure']; ?>', '<?php echo $slot5['gender']; ?>', true);
                $("wardrobe-dress-" + 5).show();
                <?php } ?>
                L10N.put('profile.figure.wardrobe_replace.title', 'Replace?');
                L10N.put('profile.figure.wardrobe_replace.dialog', '<p>Are you sure you want to replace the stored outfit with the new one?</p><p><a href="#" class="new-button" id="wardrobe-replace-cancel"><b>Cancel</b><i></i></a><a href="#" class="new-button" id="wardrobe-replace-ok"><b>OK</b><i></i></a></p><div class="clear"></div>');
                L10N.put('profile.figure.wardrobe_invalid_data', 'Error! This outfit cannot be saved.');
                L10N.put('profile.figure.wardrobe_instructions', 'Press red arrows to save up to 5 outfits to your wardrobe. Press green arrow to select an outfit and save changes to take it into use.');
                Wardrobe.init();
                </script>
              </div>
              <?php } ?>
              <div id="settings-hc" style="display: none">
                <div class="rounded rounded-hcred clearfix">
                  <a href="<?php echo $path; ?>club.php" id="settings-hc-logo"></a>
                  Items marked with the <?php echo $shortname; ?> Club symbol <img src="<?php echo $web_gallery; ?>v2/images/habboclub/hc_mini.png" /> are available only to <?php echo $shortname; ?> Club members. <a href="<?php echo $path; ?>club.php">Join now!</a>
                </div>
              </div>
              <div id="settings-oldfigure" style="display: none">
                <div class="rounded rounded-lightbrown clearfix">
                  Your <?php echo $shortname; ?> had clothes or colors that are not selectable anymore. Please save your new looks here.
                </div>
              </div>
              <form method="post" action="<?php echo $path; ?>account.php?tab=1" id="settings-form" style="display: none">
                <input type="hidden" name="tab" value="1" />
                <input type="hidden" name="__app_key" value="HoloCMS" />
                <input type="hidden" name="figureData" id="settings-figure" value="<?php echo $mylook1; ?>" />
                <input type="hidden" name="newGender" id="settings-gender" value="<?php echo $mysex1; ?>" />
                <input type="hidden" name="editorState" id="settings-state" value="" />
                <a href="#" id="settings-submit" class="new-button disabled-button"><b>Save changes</b><i></i></a>
                <script type="text/javascript" language="JavaScript">
                  var swfobj = new SWFObject('<?php echo $web_gallery; ?>flash/HabboRegistration.swf', 'habboreg', '435', '400', '8');
                  swfobj.addParam('base', '<?php echo $web_gallery; ?>flash/');
                  swfobj.addParam('wmode', 'opaque');
                  swfobj.addParam('AllowScriptAccess', 'always');
                  swfobj.addVariable('figuredata_url', '<?php echo $path; ?>xml/figuredata.xml');
                  swfobj.addVariable('draworder_url', '<?php echo $path; ?>xml/draworder.xml');
                  swfobj.addVariable('localization_url', '<?php echo $path; ?>xml/figure_editor.xml');
                  swfobj.addVariable('figure', '<?php echo $mylook1; ?>');
                  swfobj.addVariable('gender', '<?php echo $mysex1; ?>');

                  swfobj.addVariable('showClubSelections', '1');
                  <?php if($hc_member) { ?>
                  swfobj.addVariable('userHasClub', '1');
                  <?php } ?>

                  if(deconcept.SWFObjectUtil.getPlayerVersion()['major'] >= 8) {
                    <?php if(!$hc_member) { ?>
                    $('settings-editor').setStyle({
                      textAlign: 'center'
                    });
                    <?php } ?>
                    swfobj.write('settings-editor');
                    $('settings-form').show();
                    <?php echo ($hc_member ? "$('settings-wardrobe').show();" : ''); ?>
                  }
                </script>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
        <?php } else if($tab == 2) { ?>
      <div class="habblet-container" style="float:left; width: 560px;">
        <div class="cbb clearfix settings">
          <h2 class="title">Change Your Profile</h2>
          <div class="box-content">
            <form action="<?php echo $path; ?>account.php?tab=2" method="post">
              <input type="hidden" name="tab" value="2" />
              <input type="hidden" name="__app_key" value="HoloCMS" />
              <?php
                if(!empty($result)) {
                  echo '<div class="rounded rounded-' . ($error == 1 ? 'red' : 'green') . '">' . $result . '<br /></div>';
                }
              ?>
              <br />
              <h3>Your motto</h3>
              <p>
                Your motto is seen by everyone, so think carefully!
              </p>
              <p>
                <span class="label">Motto:</span>
                <input type="text" name="motto" size="32" maxlength="32" value="<?php echo HoloText($motto); ?>" id="avatarmotto" />
              </p>
              <?php if(IsHCMember($my_id)) { ?>
              <h3>Club Membership</h3>
              <p>You are a <?php echo $shortname; ?> Club member. Your membership will expire in <b><?php echo HCDaysLeft($my_id); ?></b> days. If you would like to extend your membership, please click <a href="<?php echo $path; ?>club.php">here</a>.</p>
              <?php }?>
              <div class="settings-buttons">
                <input type="submit" value="Save changes" name="save" class="submit" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  <?php } else if($tab == 3) { ?>
    <div class="habblet-container " style="float:left; width: 560px;">
      <div class="cbb clearfix settings">
        <h2 class="title">Change Your Email Settings</h2>
        <div class="box-content">
          <?php
            if(!empty($result)) {
              echo '<div class="rounded rounded-' . ($error == 1 ? 'red' : 'green') . '">' . $result . '<br /></div><br />';
            }
          ?>
          <form action="<?php echo $path; ?>account.php?tab=3" method="post" id="emailform">
            <input type="hidden" name="tab" value="3" />
            <input type="hidden" name="__app_key" value="HoloCMS" />
            <div class="settings-step">
              <h4>1.</h4>
              <div class="settings-step-content">
                <h3>Give your current details</h3>
                <p>
                  <label for="currentpassword">Current password:</label><br />
                  <input type="password" size="32" maxlength="32" name="password" id="currentpassword" class="currentpassword" />
                </p>
                <div>
                  <div>
                    <label for="birthdate">Birthdate:</label>
                  </div>
                  <div id="required-birthday">
                    <select name="day" id="day" class="dateselector">
                      <option value="">Day</option>
                      <?php for ($i = 1; $i <= 31; $i++) { ?>
                      <option value="<?php echo $i; ?>"<?php echo ($birthday[0] == $i ? ' selected="selected"' : ''); ?>><?php echo $i; ?></option>
                      <?php } ?>
                    </select>
                    <select name="month" id="month" class="dateselector">
                      <option value="">Month</option>
                      <?php for($i = 1; $i <= 12; $i++) { ?>
                      <option value="<?php echo $i; ?>"<?php echo ($birthday[1] == $i ? ' selected="selected"' : ''); ?>><?php echo month($i); ?></option>
                      <?php } ?>
                    </select>
                    <select name="year" id="year" class="dateselector">
                      <option value="">Year</option>
                      <?php for ($i = $Y; $i >= 1900; $i--) { ?>
                      <option value="<?php echo $i; ?>"<?php echo ($birthday[2] == $i ? ' selected="selected"' : ''); ?>><?php echo $i; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="settings-step">
              <h4>2.</h4>
              <div class="settings-step-content">
                <h3>Enter your new email address</h3>
                <p>Make sure you type in your email address correctly!</p>
                <p>
                  <label for="email">Email address:</label>
                  <br />
                  <input type="text" name="email" id="email" size="32" maxlength="48" value="<?php echo $themail; ?>" />
                </p>
                <p>
                  <input name="directemail" id="directemail"<?php echo ($receive_news == 1 ? ' checked' : ''); ?> value="on" type="checkbox">
                  <label for="directemail">Yes, please send me <?php echo $sitename; ?> updates, including the newsletter!</label>
                </p>
              </div>
            </div>
            <div class="settings-buttons">
              <input type="submit" value="Save changes" name="save" class="submit" />
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
  <?php } else if($tab == 4) { ?>
    <div class="habblet-container " style="float:left; width: 560px;">
      <div class="cbb clearfix settings">
        <h2 class="title">Change Your Password Settings</h2>
        <div class="box-content">
          <?php
            if(!empty($result)) {
              echo '<div class="rounded rounded-' . ($error == 1 ? 'red' : 'green') . '">' . $result . '<br /></div><br />';
            }
          ?>
            <form action="<?php echo $path; ?>account.php?tab=4" method="post" id="passwordform">
              <input type="hidden" name="tab" value="4" />
              <input type="hidden" name="__app_key" value="HoloCMS" />
              <div class="settings-step">
                <h4>1.</h4>
                <div class="settings-step-content">
                  <h3>Give your current details</h3>
                  <p>
                    <label for="currentpassword">Current password:</label>
                    <br />
                    <input type="password" size="32" maxlength="32" name="password" id="currentpassword" class="currentpassword " />
                  </p>
                  <div>
                    <div>
                      <label for="birthdate">Birthdate:</label>
                    </div>
                    <div id="required-birthday">
                      <select name="day" id="day" class="dateselector">
                        <option value="">Day</option>
                        <?php for ($i = 1; $i <= 31; $i++) { ?>
                        <option value="<?php echo $i; ?>"<?php echo ($birthday[0] == $i ? ' selected="selected"' : ''); ?>><?php echo $i; ?></option>
                        <?php } ?>
                      </select>
                      <select name="month" id="month" class="dateselector">
                        <option value="">Month</option>
                        <?php for($i = 1; $i <= 12; $i++) { ?>
                        <option value="<?php echo $i; ?>"<?php echo ($birthday[1] == $i ? ' selected="selected"' : ''); ?>><?php echo month($i); ?></option>
                        <?php } ?>
                      </select>
                      <select name="year" id="year" class="dateselector">
                        <option value="">Year</option>
                        <?php for ($i = $Y; $i >= 1900; $i--) { ?>
                        <option value="<?php echo $i; ?>"<?php echo ($birthday[2] == $i ? ' selected="selected"' : ''); ?>><?php echo $i; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="settings-step">
                <h4>2.</h4>
                <div class="settings-step-content">
                  <h3>Choose a new password</h3>
                  <p>Enter your new password of choice and confirm it in the second field.</p>
                  <p>
                    <label for="pass">New password:</label>
                    <br />
                    <input type="password" name="pass" id="password" size="32" maxlength="48" value="" />
                  </p>
                  <p>
                    <label for="confpass">Confirm new password:</label>
                    <br/>
                    <input type="password" name="confpass" id="password" size="32" maxlength="48" value="" />
                  </p>
                </div>
              </div>
              <div class="settings-buttons">
                <input type="submit" value="Save changes" name="save" class="submit" />
              </div>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
  <?php } elseif($tab == 5) { ?>
        <div id="friend-management" class="habblet-container">
          <div class="cbb clearfix settings">
            <h2 class="title">Friend Management</h2>
            <div id="friend-management-container" class="box-content">
              <div id="category-view" class="clearfix">
                <div id="search-view">
                  Search for a friend below:
                  <div id="friend-search" class="friendlist-search">
                    <input type="text" maxlength="32" id="friend_query" class="friend-search-query" />
                    <a class="friendlist-search new-button search-icon" id="friend-search-button"><b><span></span></b><i></i></a>
                  </div>
                </div>
                <div id="category-list">
                  <div id="friends-category-title">
                    Friend categories
                  </div>
                  <div class="category-default category-item selected-category" id="category-item-0">Friends</div>
                  <input type="text" maxlength="32" id="category-name" class="create-category" />
                  <div id="add-category-button" class="friendmanagement-small-icons add-category-item add-category"></div>
                </div>
              </div>
              <div id="friend-list" class="clearfix">
                <div id="friend-list-header-container" class="clearfix">
                  <div id="friend-list-header">
                    <div class="page-limit">
                      <div class="big-icons friend-header-icon">
                        Friends<br />
                        Show 30 |
                        <a class="category-limit" id="pagelimit-50">50</a> |
                        <a class="category-limit" id="pagelimit-100">100</a>
                      </div>
                    </div>
                  </div>
                  <div id="friend-list-paging">
                    1 |
                    <?php
                      $afriendscount = mysqli_query($connection, "SELECT COUNT(*) FROM messenger_friendships WHERE userid = '1' OR friendid = '1'") or die(mysqli_error($connection));
                      $friendscount = mysqli_num_fields($afriendscount);
                      $pages = ceil($friendscount / 30);
                      $n = 1;
                      while($n < $pages) {
                        $n++;
                    ?>
                    <a href="#" class="friend-list-page" id="page-<?php echo $n; ?>"><?php echo $n; ?></a> |
                    <?php } ?>
                    <a href="#" class="friend-list-page" id="page-2">&gt;&gt;</a>
                  </div>
                </div>
                <form id="friend-list-form">
                  <table id="friend-list-table" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                      <tr class="friend-list-header">
                        <td class="friend-select" />
                        <td class="friend-name table-heading">Name</td>
                        <td class="friend-login table-heading">Last login</td>
                        <td class="friend-remove table-heading">Remove</td>
                      </tr>
                      <?php
                        $i = 0;
                        $getem = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '1' OR friendid = '1' LIMIT 30") or die(mysqli_error($connection));

                        while($row = mysqli_fetch_assoc($getem)) {
                          $i++;
                          $even = (IsEven($i)) ? 'odd' : 'even';
                          $friendsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '" . ($row['friendid'] == 1 ? $row['userid'] : $row['friendid']) . "'");
                         $friendrow = mysqli_fetch_assoc($friendsql);
                      ?>
                      <tr class="<?php echo $even; ?>">
                        <td><input type="checkbox" name="friendList[]" value="<?php echo $friendrow['id']; ?>" /></td>
                        <td class="friend-name">
                          <?php echo $friendrow['name']; ?>
                        </td>
                        <td class="friend-login" title="<?php echo $friendrow['lastvisit']; ?>"><?php echo $friendrow['lastvisit']; ?></td>
                        <td class="friend-remove"><div id="remove-friend-button-<?php echo $friendrow['id']; ?>" class="friendmanagement-small-icons friendmanagement-remove remove-friend"></div></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                  </table>
                  <a class="select-all" id="friends-select-all" href="#">Select all</a> |
                  <a class="deselect-all" href=# " id="friends-deselect-all ">Deselect all</a>
                </form>
              </div>
              <script type="text/javascript">
                new FriendManagement({ currentCategoryId: 0, pageListLimit: 30, pageNumber: 1});
              </script>
              <div id="category-options" class="clearfix">
                <select id="category-list-select" name="category-list">
                    <option value="0">Friends</option>
                    <option value="1">Test Friends</option>
                </select>
                <div class="friend-del">
                  <a class="new-button red-button cancel-icon" href="#" id="delete-friends"><b><span></span>Delete selected friends</b><i></i></a>
                </div>
                <div class="friend-move">
                  <a class="new-button" href="#" id="move-friend-button"><b><span></span>Move</b><i></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    <script type="text/javascript ">
      L10N.put('friendmanagement.tooltip.deletefriends', 'Are you sure you want to delete these selected friends?<div class="friendmanagement-small-icons friendmanagement-save friendmanagement-tip-delete"><a class="friends-delete-button" id="delete-friends-button">Delete</a></div><div class="friendmanagement-small-icons friendmanagement-remove friendmanagement-tip-cancel"><a id="cancel-delete-friends">Cancel</a></div>');
      L10N.put('friendmanagement.tooltip.deletefriend', 'Are you sure you want to delete this friend?<div class="friendmanagement-small-icons friendmanagement-save friendmanagement-tip-delete"><a id="delete-friend-%friend_id%">Delete</a></div><div class="friendmanagement-small-icons friendmanagement-remove friendmanagement-tip-cancel"><a id="remove-friend-can-%friend_id%">Cancel</a></div>');
      L10N.put('friendmanagement.tooltip.deletecategory', 'Are you sure you want to delete this category?<div class="friendmanagement-small-icons friendmanagement-save friendmanagement-tip-delete"><a class="delete-category-button" id="delete-category-%category_id%">Delete</a></div><div class="friendmanagement-small-icons friendmanagement-remove friendmanagement-tip-cancel"><a id="cancel-cat-delete-%category_id%">Cancel</a></div>');
    </script>
  </div>
</div>
<?php } else { ?>
<b>Tab appears to be valid, but no tab data found. Please report this issue.</b>
<?php
  }

  require_once(dirname(__FILE__) . '/templates/community/footer.php');
?>