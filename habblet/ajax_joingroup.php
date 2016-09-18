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

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;

if($groupid > 0) {
  $check = mysqli_query($connection, "SELECT type FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    $check2 = mysqli_query($connection, "SELECT groupid FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' LIMIT 1") or die(mysqli_errors());
    $already_member = mysqli_num_rows($check2);
    $memberships = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE userid = '{$my_id}'");
    if($memberships > 9) {
?>
  <p>You are already member/have pending requests of 10 or more groups.</p>
  <p>
    <a href="#" class="new-button" id="group-action-ok"><b>OK</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
      exit;     
    }

    if($already_member > 0) {
?>
  <p>You are already member of this group or a request to join this group has already been made.</p>
  <p>
    <a href="#" class="new-button" id="group-action-ok"><b>OK</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
      exit;
    } else {
      $groupdata = mysqli_fetch_assoc($check);
      $type = $groupdata['type'];
      $members = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '0'");
      if($type == 0 || $type == 3) { // we're free to join
        if($type == 0 && $members < 500 || $type == 3) {
?>
  <p>You have now joined this group.</p>
  <p>
    <a href="#" class="new-button" id="group-action-ok"><b>OK</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
          mysqli_query($connection, "INSERT INTO groups_memberships(userid, groupid, member_rank, is_current, is_pending) VALUES('{$my_id}', '{$groupid}', '1', '0', '0')") or die(mysqli_error($connection));
          exit;
        } else {
?>
  <p>This group is full.</p>
  <p>
    <a href="#" class="new-button" id="group-action-ok"><b>OK</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
          exit;
        }
      } elseif($type == 1) { // we need to request join
?>
  <p>An request to join this group has been made. The group owner will have to accept you before you join this group.</p>
  <p>
    <a href="#" class="new-button" id="group-action-ok"><b>OK</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
        mysqli_query($connection, "INSERT INTO groups_memberships(userid, groupid, member_rank, is_current, is_pending) VALUES('{$my_id}', '{$groupid}', '1', '0', '1')") or die(mysqli_error($connection));
        exit;
      } elseif($type == 2) { // noone can join
?>
  <p>Sorry, but this group is closed. No one can join this group!</p>
  <p>
    <a href="#" class="new-button" id="group-action-ok"><b>OK</b><i></i></a>
  </p>
  <div class="clear"></div>
<?php
        exit;
      }
    }
  } else {
    echo '1';
    exit;
  }
}
?>