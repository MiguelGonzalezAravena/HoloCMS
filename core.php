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

/** HOLOCMS MAINCORE
* @author Meth0d
* @desc   Main HoloCMS Processor
* @usage  N/A
*/

define('IN_HOLOCMS', TRUE);
//Define default charset (UTF-8)
header('Content-type: text/html; charset=UTF-8');

$rawname = '';
// #########################################################################
// Start the initalization process
require_once(dirname(__FILE__) . '/config.php');

$_SESSION['username'] = (!empty($_SESSION['username']) ? $_SESSION['username'] : '');
$_COOKIE['remember'] = (!empty($_COOKIE['remember']) ? $_COOKIE['remember'] : '');

// Launch the installer if needed
if(empty($sqlusername) || empty($sqldb) || empty($sqlhostname)) {
  header('Location: install.php');
} else {
  if(file_exists('install.php') || file_exists('upgrade.php') && $bypass_check != true) {
    echo "<h1>Security Alert</h1><hr>It appears you have already executed the installation script or written your configuration file. To start using your site, for security reasons, please delete install.php and/or upgrade.php from the HoloCMS directory to proceed. If you have not yet completed installation or wish to execute it again, please <a href='install.php'>click here</a>.<hr><i>HoloCMS</i>";
    exit;
  } else {
    require_once(dirname(__FILE__) . '/includes/mysql.php');
  }
}

// Validate the langauge
$language_path = dirname(__FILE__) . '/locale/' . $language . '/index.php';

if(file_exists($language_path)) {
  $valid_language = true;
} else {
  $language = 'en';
  $valid_language = false;
}

// #########################################################################
// Define the variables HoloCMS wants to use later on

$remote_ip = $_SERVER['REMOTE_ADDR'];

$enable_sso = config('enable_sso');
$language = config('language');
$sitename = config('sitename');
$shortname = config('shortname');
$ip = config('ip');
$dcr = config('dcr');
$port = FetchServerSetting('server_game_port');
$fport = FetchServerSetting('server_mus_port');
$texts = config('texts');
$variables = config('variables');
$reload_url = config('reload_url');
$maintenance = config('site_closed');
$time = time();
$H = date('H');
$i = date('i');
$s = date('s');
$m = date('m');
$d = date('d');
$Y = date('Y');
$y = date('y');
$j = date('j');
$n = date('n');
$today = $d;
$month = $m;
$year = $Y;
$date_normal = date('d-m-Y', time());
$date_reversed = date('Y-m-d', time());
$date_full = date('d-m-Y H:i:s', time());
$date_time = date('H:i:s', time());
$date_hc = $j . '-' . $n . '-' . $Y;
$regdate = $date_normal;
$s1ql = mysqli_query($connection, "SELECT * FROM system LIMIT 1");
$r1ow = mysqli_fetch_assoc($s1ql);
$online_count = $r1ow['onlinecount'];
$server_on_localhost = config('localhost');
$habboversion = '23_deebb3529e0d9d4e847a31e5f6fb4c5b/9';
$forumid = (!empty($_GET['id']) ? (int) $_GET['id'] : '');
$analytics = HoloText(config('analytics'), true) . "\n";

// #########################################################################
function room_state($state) {
  switch ($state) {
    case 0:
      return 'Open';
      break;
    case 1:
      return 'Locked (visitors have to ring bell)';
      break;
    case 2:
      return 'Password protected';
      break;
    case 3:
      return 'HC only';
      break;
    case 4:
      return 'Staff only';
      break;
    default:
      return 'Unknown';
      break;
  }
}


// #########################################################################
function month($month_number) {
  switch($month_number) {
    case 01:
    case 1:
      return 'January';
      break;
    case 02:
    case 2:
      return 'February';
    case 03:
    case 3:
      return 'March';
      break;
    case 04:
    case 4:
      return 'April';
      break;
    case 05:
    case 5:
      return 'May';
      break;
    case 06:
    case 6:
      return 'June';
      break;
    case 07:
    case 7:
      return 'July';
      break;
    case 08:
    case 8:
      return 'August';
      break;
    case 09:
    case 9:
      return 'September';
      break;
    case 10:
      return 'October';
      break;
    case 11:
      return 'November';
      break;
    case 12:
      return 'December';
      break;
  }
}

