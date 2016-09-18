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

if(!empty($topicid)) {
	if($user_rank > 5) {
		$check = mysqli_query($connection, "SELECT id FROM cms_forum_threads WHERE id = '{$topicid}' LIMIT 1");
		$exists = mysqli_num_rows($check);
		if($exists > 0) {
			mysqli_query($connection, "DELETE FROM cms_forum_threads WHERE id = '{$topicid}' LIMIT 1");
			mysqli_query($connection, "DELETE FROM cms_forum_posts WHERE threadid = '{$topicid}'");
			echo 'SUCCESS';
			exit;
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