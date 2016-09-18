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

$postid = isset($_POST['postId']) ? (int) $_POST['postId'] : 0;

if(!empty($postid)) {
  $check = mysqli_query($connection, "SELECT * FROM cms_forum_posts WHERE id = '{$postid}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);
  if($exists > 0) {
    $row = mysqli_fetch_assoc($check);
    if($user_rank > 5 || $row['author'] == $name) {
      mysqli_query($connection, "DELETE FROM cms_forum_posts WHERE id = '{$row['id']}' LIMIT 1") or die(mysqli_error($connection));
      // recount the posts and update in DB
      $posts_left = mysqli_evaluate("SELECT COUNT(*) FROM cms_forum_posts WHERE threadid = '{$row['threadid']}'");
      // get the real last post data
      if($posts_left > 0) {
        $lastpost = mysqli_query($connection, "SELECT author, date FROM cms_forum_posts WHERE threadid = '{$row['threadid']}' ORDER BY id DESC LIMIT 1") or die(mysqli_error($connection));
        $lastpost = mysqli_fetch_assoc($lastpost);
      } else {
        $lastpost['author'] = 'No one';
        $lastpost['date'] = 'Never';
      }
      $posts_count = $posts_left - 1;
      mysqli_query($connection, "UPDATE cms_forum_threads SET posts = '{$posts_count}', lastpost_date = '{$lastpost['date']}', lastpost_author = '{$lastpost['author']}' WHERE id = '{$row['threadid']}' LIMIT 1") or die(mysqli_error($connection));
      if($posts_left > 0) {
        echo 'TOPIC_DELETED';
      } else { // if we found that there are no posts left [during recount], delete the thread as well
        mysqli_query($connection, "DELETE FROM cms_forum_threads WHERE id = '{$row['threadid']}' LIMIT 1");
        echo 'TOPIC_DELETED';
      }
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