// #########################################################################
function config($key) {
  global $connection;

  $request = mysqli_query($connection, "SELECT value FROM cms_system WHERE systemVar = '{$key}'") or die(mysqli_error($connection));
  $result = mysqli_fetch_assoc($request);
  return $result['value'];
}

function FetchServerSetting($strSetting, $switch = false) {
  global $connection;

  $request = mysqli_query($connection, "SELECT sval FROM system_config WHERE skey = '{$strSetting}'") or die(mysqli_error($connection));
  $row = mysqli_fetch_assoc($request);
  if(!$switch) {
    return $row['sval'];
  } else if($switch && $row['sval'] == 1) {
    return 'Enabled';
  } else if($switch && $row['sval'] != 1) {
    return 'Disabled';
  }
}

// #########################################################################

function getContent($strKey) {
  global $connection;

  $strKey = FilterText($strKey);
  $tmp = mysqli_query($connection, "SELECT contentvalue FROM cms_content WHERE contentkey = '{$strKey}'") or die(mysqli_error($connection));
  $tmp = mysqli_fetch_assoc($tmp);
  return $tmp['contentvalue'];
}

// #########################################################################
function FetchCMSSetting($strSetting) {
  global $connection;

  $tmp = mysqli_query($connection, "SELECT {$strSetting} FROM cms_system") or die(mysqli_error($connection));
  $tmp = mysqli_fetch_assoc($tmp);
  return $tmp[$strSetting];
}

// #########################################################################
// If a user is logged out and has a 'remember me' cookie, validate the information
// in the cookie and log the user in if everything's valid.
// Please do not mess with this. It is a fairly simple process, but if it doesn't work
// properly it can cause a huge mess. Everything in this function is commented.

require_once(dirname(__FILE__) . '/includes/inc.crypt.php');
if(!$_SESSION['username'] && $_COOKIE['remember'] == 'remember') {
  // Get variables stored in cookies; the username and sha1 hashed password
  $cname = FilterText($_COOKIE['rusername']);
  $cpass_hash = $_COOKIE['rpassword'];

  // Now fetch the password that belongs to this user from the database
  $csql = mysqli_query($connection, "SELECT password FROM users WHERE name = '{$cname}'") or die(mysqli_error($connection));
  $cnum = mysqli_num_rows($csql);

  // If no results are returned (invalid username, destroy the cookie
  if($cnum < 1) {
    setcookie('remember', '', time()-60*60*24*100, '/');
    setcookie('rusername', '', time()-60*60*24*100, '/');
    setcookie('rpassword', '', time()-60*60*24*100, '/');
    setcookie('cookpass', '', time()-60*60*24*100, '/');
  } else {
    // We found a user, now get his password and hash it
    $crow = mysqli_fetch_assoc($csql);
    $correct_pass = $crow['password'];

    // Check if the hashed database password and hash in the cookie match
    // If no, destroy the cookie. If yes, log the user in.
    if($cpass_hash == $correct_pass) {
      $_SESSION['username'] = $cname;
      $_SESSION['password'] = $crow['password'];
      mysqli_query($connection, "UPDATE users SET lastvisit = '{$date_full}' WHERE name = '{$cname}'") or die(mysqli_error($connection));
      header('Location: security_check.php');
    } else {
      setcookie('remember', '', time()-60*60*24*100, '/');
      setcookie('rusername', '', time()-60*60*24*100, '/');
      setcookie('rpassword', '', time()-60*60*24*100, '/');
      setcookie('cookpass', '', time()-60*60*24*100, '/');
    }
  }
}

// #########################################################################

function IsEven($intNumber) {
  if($intNumber%2 == 0) {
    return true;
  } else {
    return false;
  }
}

// #########################################################################

