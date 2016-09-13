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

$pagename = 'User Rank Management';
$rank = isset($_POST['rank']) ? (int) $_POST['rank'] : 0;
$user = isset($_POST['name']) ? FilterText($_POST['name']) : '';
$msg = '';

if(!empty($rank)) {
  $check = mysqli_query($connection, "SELECT id FROM users WHERE name = '{$user}' OR id = '{$user}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  $drow = mysqli_fetch_assoc($check);

  if($rank == 3) {
    $badge = 'XXX';
  } elseif($rank == 4) {
    $badge = 'NWB';
  } elseif($rank == 5) {
    $badge = 'HBA';
  } elseif($rank == 6) {
    $badge = 'MOD';
  } elseif($rank == 4) {
    $badge = 'ADM';
  }

  if($exists > 0) {
    if($rank > 0 && $rank < 8) {
      if($rank > 6 && $sysadmin == $my_id || $rank < 7) {
        if($sysadmin == $drow['id']) {
          mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Access Denied to Rank Tool; you may not modify the System Administrator\'s rank!', 'ranktool.php', '{$my_id}', '{$drow['id']}', '{$date_full}')") or die(mysqli_error($connection));
          $msg = 'Access denied. You may not modify the System Administrator\'s Rank.';
        } else {
          mysqli_query($connection, "UPDATE users SET rank = '{$rank}' WHERE name = '{$user}' LIMIT 1") or die(mysqli_error($connection)); 
          $msg = 'Rank updated successfully.';
          mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Changed user rank to {$rank}', 'ranktool.php', '{$my_id}', '{$drow['id']}', '{$date_full}')") or die(mysqli_error($connection));
          mysqli_query($connection, "DELETE FROM users_badges WHERE userid = '{$drow['id']}' AND badgeid = 'XXX' LIMIT 1");
          mysqli_query($connection, "DELETE FROM users_badges WHERE userid = '{$drow['id']}' AND badgeid = 'NWB' LIMIT 1");
          mysqli_query($connection, "DELETE FROM users_badges WHERE userid = '{$drow['id']}' AND badgeid = 'HBA' LIMIT 1");
          mysqli_query($connection, "DELETE FROM users_badges WHERE userid = '{$drow['id']}' AND badgeid = 'MOD' LIMIT 1");
          mysqli_query($connection, "DELETE FROM users_badges WHERE userid = '{$drow['id']}' AND badgeid = 'ADM' LIMIT 1");
          mysqli_query($connection, "INSERT INTO users_badges(userid, badgeid, iscurrent) VALUES('{$drow['id']}', '{$badge}', '0')");
        }
      } else {
        mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Access Denied to Rank Tool; Only the system administrator may give out rank 7!', 'ranktool.php', '{$my_id}', '{$drow['id']}', '{$date_full}')") or die(mysqli_error($connection));
        $msg = 'Access denied. Only the System Administrator may give out the administrator rank.';
      }
    } else {
      $msg = 'Invalid rank. Only ranks 1 thru 7 are valid.';
    }
  } else {
    $msg = 'An user with this name/id does not exist!';
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
          <?php if(!empty($msg)){ ?>
          <p><strong><?php echo $msg; ?></p></strong>
          <?php } ?>
          <form action="index.php?p=ranktool&do=something" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Rank Manager</div>
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
                  <td class="tablerow1" width="40%" valign="middle"><strong>Rank</strong>
                    <div class="graytext">The numeric rank you want to give the user. Ranks 1 thru 7 are valid ranks.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="rank" value="" size="3" maxlength="1" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Change Rank" class="realbutton" accesskey="s">
                  </td>
                </tr>
              </table>
            </div>
          </form>
          <br />
          <?php
            $get_vouchers = mysqli_query($connection, "SELECT * FROM users WHERE rank > 2 ORDER BY name ASC LIMIT 50") or die(mysqli_error($connection));
          ?>
          <div class="tableborder">
            <div class="tableheaderalt">Staff Members</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="60%" align="center">Username</td>
                <td class="tablesubheader" width="40%" align="center">Rank</td>
              </tr>
              <?php
                while($row = mysqli_fetch_assoc($get_vouchers)) {
                  printf("<tr>
                  <td class='tablerow1' align='center'>%s (ID: %s)</td>
                  <td class='tablerow2' align='center'>%s</td>
                  </tr>", $row['name'], $row['id'], $row['rank']);
                }
              ?>
            </table>
          </div>
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