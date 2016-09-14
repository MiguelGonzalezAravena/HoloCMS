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

$label = isset($_POST['label']) ? FilterText($_POST['label']) : '';
$id = isset($_POST['messageId']) ? (int) $_POST['messageId'] : 0;
$start = isset($_POST['start']) ? (int) $_POST['start'] : 0;
$conversationId = isset($_POST['conversationId']) ? (int) $_POST['conversationId'] : '';

$sql = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE id = '{$id}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);

if($row['deleted'] == 1) {
  mysqli_query($connection, "DELETE FROM cms_minimail WHERE id = '{$id}' LIMIT 1");
  $page = 'trash';
  $message = 'The message has been deleted sucessfully';
} else {
  mysqli_query($connection, "UPDATE cms_minimail SET deleted = '1' WHERE id = '{$id}' LIMIT 1");
  $page = 'inbox';
  $message = 'The message has been moved to the trash. You can undelete it, if you wish';
}
$bypass = true;
require_once(dirname(__FILE__) . '/loadMessage.php');
?>