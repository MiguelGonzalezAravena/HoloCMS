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
(!defined('IN_HOLOCMS')) ? header('Location: ../index.php') : '';

// So many queries just to make it look pretty..

$news_1_query = mysqli_query($connection, "SELECT num, title, date, topstory, short_story FROM cms_news ORDER BY num DESC LIMIT 1");
$news_2_query = mysqli_query($connection, "SELECT num, title, date, topstory, short_story FROM cms_news ORDER BY num DESC LIMIT 1, 2");
$news_3_query = mysqli_query($connection, "SELECT num, title, date, topstory, short_story FROM cms_news ORDER BY num DESC LIMIT 2, 3");
$news_4_query = mysqli_query($connection, "SELECT num, title, date, topstory, short_story FROM cms_news ORDER BY num DESC LIMIT 3, 4");

$news_1_row = mysqli_fetch_assoc($news_1_query);
$news_2_row = mysqli_fetch_assoc($news_2_query);
$news_3_row = mysqli_fetch_assoc($news_3_query);
$news_4_row = mysqli_fetch_assoc($news_4_query);

$news_1_title = isset($news_1_row['title']) ? HoloText($news_1_row['title']) : 'Article not found';
$news_1_snippet = isset($news_1_row['short_story']) ? HoloText($news_1_row['short_story']) : 'This article does not exist yet.';
$news_1_date = isset($news_1_row['date']) ? HoloText($news_1_row['date']) : 'This article does not exist yet.';
$news_1_topstory = isset($news_1_row['topstory']) ? HoloText($news_1_row['topstory']) : $web_gallery . 'images/top-story/shabbolin_300x187_A.gif';
$news_1_id = isset($news_1_row['num']) ? HoloText($news_1_row['num']) : 0;

$news_2_title = isset($news_2_row['title']) ? HoloText($news_2_row['title']) : 'Article not found';
$news_2_snippet = isset($news_2_row['short_story']) ? HoloText($news_2_row['short_story']) : 'This article does not exist yet.';
$news_2_date = isset($news_2_row['date']) ? HoloText($news_2_row['date']) : 'This article does not exist yet.';
$news_2_topstory = isset($news_2_row['topstory']) ? HoloText($news_2_row['topstory']) : $web_gallery . 'images/top-story/shabbolin_300x187_A.gif';
$news_2_id = isset($news_2_row['num']) ? HoloText($news_2_row['num']) : 0;

$news_3_title = isset($news_3_row['title']) ? HoloText($news_3_row['title']) : 'Article not found';
$news_3_snippet = isset($news_3_row['short_story']) ? HoloText($news_3_row['short_story']) : 'This article does not exist yet.';
$news_3_date = isset($news_3_row['date']) ? HoloText($news_3_row['date']) : 'This article does not exist yet.';
$news_3_topstory = isset($news_3_row['topstory']) ? HoloText($news_3_row['topstory']) : $web_gallery . 'images/top-story/shabbolin_300x187_A.gif';
$news_3_id = isset($news_3_row['num']) ? HoloText($news_3_row['num']) : 0;

$news_4_title = isset($news_4_row['title']) ? HoloText($news_4_row['title']) : 'Article not found';
$news_4_snippet = isset($news_4_row['short_story']) ? HoloText($news_4_row['short_story']) : 'This article does not exist yet.';
$news_4_date = isset($news_4_row['date']) ? HoloText($news_4_row['date']) : 'This article does not exist yet.';
$news_4_topstory = isset($news_4_row['topstory']) ? HoloText($news_4_row['topstory']) : $web_gallery . 'images/top-story/shabbolin_300x187_A.gif';
$news_4_id = isset($news_4_row['num']) ? HoloText($news_4_row['num']) : 0;
?>