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

$pagename = 'Content Management';
$catId = isset($_POST['category']) ? (int) $_POST['category'] : 0;
$credits = isset($_POST['credits']) ? (int) $_POST['credits'] : 0;
$type = isset($_POST['type']) ? (int) $_POST['type'] : 0;
$code = isset($_POST['code']) ? FilterText($_POST['code']) : '';
$user = isset($_POST['user']) ? FilterText($_POST['user']) : '';
$badgec = isset($_POST['badgec']) ? FilterText($_POST['badgec']) : '';
$take = isset($_POST['take']) ? FilterText($_POST['take']) : '';
$time = isset($_POST['time']) ? (int) $_POST['time'] : '';
$msg = '';

if(empty($catId)) { // do not try to save when it's a category jump
  if(!empty($credits)) {
    $sql = mysqli_query($connection, "SELECT id, credits FROM users");
    $count = mysqli_num_rows($sql);
    while($row = mysqli_fetch_assoc($sql)) {
      mysqli_query($connection, "UPDATE users SET credits = credits + '{$credits}' WHERE id = '{$row['id']}' LIMIT 1");
      @SendMUSData('UPRC' . $row['id']);
    }
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Gave credits to every user,  total users: {$count} (Amount {$credits})', 'massa.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));
    $msg = 'Everybody got there credits! Users processed: ' . $count;
  } elseif(!empty($code) || !empty($type)) {
    $sql = mysqli_query($connection, "SELECT id FROM users");
    $count = mysqli_num_rows($sql);
    while($row = mysqli_fetch_assoc($sql)) {
      mysqli_query($connection, "UPDATE users_badges SET iscurrent = '0' WHERE userid = '{$row['id']}' AND iscurrent = '1'") or die(mysqli_error($connection));
      $verify = mysqli_evaluate("SELECT COUNT(*) FROM users_badges WHERE userid = '{$row['id']}' AND badgeid = '{$code}'");
      if($verify == 0) {
        mysqli_query($connection, "INSERT INTO users_badges(userid, badgeid, iscurrent) VALUES('{$row['id']}', '{$code}', '1')") or die(mysqli_error($connection));
        @SendMUSData('UPRS' . $row['id']);
      }
    }

    if($type == 2) {
      $sql = mysqli_query($connection, "SELECT id FROM users");
      $count = mysqli_num_rows($sql);
      while($row = mysqli_fetch_assoc($sql)) {
        $time = time() + ($time * 24 * 60 * 60);
        $time = date('Y-m-d', $time);
        mysqli_query($connection, "INSERT INTO cms_badges(userid, days, badgeid) VALUES('{$row['id']}', '{$time}', '{$code}')");
      }
      mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, timestamp) VALUES('Housekeeping', 'Gave badge to every user (for {$time} days),  total users: {$count} (Badge id: {$code}).', 'massa.php', '{$my_id}', '{$date_full}')") or die(mysqli_error($connection));
    } else {
      mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, timestamp) VALUES('Housekeeping', 'Gave badge to every user (perm.),  total users: {$count} (Badge id: {$code}).', 'massa.php', '{$my_id}', '{$date_full}')") or die(mysqli_error($connection));
    }
  
    $msg = 'Everybody got there badge! Users processed: '.$count;
  } elseif(!empty($user) || !empty($badgec)) {
    $sql = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$user}'");
    if(mysqli_num_rows($sql) == 1) {
      $sql = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$user}'");
      $row = mysqli_fetch_assoc($sql);
      mysqli_query($connection, "DELETE FROM users_badges WHERE userid = '{$row['id']}' AND badgeid = '{$badgec}'");
      if(mysqli_error == 0) {
        $msg = 'The badge ' . $badgec . ' is succesfully taken off.';
        mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Badge ({$badgec}) taken off', 'massa.php', '{$my_id}', '{$row['id']}', '{$date_full}')") or die(mysqli_error($connection));
      } else {
        $msg = 'This user doesn\'t have this badge!';
      }
    } else {
      $msg = 'User doesn\'t exist!';
    }
  } elseif(!empty($take)) {
    $sql = mysqli_query($connection, "SELECT * FROM users_badges WHERE badgeid = '{$take}'");
    $count = mysqli_num_rows($sql);
    while($row = mysqli_fetch_assoc($sql)) {
      mysqli_query($connection, "DELETE FROM users_badges WHERE badgeid = '{$take}'");
    }
    mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, timestamp) VALUES('Housekeeping', 'Badge taken off from all users who had the badge {$take}. Users processed: {$count}', 'massa.php', '{$my_id}', '{$date_full}')") or die(mysqli_error($connection));
    $msg = 'Badges are succesfully taken off! Users processed: ' . $count;
  }
}

