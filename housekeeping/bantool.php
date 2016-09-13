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
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$pagename = 'Remote Banning';
$msg = '';
$uid = isset($_POST['uid']) ? (int) $_POST['uid'] : 0;
$length = isset($_POST['length']) ? FilterText($_POST['length']) : '';
$ip = isset($_POST['ip']) ? FilterText($_POST['ip']) : '';
$reason = isset($_POST['reason']) ? FilterText($_POST['reason']) : '';
$length_array = array('2h', '4h', '12h', '1d', '2d', '7d', '2w', '1m', '6m', '1y', 'perm');
$length_text = array('2 Hours', '4 Hours', '12 Hours', '24 Hours', '2 Days', '7 Days', '2 Weeks', '1 Month', '6 Month', '1 Year', 'Permenantly (25 Years)');

// The huge/large piece of code below is complex calculation of dates. eg. if you ban someone for 2 hours on the 31st
// of December around 22:34, there's a lot of stuff that you have to process. This thing was a real bitch to code.
// - Is it the end of the day? If so, increase the day number.
// - Is it the end of the month? If so, increase the month number and re-calculate the new day.
// --> Does this month we're in have 30 or 31 days?
// - Is it the end of a year? If so, increase the year number.
// Finally, we have to form it into a proper date again.

if(!empty($uid)) {
  if($uid == 0) {
    $msg = 'Invalid User ID';
  } else {
    $check = mysqli_query($connection, "SELECT name FROM users WHERE id = '{$uid}' LIMIT 1") or die(mysqli_error($connection));
    $valid = mysqli_num_rows($check);
    if($valid < 1) {
      $msg = 'Sorry, but this user does not exist!';
    } else {
      $date = $date_full;
      $date = explode(' ', $date);
      $time = explode(':', $date[1]);
      $date = explode('-', $date[0]);
      switch($length) {
        case '2h':
          $time[0] = $time[0] + 2;
          break;
        case '4h':
          $time[0] = $time[0] + 4;
          break;
        case '12h':
          $time[0] = $time[0] + 12;
          break;
        case '1d':
          $date[0] = $date[0] + 1;
          break;
        case '2d':
          $date[0] = $date[0] + 2;
          break;
        case '7d':
          $date[0] = $date[0] + 7;
          break;
        case '2w':
           $date[0] = $date[0] + 14;
          break;
        case '1m':
          $date[1] = $date[1] + 1;
          break;
        case '6m':
          $date[1] = $date[1] + 6;
          break;
        case '1y':
          $date[2] = $date[2] + 1;
          break;
        case 'perm':
          $date[2] = $date[2] + 25;
          break;
        default:
          $msg = 'Invalid ban length!';
          break;
      }
                   
      if($time[0] > 23) {
        $diff = $time[0] - 24;
        $time[0] = $diff + 1;
        $date[0] = $date[0] + 1;
      }
          
      if(IsEven($month)) {
        if($date[0] > 30){
          $diff = $date[0] - 30;
          $date[0] = $diff;
          $date[1] = $date[1] + 1;
        }
      } else {
        if($date[0] > 31) {
          $diff = $date[0] - 31;
          $date[0] = $diff;
          $date[1] = $date[1] + 1;
        }
      }
          
      if($date[1] > 11) {
        $diff = 12 - $date[1];
        $date[1] = $diff;
        $date[2] + 1;
      }
      
      // if under 10 and no zero in front, append one
      if($date[0] < 10 && strrpos($date[0], '0') == false) {
        $date[0] = '0' . $date[0];
      }

      if($date[1] < 10 && strrpos($date[1], '0') == false) {
        $date[1] = '0' . $date[1];
      }

      if($time[0] < 10 && strrpos($time[0], '0') == false) {
        $time[0] = '0' . $time[0];
      }
          
      $ban_date = $date[0] . '-' . $date[1] . '-' . $date[2] . ' ' . $time[0] . ':' . $time[1] . ':' . $time[2];
      $tmp = mysqli_fetch_assoc($check);
      
      if($uid != $sysadmin || $my_id == $sysadmin) {
        mysqli_query($connection, "INSERT INTO users_bans(userid, ipaddress, date_expire, descr) VALUES('{$uid}', '{$ip}', '{$ban_date}', '{$reason}')") or die(mysqli_error($connection));
        mysqli_query($connection, "UPDATE users SET ticket_sso = '' WHERE id = '{$uid}' LIMIT 1") or die(mysqli_error($connection)); // Let's null his SSO ticket just to make sure
        mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Remotely banned ({$reason})', 'bantool.php', '{$my_id}', '{$uid}', '{$date_full}')") or die(mysqli_error($connection));
    
        $msg = 'User ' . $tmp['name'] . ' has been banned untill ' . $ban_date . ' successfully. An ingame notification has been sent (that is, if the user is online).';
        @SendMUSData('HKSB' . $uid . chr(2) . $reason);
      } else {
        $msg = 'You may not ban the System Administrator!';
        mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Access Denied; tried to ban System Administrator', 'bantool.php', '{$my_id}', '{$uid}', '{$date_full}')") or die(mysqli_error($connection));
      }
    }
  }
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
            <p><strong><?php echo $msg; ?></strong></p>
            <?php } ?>
              <form action="index.php?p=ban&do=banthebastard" method="post" name="theAdminForm" id="theAdminForm">
                <div class="tableborder">
                  <div class="tableheaderalt">(Remote) Banning</div>
                  <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>User ID</b>
                        <div class="graytext">The ID of the user you want to ban. To retrive a User"s ID, use <a href="index.php?p=uid">the User ID Tool</a>.</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="text" name="uid" value="<?php echo ($uid == 0 ? '' : $uid); ?>" size="30" class="textinput">
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Ban Reason</b>
                        <div class="graytext">The reason for this ban that will be shown to the user.</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="text" name="reason" value="<?php echo $reason; ?>" size="50" class="textinput">
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>IP Address</b> (Optional)
                        <div class="graytext">If you want to ban a users IP also, fill in this field. To retrive a User"s IP Address, use <a href="index.php?p=ip">the IP Address Tool</a>.</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="text" name="ip" value="<?php echo $ip; ?>" size="30" class="textinput">
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Ban Length</b></td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <select name="length" class="dropdown">
                          <?php
                            for ($i = 0; $i < count($length_array); $i++) { 
                              echo '<option value="' . $length_array[$i] . '"' . ($length == $length_array[$i] ? ' selected' : '') . '>' . $length_text[$i] . '</option>';
                            }
                          ?>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <tr>
                        <td align="center" class="tablesubheader" colspan="2">
                          <input type="submit" value="Ban" class="realbutton" accesskey="s">
                        </td>
                      </tr>
              </form>
              </table>
              </div>
              <br /> </div>
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
