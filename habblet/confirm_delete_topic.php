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
($user_rank < 6) ? exit : '';
?>
  <p>You are about to delete a complete topic. Are you sure?</p>
  <p>
    <a href="#" class="new-button" id="discussion-action-cancel"><b>Cancel</b><i></i></a>
    <a href="#" class="new-button" id="discussion-action-ok"><b>Proceed</b><i></i></a>
  </p>
  <div class="clear"></div>