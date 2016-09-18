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

(getContent('forum-enabled') != 1) ? header('Location: index.php') : '';
(!isset($_SESSION['username'])) ? exit : '';

$topicid = isset($_POST['topicId']) ? (int) $_POST['topicId'] : 0;
$topicname = isset($_POST['topicName']) ? FilterText($_POST['topicName']) : '';
$topic_closed = isset($_POST['topicClosed']) ? (int) $_POST['topicClosed'] : 0;
$topic_sticky = isset($_POST['topicSticky']) ? (int) $_POST['topicSticky'] : 0;

if($topic_closed == 0 && $topic_sticky == 0) {
	$type = 1;
} elseif($topic_closed == 1 && $topic_sticky == 0) {
	$type = 2;
} elseif($topic_closed == 0 && $topic_sticky == 1) {
	$type = 3;
} elseif($topic_closed == 1 && $topic_sticky == 1) {
	$type = 4;
} else {
	exit;
}

if(!empty($topicid)) {
	if($user_rank > 5) {
		$check = mysqli_query($connection, "SELECT title, type FROM cms_forum_threads WHERE id = '{$topicid}' LIMIT 1");
		$exists = mysqli_num_rows($check);
		if($exists > 0) {
			mysqli_query($connection, "UPDATE cms_forum_threads SET type = '{$type}', title = '{$topicname}' WHERE id = '{$topicid}' LIMIT 1") or die(mysqli_error($connection));
			echo '<center><br /><br /><b>The thread has been updated successfully.</b><br /><a href="viewthread.php?thread=' . $topicid . '&sp=JumpToLast">Proceed</a><br /><br /><br /></center>';
		} else {
			exit;
		}
	} else {
		exit;
	}
} else {
	exit;
}
?>