function bbcode_format($str) {
  global $path;
  // Parse smilies
  if(HoloText(getContent('enable-smilies')) == 1) {
    $str = str_replace(":)", " <img src=\"{$path}web-gallery/smilies/smile.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace(";)", " <img src=\"{$path}web-gallery/smilies/wink.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace(":P", " <img src=\"{$path}web-gallery/smilies/tongue.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace(";P", " <img src=\"{$path}web-gallery/smilies/winktongue.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace(":p", " <img src=\"{$path}web-gallery/smilies/tongue.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace(";p", " <img src=\"{$path}web-gallery/smilies/winktongue.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace("(L)", " <img src=\"{$path}web-gallery/smilies/heart.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace("(l)", " <img src=\"{$path}web-gallery/smilies/heart.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace(":o", " <img src=\"{$path}web-gallery/smilies/shocked.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
    $str = str_replace(":O", " <img src=\"{$path}web-gallery/smilies/shocked.gif\" alt=\"Smiley\" title=\"Smiley\" border=\"0\"> ", $str);
  }
  // Parse BB code
  $simple_search = array(
    '/\[b\](.*?)\[\/b\]/is',
    '/\[i\](.*?)\[\/i\]/is',
    '/\[u\](.*?)\[\/u\]/is',
    '/\[s\](.*?)\[\/s\]/is',
    '/\[quote\](.*?)\[\/quote\]/is',
    '/\[link\=(.*?)\](.*?)\[\/link\]/is',
    '/\[url\=(.*?)\](.*?)\[\/url\]/is',
    '/\[color\=(.*?)\](.*?)\[\/color\]/is',
    '/\[size=small\](.*?)\[\/size\]/is',
    '/\[size=large\](.*?)\[\/size\]/is',
    '/\[code\](.*?)\[\/code\]/is',
    '/\[habbo\=(.*?)\](.*?)\[\/habbo\]/is',
    '/\[room\=(.*?)\](.*?)\[\/room\]/is',
    '/\[group\=(.*?)\](.*?)\[\/group\]/is'
  );
  $simple_replace = array(
    '<strong>$1</strong>',
    '<em>$1</em>',
    '<u>$1</u>',
    '<s>$1</s>',
    "<div class='bbcode-quote'>$1</div>",
    "<a href='$1'>$2</a>",
    "<a href='$1'>$2</a>",
    "<font color='$1'>$2</font>",
    "<font size='1'>$1</font>",
    "<font size='3'>$1</font>",
    '<pre>$1</pre>',
    "<a href='{$path}user_profile.php?id=$1'>$2</a>",
    "<a onclick=\"roomForward(this, '$1', 'private'); return false;\" target=\"client\" href=\"{$path}client.php?forwardId=2&roomId=$1\">$2</a>",
    "<a href='{$path}group_profile.php?id=$1'>$2</a>"
  );

  $str = preg_replace($simple_search, $simple_replace, $str);
  return $str;
}

// #########################################################################

function GenerateTicket() {
  global $connection;
  $data = 'ST-';
  for ($i = 1; $i <= 6; $i++)
    $data = $data . rand(0, 9);

  $data = $data . '-';

  for ($i = 1; $i <= 20; $i++)
    $data = $data . rand(0, 9);

  $data = $data . '-holo-fe';
  $data = $data . rand(0, 5);

  return $data;
}

function randomVoucher($code) {
  $key = '';
  $characters = '1234567890abdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  $key = $characters{rand(0, 71)};

  for($i = 1; $i < $code; $i++) {
    $key .= $characters{rand(0, 71)};
  }

  return $key;
}

// #########################################################################

// Collectable check (showroom). It can be that a collectable isn't in the collectables showroom. We're gonna do that now.
$sql = mysqli_query($connection, "SELECT * FROM cms_collectables");

while($row = mysqli_fetch_assoc($sql)) {
  $date = (date('m') - 1);
  if($date >= $row['month']) {
    mysqli_query($connection, "UPDATE cms_collectables SET showroom = '1' WHERE id = '{$row['id']}'");
  }

  if(date("Y") != $row['year']) {
    mysqli_query($connection, "UPDATE cms_collectables SET showroom = '1' WHERE id = '{$row['id']}'");
  }
}

// #########################################################################

