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

(getContent('forum-enabled') != 1) ? header('Location: index.php') : '';
(!isset($_SESSION['username'])) ? exit : '';

$message = isset($_POST['message']) ? FilterText($_POST['message']) : '';
$topicTitle = isset($_POST['topicName']) ? FilterText($_POST['topicName']) : '';
$groupId = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
$now = strtotime('now');

if(empty($topicTitle)) {
  echo 'Topic title may not be blank';
  exit;
}

mysqli_query($connection, "INSERT INTO cms_forum_threads(forumid, type, title, author, date, lastpost_author, lastpost_date, views, posts, unix) VALUES('{$groupId}', '1', '{$topicTitle}', '{$name}', '{$date_full}', '{$name}', '{$date_full}', '0', '0', '{$now}')") or die(mysqli_error($connection));
mysqli_query($connection, "UPDATE users SET postcount = postcount + 1 WHERE id = '{$my_id}' LIMIT 1");
$check = mysqli_query($connection, "SELECT id FROM cms_forum_threads WHERE forumid='{$groupId}' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
$row = mysqli_fetch_assoc($check);
$threadid = $row['id'];
mysqli_query($connection, "INSERT INTO cms_forum_posts (forumid,threadid,message,author,date) VALUES ('{$groupId}','{$threadid}','{$message}','{$name}','{$date_full}')");
echo 'viewthread.php?thread=' . $threadid . '&page=1';
?>