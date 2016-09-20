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
(!defined('IN_HOLOCMS')) ? header('Location: index.php') : '';
$body_id = (!isset($body_id)) ? 'landing' : $body_id;
?>
  <body id="<?php echo $body_id; ?>" class="process-template">
    <div id="overlay"></div>
    <div id="container">
      <div class="cbb process-template-box clearfix">
        <div id="content">
          <div id="header" class="clearfix">
            <h1><a href="<?php echo $path; ?>index.php"></a></h1>
            <ul class="stats">
              <li class="stats-online"><span class="stats-fig"><?php echo $online_count; ?></span>
                <?php echo $locale['users_online_now']; ?>
              </li>
              <li class="stats-visited"><img src="<?php echo $web_gallery; ?>v2/images/<?php echo $online; ?>.gif" alt="Server Status" border="0"></li>
            </ul>
          </div>