if($_SESSION['username']) {
  $rawname = $_SESSION['username']; // Has slashes added and lacking proper capitals
  $rawpass = $_SESSION['password']; // HoloHash()'ed user password

  $usersql = mysqli_query($connection, "SELECT * FROM users WHERE name = '{$rawname}' AND password = '{$rawpass}'");
  $myrow = mysqli_fetch_assoc($usersql);

  $password_correct = mysqli_num_rows($usersql);

  $my_id = $myrow['id'];
  $user_rank = $myrow['rank'];

  $check = mysqli_query($connection, "SELECT * FROM users_bans WHERE userid = '{$my_id}' OR ipaddress = '{$remote_ip}'") or die(mysqli_error($connection));
  $is_banned = mysqli_num_rows($check);

  if($password_correct != 1) { // Invalid credentials. Possible session hijack attempt, so we log the user out.
    session_destroy();
    header('Location: index.php?error=1');
  } elseif($is_banned > 0) {
    $bandata = mysqli_fetch_assoc($check);
    $reason = $bandata["descr"];
    $expire = $bandata["date_expire"];

    $xbits = explode(" ", $expire);
    $xtime = explode(":", $xbits[1]);
    $xdate = explode("-", $xbits[0]);

    $stamp_now = time();
    $stamp_expire = mktime($xtime[0], $xtime[1], $xtime[2], $xdate[0], $xdate[1], $xdate[2]);

    if($stamp_now < $stamp_expire) {
      $login_error = 'You have been banned! The reason for this ban is "' . $reason . '". The ban will expire at ' . $expire . '.';
      require_once(dirname(__FILE__) . '/logout.php');
      session_destroy();
      exit;
    } else { // Ban expired
      mysqli_query($connection, "DELETE FROM users_bans WHERE userid = '{$my_id}' OR ipaddress = '{$remote_ip}'") or die(mysqli_error($connection));
    }
  }

  if($enable_sso == 1 && $password_correct == 1) {
    $myticket = $myrow['ticket_sso'];
    // if(empty($myticket) || $myticket == "0" || strlen($myticket) < 39){
    //  $myticket = GenerateTicket();
    //  mysqli_query($connection, "UPDATE users SET ticket_sso = '".$myticket."', ipaddress_last = '".$remote_ip."' WHERE id = '".$my_id."' LIMIT 1") or die(mysqli_error($connection));
    // }
  } else {
    $myticket = 'ST-NoTicketToGenerate-holo-fe';
  }
  $logged_in = true;
  $name = HoloText($myrow['name']);
} else {
  $user_rank = 0;
  $name = 'Guest';
  $my_id = 'GUEST';
  $myticket = 'ST-Guest-holo-fe';
  $logged_in = false;
}

// #########################################################################
// Gift check (noob/welcome stuff)
/*
$sql = mysqli_query($connection, "SELECT noob,gift,sort,roomid,lastgift FROM users WHERE id='".$my_id."' LIMIT 1");
$row = mysqli_fetch_assoc($sql);
if($row['gift'] < 3) {
if($row['noob'] == 1) {
    if($row['lastgift'] < date("d-m-Y")) {
        mysqli_query($connection, "INSERT INTO cms_noobgifts (userid,gift,read) VALUES ('".$my_id."','".$row['gift']."','0')");
        mysqli_query($connection, "UPDATE users SET lastgift='".date("d-m-Y")."',gift=gift+'1' WHERE id='".$my_id."' LIMIT 1");
    }
}
}
// #########################################################################
*/
if($enable_status_image == 1) {
  if($server_on_localhost != 0 || $ip == '127.0.0.1') {
    $fip = '127.0.0.1';
  } else {
    $fip = $ip;
  }
  $fp = @fsockopen($fip, $fport, $errno, $errstr, 1);
  if($fp) {
    $online = 'online';
    fclose($fp);
  } else {
    $online = 'offline';
  }
} else {
  $online = 'online';
}

// #########################################################################

if($user_rank > 5) {
  if(isset($_SESSION['hkusername']) && isset($_SESSION['hkpassword'])) {
    $rank['iAdmin'] = 1;
  } else {
    $rank['iAdmin'] = 0;
  }
} else {
  $rank['iAdmin'] = 0;
}

// #########################################################################

