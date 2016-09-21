<?php
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided 'as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/
require_once(dirname(__FILE__) . '/../core.php');
require_once(dirname(__FILE__) . '/../includes/session.php');

$ownerid = isset($_POST['ownerId']) ? (int) $_POST['ownerId'] : 0;
$message = isset($_POST['message']) HoloText($_POST['message'], true) : '';
$row = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$my_id}' LIMIT 1"));
?>
  <ul class="guestbook-entries">
    <li id="guestbook-entry--1" class="guestbook-entry">
      <div class="guestbook-author">
        <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $row['figure']; ?>&direction=2&head_direction=2&gesture=sml&size=s" alt="<?php echo $row['name'] ?>" title="<?php echo $row['name'] ?>" />
      </div>
      <div class="guestbook-message">
        <div class="online">
          <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $rawname; ?>">
            <?php echo $row['name'] ?>
          </a>
        </div>
        <p>
          <?php echo $message; ?>
        </p>
      </div>
      <div class="guestbook-cleaner">&nbsp;</div>
      <div class="guestbook-entry-footer metadata"></div>
    </li>
  </ul>
  <div class="guestbook-toolbar clearfix">
    <a href="#" class="new-button" id="guestbook-form-continue"><b>Continue editing</b><i></i></a>
    <a href="#" class="new-button" id="guestbook-form-post"><b>Add entry</b><i></i></a>
  </div>