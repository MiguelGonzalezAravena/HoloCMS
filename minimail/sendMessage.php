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
if($bypass1 != true) {
  require_once(dirname(__FILE__) . '/../core.php');
  require_once(dirname(__FILE__) . '/../includes/session.php');

  $messageid = isset($_POST['messageId']) ? (int) $_POST['messageId'] : 0;
  $recipientids = isset($_POST['recipientIds']) ? FilterText($_POST['recipientIds']) : '';
  $subject = isset($_POST['subject']) ? FilterText($_POST['subject']) : '';
  $body = isset($_POST['body']) ? FilterText($_POST['body']) : '';
}

$ids = explode(',', $recipientids);
$numofids = count($ids);
$sql = mysqli_query($connection, "SELECT NOW()");
$date = mysqli_result($sql, 0);

if(!empty($messageId)) {
  $sql = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE id = '{$messageid}'");
  $row = mysqli_fetch_assoc($sql);
  if($row['conversationid'] == 0) {
    $sql = mysqli_query($connection, "SELECT MAX(conversationid) FROM cms_minimail");
    $conid = mysqli_result($sql, 0);
    $conid = $conid + 1;
    mysqli_query($connection, "UPDATE cms_minimail SET conversationid = '{$conid}' WHERE id = '{$row['id']}'");
  } else {
    $conid = $row['conversationid'];
  }
  $subject = 'Re: '.$row['subject'];
  $ids[0] = $row['senderid'];
} else {
  $conid = 0;
}

$elements = count($ids);
$elements = $elements - 1;
$i = -1;
while ($elements != $i) {
  $i++;
  mysqli_query($connection, "INSERT INTO cms_minimail(senderid, to_id, subject, date, message, conversationid) VALUES('{$my_id}', '{$ids[$i]}', '{$subject}', '{$date}', '{$body}', '{$conid}')");
}
$bypass = true;
$page = 'inbox';
$message = 'Message sent sucessfully.';
if($bypass1 != 'true'){ include('loadMessage.php'); }
?>