function GetUserBadge($strName) { // supports user IDs also
  global $connection;

  if(is_numeric($strName))
    $check = mysqli_query($connection, "SELECT id FROM users WHERE id = '{$strName}' AND badge_status = '1'") or die(mysqli_error($connection));
  else
    $check = mysqli_query($connection, "SELECT id FROM users WHERE name = '" . FilterText($strName) . "' AND badge_status = '1'") or die(mysqli_error($connection));

  $exists = mysqli_num_rows($check);

  if($exists > 0) {
    $usrrow = mysqli_fetch_assoc($check);
    $check = mysqli_query($connection, "SELECT * FROM users_badges WHERE userid = '{$usrrow["id"]}' AND iscurrent = '1'") or die(mysqli_error($connection));
    $hasbadge = mysqli_num_rows($check);
    if($hasbadge > 0) {
      $badgerow = mysqli_fetch_assoc($check);
      return $badgerow['badgeid'];
    } else {
      return false;
    }
  } else {
    return false;
  }
}

// #########################################################################

function GetUserGroup($my_id) {
  global $connection;

  $check = mysqli_query($connection, "SELECT groupid FROM groups_memberships WHERE userid = '{$my_id}' AND is_current = '1'") or die(mysqli_error($connection));
  $has_fave = mysqli_num_rows($check);

  if($has_fave > 0) {
    $row = mysqli_fetch_assoc($check);
    $groupid = $row['groupid'];
    return $groupid;
  } else {
    return false;
  }
}

// #########################################################################

function GetUserGroupBadge($my_id) {
  global $connection;

  $check = mysqli_query($connection, "SELECT groupid FROM groups_memberships WHERE userid = '{$my_id}' AND is_current = '1'") or die(mysqli_error($connection));
  $has_badge = mysqli_num_rows($check);

  if($has_badge > 0) {
    $row = mysqli_fetch_assoc($check);
    $groupid = $row['groupid'];
    $check = mysqli_query($connection, "SELECT badge FROM groups_details WHERE id = '{$groupid}'") or die(mysqli_error($connection));
    $row = mysqli_fetch_assoc($check);
    return $row['badge'];
  } else {
    return false;
  }
}

// #########################################################################

// Calculate the amount of HC Days left
function HCDaysLeft($my_id) {
  global $connection;

  // Query for the info we need to calculate
  $sql = mysqli_query($connection, "SELECT months_left, date_monthstarted FROM users_club WHERE userid = '{$my_id}'") or die(mysqli_error($connection));
  $tmp = mysqli_fetch_assoc($sql);
  $valid = mysqli_num_rows($sql);

  if($valid > 0) {
    // Collect the variables we need from the query result
    $months_left = $tmp['months_left'];
    $month_started = $tmp['date_monthstarted'];

    // We take 31 days for every month left, assuming each month has 31 days
    $days_left = $months_left * 31;

    // Split up the day/month/year so we can use it with mktime
    $tmp = explode('-', $month_started);
    $day = $tmp[0];
    $month = $tmp[1];
    $year = $tmp[2];

    // First of all make the dates we want to compare, do some math
    //$then = mktime(0, 0, 0, $month, $day, $year, 0);
    $then = strtotime($year . '-' . $month . '-' . $day);
    $now = time();
    $difference = $now - $then;
    // If this month expired already
    if ($difference < 0) {
      $difference = 0;
    }

    // Now do some math
    $days_expired = floor($difference / (60 * 60 * 24));

    // $days_expired stands for the days we already wasted in this month
    // 31 days for each month added together, minus the days we've wasted in the current month, is the amount of days we have left, totally
    $days_left = $days_left - $days_expired;
    return $days_left;
  } else {
    return 0;
  }
}

// #########################################################################
$filename = basename($_SERVER['PHP_SELF']);
$realPath = realpath('.');

if($maintenance == 1 && $rank['iAdmin'] < 1 && $filename != 'maintenance.php' && $filename != 'forgot.php' && strstr($realPath, 'housekeeping') == false) {
  header('Location: maintenance.php');
} elseif($rank['iAdmin'] == 1 && $maintenance == 1) {
  $notify_maintenance = true;
}

// #########################################################################

