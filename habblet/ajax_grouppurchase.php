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
require_once(dirname(__FILE__) . '/../core.php');
require_once(dirname(__FILE__) . '/../includes/session.php');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');

$group_name = isset($_POST['name']) ? FilterText($_POST['name']) : '';
$group_desc = isset($_POST['description']) ? FilterText($_POST['description']) : '';
$do = isset($_GET['do']) ? FilterText($_GET['do']) : '';

if(!$logged_in) {
?>
  <p>Please log in first.</p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); return false;"><b>Done</b><i></i></a>
  </p>
<?php
  exit;
}

  // Make sure the user meets the requirements to buy a group. If not, this part
  // should cut off the script.  
  if(getContent('allow-group-purchase') != 1) {
?>
  <p id="purchase-result-error">Purchasing the group failed. Please try again later.</p>
  <div id="purchase-group-errors">
    <p>Purchashing groups has been disabled by the Hotel Managment. Please try again later.<br /></p>
  </div>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); return false;"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
    exit;
  } else if($myrow['credits'] < 20) {
?>
  <p id="purchase-result-error">Purchasing the group failed. Please try again later.</p>
  <div id="purchase-group-errors">
    <p>You don't have enough Credits. <a href="credits.php">Get more here!</a><br /></p>
  </div>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); return false;"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
  exit;
  } else {
    $groups_owned = mysqli_evaluate("SELECT COUNT(*) FROM groups_details WHERE ownerid = '{$my_id}' LIMIT 10");
    if($groups_owned > 10) {
?>
  <p id="purchase-result-error">Purchasing the group failed. Please try again later.</p>
  <div id="purchase-group-errors">
    <p>You have reached the maximum amount of <i>owned</i> groups per user (3).<br /></p>
  </div>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); return false;"><b>Done</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
      exit;
    }
  }

  // The buy part. If the script has not been cut off yet, we should be ready to go.

  if($do != 'purchase_confirmation') {
?>
  <p>
    <img src="<?php echo $path; ?>habbo-imaging/badge-fill/b0503Xs09114s05013s05015.gif" border="0" align="left">Fill in the form below to create your own group. Creating a group will cost you <b>20</b> credits.
  </p>
  <p>
    <b>Group Name</b><br />
    <input type="text" name="name" id="group_name" value="" length="10" maxlength="25">
  </p>
  <p>
    <b>Group Description</b><br />
    <textarea name="description" id="group_description" maxlength="200"></textarea>
  </p>
  <p>You can modify these settings at any time after creating the group.</p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.confirm(); return false;"><b>Purchase</b><i></i></a>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); return false;"><b>Cancel</b><i></i></a>
  </p>
<?php
    exit;
  } else if($do == 'purchase_confirmation') {
    if(empty($group_name) || empty($group_desc)) {
?>
  <p>Please fill in all fields!</p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); GroupPurchase.open(); return false;"><b>Back</b><i></i></a>
  </p>
<?php
    exit;
    } else {
      if(strlen($group_name > 25) && !is_numeric($group_name)) {
?>
  <p>The group name you have selected is too long.</p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); GroupPurchase.open(); return false;"><b>Back</b><i></i></a>
  </p>
<?php
        exit;
      } else if(strlen($group_desc > 200) && !is_numeric($group_desc)) {
?>
  <p>The group description you have entered is too long.</p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); GroupPurchase.open(); return false;"><b>Back</b><i></i></a>
  </p>
<?php
        exit;
      } else {
        $check = mysqli_query($connection, "SELECT id FROM groups_details WHERE name = '{$group_name}' LIMIT 1") or die(mysqli_error($connection));
        $already_exists = mysqli_num_rows($check);
        if($already_exists > 0) {
?>
  <p>An group with this name already exists.</p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); GroupPurchase.open(); return false;"><b>Back</b><i></i></a>
  </p>
<?php
        } else {
          mysqli_query($connection, "INSERT INTO groups_details(name, description, ownerid, created, badge, type) VALUES('{$group_name}', '{$group_desc}', '{$my_id}', '{$date_full}', 'b0503Xs09114s05013s05015', '0')") or die(mysqli_error($connection));
          $check = mysqli_query($connection, "SELECT id FROM groups_details WHERE ownerid = '{$my_id}' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
          $row = mysqli_fetch_assoc($check);
          $group_id = $row['id'];
          mysqli_query($connection, "INSERT INTO groups_memberships(userid, groupid, member_rank, is_current) VALUES('{$my_id}', '{$group_id}', '2', '0')") or die(mysqli_error($connection));
          mysqli_query($connection, "UPDATE users SET credits = credits - 20 WHERE id = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
          mysqli_query($connection, "INSERT INTO cms_transactions(userid, descr, date, amount) VALUES('{$my_id}', 'Group purchase', '{$date_full}', '-20')") or die(mysqli_error($connection));
          @SendMUSData('UPRC' . $my_id);
?>
  <p>
    <b>Group Purchased</b><br /><br />
    <img src="<?php echo $path; ?>habbo-imaging/badge-fill/b0503Xs09114s05013s05015.gif" border="0" align="left" />
    Congratulations! You are now the proud owner of <b><?php echo HoloText($group_name); ?></b>.<br /><br />
    Click <a href="<?php echo $path; ?>group_profile.php?id=<?php echo $group_id; ?>">here</a> to go to your group home right away, or use the button below to close this window.
  </p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); return false;"><b>Done</b><i></i></a>
  </p>
<?php
        }
      }
    }
  } else {
?>
  <p>An unknown error occured. Please try again in a couple of minutes.</p>
  <p>
    <a href="#" class="new-button" onclick="GroupPurchase.close(); return false;"><b>OK</b><i></i></a>
  </p>
<?php } ?>