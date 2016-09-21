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
require_once(dirname(__FILE__) . '/../core.php');
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$pagename = 'User Badge Management';
$badge = isset($_POST['badge']) ? FilterText($_POST['badge']) : '';
$key = isset($_POST['name']) ? FilterText($_POST['name']) : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';

if(!empty($badge) && !empty($key)) {
  $check = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$key}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    if(strlen($badge) > 2 && strlen($badge) < 5) {
      $row = mysqli_fetch_assoc($check);
      $userid = $row['id'];
      $check = mysqli_query($connection, "SELECT * FROM users_badges WHERE userid = '{$userid}' AND badgeid = '{$badge}' LIMIT 1") or die(mysqli_error($connection));
      $already_has_badge = mysqli_num_rows($check);
      if($already_has_badge < 1) {
        mysqli_query($connection, "UPDATE users SET badge_status = '1' WHERE name = '{$key}' LIMIT 1") or die(mysqli_error($connection)); 
        mysqli_query($connection, "INSERT INTO users_badges(userid, badgeid, iscurrent) VALUES('{$userid}', '{$badge}', '1')") or die(mysqli_error($connection));

        $msg = 'Gave the user this badge (' . $badge . ') and set it as current badge successfully.';

        mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Gave user {$badge} badge', 'badgetool.php', '{$my_id}', '{$userid}', '{$date_full}')") or die(mysqli_error($connection));
        @SendMusData('UPRS' . $userid);
      } else {
        mysqli_query($connection, "UPDATE users_badges SET iscurrent = '0' WHERE userid = '{$userid}'");
        mysqli_query($connection, "UPDATE users_badges SET iscurrent = '1' WHERE badgeid = '{$badge}' AND userid = '{$userid}' LIMIT 1") or die(mysqli_error($connection));
        $msg = 'This user already has this badge; the badge (' . $badge . ') has been set as the user\'s current badge successfully.';
        mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES ('Housekeeping', 'Set current badge to {$badge}', 'badgetool.php', '{$my_id}', '{$userid}', '{$date_full}')") or die(mysqli_error($connection));
        @SendMusData('UPRS' . $userid);
      }
    } else {
      $msg = 'Invalid badge. Badge codes may only be 3-4 characters long.';
    }
  } else {
    $msg = 'An user with this name/id does not exist!';
  }
} else if(!empty($submit)) {
  $msg = 'Fill in all the fields!';
}

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="22%" valign="top" id="leftblock">
        <div>
          <!-- LEFT CONTEXT SENSITIVE MENU -->
          <?php require_once(dirname(__FILE__) . '/usermenu.php'); ?>
          <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <?php if(!empty($msg)) { ?>
          <p><strong><?php echo $msg; ?></p></strong>
          <?php } ?>
          <form action="index.php?p=badgetool&do=something" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Badge Manager</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Username</strong>
                    <div class="graytext">The username of who this action will apply to.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="name" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Badgecode</strong>
                    <div class="graytext">The bage code, eg. "ADM" or "XM8".</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="badge" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Give badge" class="realbutton" accesskey="s">
                  </td>
                </tr>
              </table>
            </div>
          </form>
          <br />
        </div>
        <!-- / RIGHT CONTENT BLOCK -->
      </td>
      </tr>
  </table>
</div>
<!-- / OUTERDIV -->
<div align="center">
  <br />
  <?php
    $mtime = explode(' ', microtime());
    $totaltime = $mtime[0] + $mtime[1] - $starttime;
    printf('Time: %.3f', $totaltime);
  ?>
</div>