function IsHCMember($my_id) {
  global $connection;

  if(HCDaysLeft($my_id) > 0) {
    return true;
  } else {
    // Make sure that HC members are _not_ rank 2 and that they do not have their gay little badge
    $check = mysqli_query($connection, "SELECT * FROM users_club WHERE userid = '{$my_id}'");
    $clubrecord = mysqli_num_rows($check);
    if($clubrecord > 0) {
        mysqli_query($connection, "UPDATE users SET badge_status = '0', hc_before = '1' WHERE id = '{$my_id}'") or die(mysqli_error($connection));
        mysqli_query($connection, "UPDATE users SET rank = '1' WHERE id = '{$my_id}' AND rank = '2'") or die(mysqli_error($connection));
        mysqli_query($connection, "DELETE FROM users_badges WHERE badgecode = 'HC1' OR badgeid = 'HC2' AND userid = '{$my_id}'");
        mysqli_query($connection, "DELETE FROM users_club WHERE userid = '{$my_id}'") or die(mysqli_error($connection));
        (!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/includes/mus.php') : '');
        @SendMUSData('UPRS' . $my_id);
    }
    return false;
  }
}

// #########################################################################

function GiveHC($user_id, $months) {
  global $connection;

  $sql = mysqli_query($connection, "SELECT * FROM users_club WHERE userid = '{$user_id}'") or die(mysqli_error($connection));
  $valid = mysqli_num_rows($sql);

  if($valid > 0) {
      mysqli_query($connection, "UPDATE users SET rank = '2' WHERE rank = '1' AND id = '{$user_id}'") or die(mysqli_error($connection));
      mysqli_query($connection, "UPDATE users_club SET months_left = months_left + {$months} WHERE userid = '{$user_id}'") or die(mysqli_error($connection));
      $check = mysqli_query($connection, "SELECT * FROM users_badges WHERE badgeid = 'HC1' AND userid = '{$user_id}'") or die(mysqli_error($connection));
      $found = mysqli_num_rows($check);
      if($found != 1) { // No badge. Poor thing.
          mysqli_query($connection, "UPDATE users SET badge_status = '0' WHERE id = '{$user_id}' LIMIT 1") or die(mysqli_error($connection));
          mysqli_query($connection, "UPDATE users_badges SET iscurrent = '0' WHERE userid = '{$user_id}'") or die(mysqli_error($connection));
          mysqli_query($connection, "INSERT INTO users_badges(userid, badgeid, iscurrent) VALUES ('{$user_id}', 'HC1', '1')") or die(mysqli_error($connection));
      }
  } else {
      $date = date("d-m-Y", time());
      mysqli_query($connection, "INSERT INTO users_club(userid, date_monthstarted, months_expired, months_left) VALUES('{$user_id}','{$date}','0','0')") or die(mysqli_error($connection));
      GiveHC($user_id, $months);
  }

  (!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/includes/mus.php') : '');
  SendMUSData('UPRS' . $user_id);
  SendMUSData('UPRC' . $user_id);
}

// #########################################################################

if($_SESSION['username']) {
  $blob = time();
  mysqli_query($connection, "UPDATE users SET online = '{$blob}', ipaddress_last = '{$remote_ip}' WHERE id = '{$my_id}'") or die(mysqli_error($connection));
    //if($phail == true){
    //echo "<b>Please wait..</b><br />Please wait while we update your HoloDB compatability..<br />";
    //mysqli_query($connection, "ALTER TABLE `users` ADD `online` TEXT NOT NULL ;") or die(mysqli_error($connection));
    //echo "Done! Please reload this page to proceed. You will not see this message again.";
    //exit;
    //}
}

// #########################################################################

function IsUserOnline($intUID) {
  global $connection;

  $result = mysqli_query($connection, "SELECT online FROM users WHERE id = '{$intUID}'") or die(mysqli_error($connection));
  $timeout = 600; // 10 minutes ?

  if(mysqli_num_rows($result) < 1) {
    return false;
  } else {
    $result = mysqli_fetch_array($result);
    $result = $result[0];
    $result = $result + $timeout;
    if($result >= time()) {
      return true;
    } else {
      return false;
    }
  }
}

// #########################################################################

function IsUserBanned($my_id) {
  global $connection;

  $check = mysqli_query($connection, "SELECT * FROM users_bans WHERE userid = '{$my_id}'") or die(mysqli_error($connection));
  $is_banned = mysqli_num_rows($check);

  return (!is_numeric($my_id) ? false : '');

  if($is_banned > 0) {
    $bandata = mysqli_fetch_assoc($check);
    $reason = $bandata['descr'];
    $expire = $bandata['date_expire'];

    $xbits = explode(' ', $expire);
    $xtime = explode(':', $xbits[1]);
    $xdate = explode('-', $xbits[0]);

    $stamp_now = time();
    $stamp_expire = mktime($xtime[0], $xtime[1], $xtime[2], $xdate[0], $xdate[1], $xdate[2]);

    if($stamp_now < $stamp_expire) {
      return true;
    } else { // Ban expired
      mysqli_query($connection, "DELETE FROM users_bans WHERE userid = '{$my_id}'") or die(mysqli_error($connection));
      return false;
    }
  } else {
    return false;
  }
}

// #########################################################################

function mysqli_evaluate($query, $default_value = 'undefined') {
  global $connection;

  $query = mysqli_query($connection, $query) or die(mysqli_error($connection));
  $row = mysqli_fetch_assoc($query);

  if(mysqli_num_rows($query) < 1) {
    return $default_value;
  } else {
    return array_shift($row);
  }
}

// #########################################################################

function FilterText($str, $advanced = false) {
  $str = htmlspecialchars(trim($str), ENT_QUOTES);
  return $str;
}

function HoloText($str, $bbcode = false) {
  $str = htmlspecialchars_decode(nl2br($str));
  $str = ($bbcode ? bbcode_format($str) : $str);
  return $str;
}

// #########################################################################
/** Quick function to format the type stuff
*
* eg. formatThing(1,"geniefirehead",true); would return
* s_geniefirehead_pre
*
* formatThing(4,"bg_rain",false); would return
* b_bg_rain
*
*/
function formatThing($type, $data, $pre) {
  $str = '';
  switch($type) {
    case 1:
      $str .= 's_';
      break;
    case 2:
      $str .= 'w_';
      break;
    case 3:
      $str .= 'commodity_';
      break; // =S
    case 4:
      $str .= 'b_';
      break;
  }
  $str .= $data;
  $str = ($pre == true ? $str . '_pre' : '');
  return $str;
}

/** Quick function to insert or update the user's inventory
*
* UpdateOrInsert(type,amount,data,userid);
* always returns true or cuts the script off with a mysql error
*
*/
function UpdateOrInsert($type, $amount, $data, $my_id) {
  global $connection;
  /*
  $data = FilterText($data);
  $type = FilterText($type);
  $amount = FilterText($amount);
  */
  $check = mysqli_query($connection, "SELECT id FROM cms_homes_inventory WHERE data = '{$data}' AND userid = '{$my_id}' AND type = '{$type}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    mysqli_query($connection, "UPDATE cms_homes_inventory SET amount = amount + {$amount} WHERE userid = '{$my_id}' AND type = '{$type}' AND data = '{$data}' LIMIT 1") or die(mysqli_error($connection));
  } else {
    mysqli_query($connection, "INSERT INTO cms_homes_inventory(userid, type, subtype, data, amount) VALUES('{$my_id}', '{$type}', '0', '{$data}', '{$amount}')") or die(mysqli_error($connection));
  }
  return true;
}

/** Quick function to delete or update something from the user's inventory
*
* always returns true or cuts the script off with a mysql error
*
*/
function UpdateOrDelete($id, $my_id) {
  global $connection;
  //$id = FilterText($id);
  $check = mysqli_query($connection, "SELECT amount FROM cms_homes_inventory WHERE id = '{$id}' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    $row = mysqli_fetch_assoc($check);
    if($row['amount'] > 1) {
      mysqli_query($connection, "UPDATE cms_homes_inventory SET amount = amount - 1 WHERE id = '{$id}' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    } else {
      mysqli_query($connection, "DELETE FROM cms_homes_inventory WHERE id = '{$id}' AND userid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    }
  }
  return true;
}

// #########################################################################
require_once(dirname(__FILE__) . '/includes/version.php');
?>