if(empty($catId) || $catId < 1 || $catId > 4) {
  $catId = 1;
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
          <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
            <form action="index.php?p=massa_stuff&do=jumpCategory" method="post" name="Jumper!" id="Jumper!">
              <div class="tableborder">
                <div class="tableheaderalt">Select Category</div>
                <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                  <tr>
                    <td class="tablerow2" width="100%" valign="middle" align="center">
                      <select name="category" class="dropdown">
                        <option value="1" <?php echo ($catId == 1 ? ' selected="selected"' : ''); ?>>Massa credits</option>
                        <option value="2" <?php echo ($catId == 2 ? ' selected="selected"' : ''); ?>>Massa badge (period/perm.)</option>
                        <option value="3" <?php echo ($catId == 3 ? ' selected="selected"' : ''); ?>>Remove badge from a certain user</option>
                        <option value="4" <?php echo ($catId == 4 ? ' selected="selected"' : ''); ?>>Remove badge from all users with badge code [...]</option>
                      </select>
                      &nbsp;
                      <input type="submit" value="Go" class="realbutton" accesskey="s">
                    </td>
                  </tr>
                </table>
              </div>
            </form>
            <br />
            <form action="index.php?p=massa_stuff&do=save" method="post" name="theAdminForm" id="theAdminForm">
              <div class="tableborder">
                <div class="tableheaderalt">Massa stuff</div>
                <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                  <?php if($catId == 1) { ?>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>Amount</strong>
                      <div class="graytext">The amount of credits everybody gets.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="text" name="credits" value="" size="3" maxlength="5" class="textinput">
                    </td>
                  </tr>
                  <?php } elseif($catId == 2) { ?>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>Badge code</strong>
                      <div class="graytext">What's the badgecode everybody gets?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="text" name="code" value="" size="3" maxlength="3" class="textinput">
                    </td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>Permanent or for a special time?</strong>
                      <div class="graytext">Does everyone gets the badge permanent or for a special time?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="type" value="1"> Permanent
                      <input type="radio" name="type" value="2"> For a special time
                    </td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>How long do they get it?</strong>
                      <div class="graytext">For how long do they get the badge? <b>Note:</b> if you've choosen "permanent" it doesn't matter.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <select style="color: black; font-family: Verdana" name="time">
                        <option value="1" selected>1 day</option>
                        <option value="2">2 days</option>
                        <option value="3">3 days</option>
                        <option value="4">4 days</option>
                        <option value="5">5 days</option>
                        <option value="6">6 days</option>
                        <option value="7">1 week</option>
                        <option value="14">2 weeks</option>
                        <option value="21">3 weeks</option>
                        <option value="30">1 month</option>
                        <option value="60">2 months</option>
                        <option value="90">3 months</option>
                        <option value="120">4 months</option>
                        <option value="150">5 months</option>
                        <option value="180">6 months</option>
                        <option value="210">7 months</option>
                        <option value="240">8 months</option>
                        <option value="270">9 months</option>
                        <option value="300">10 months</option>
                        <option value="330">11 months</option>
                        <option value="365">1 year</option>
                        <option value="730">2 year</option>
                        <option value="1095">3 year</option>
                        <option value="1460">4 year</option>
                        <option value="1825">5 year</option>
                        <option value="3650">10 year</option>
                        <option value="5475">15 year</option>
                        <option value="7300">20 year</option>
                        <option value="9125">25 year</option>
                      </select>
                    </td>
                  </tr>
                <?php } elseif($catId == 3) { ?>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>User</strong>
                      <div class="graytext">From who do you want to take off a badge?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="text" name="user" value="" size="3" maxlength="100" class="textinput">
                    </td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>Badge code</strong>
                      <div class="graytext">What badge do you want to take off, fill in the badge code.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="text" name="badgec" value="" size="3" maxlength="3" class="textinput">
                    </td>
                  </tr>
                <?php } elseif($catId == 4) { ?>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>Badge code</strong>
                      <div class="graytext">What badge do you want to take off, fill in the badge code.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="text" name="take" value="" size="3" maxlength="3" class="textinput">
                    </td>
                  </tr>
                <?php } else { ?>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><strong>Amount</strong>
                      <div class="graytext">The amount of credits everybody gets.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="text" name="credits" value="" size="3" maxlength="5" class="textinput">
                    </td>
                  </tr>
                <?php } ?>
                  <tr>
                    <td align="center" class="tablesubheader" colspan="2">
                      <input type="submit" value="Submit" class="realbutton" accesskey="s" name="massa">
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
