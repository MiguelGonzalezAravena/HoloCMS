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

$ownerid = isset($_POST['ownerId']) ? (int) $_POST['ownerId'] : 0;
$widgetid = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;
$message = isset($_POST['message']) ? FilterText($_POST['message']) : '';
mysqli_query($connection, "INSERT INTO cms_guestbook(message, time, widget_id, userid) VALUES('{$message}', '{$date_full}', '{$widgetid}', '{$my_id}')");
$row = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM cms_guestbook WHERE userid = '{$my_id}' ORDER BY id DESC LIMIT 1"));
$userrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['userid']}'"));
?>
  <li id="guestbook-entry-<?php echo $row['id']; ?>" class="guestbook-entry">
    <div class="guestbook-author">
      <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userrow['figure']; ?>&direction=2&head_direction=2&gesture=sml&size=s" alt="<?php echo $userrow['name'] ?>" title="<?php echo $userrow['name'] ?>" />
    </div>
    <div class="guestbook-actions">
      <img src="<?php echo $web_gallery; ?>images/myhabbo/buttons/delete_entry_button.gif" id="gbentry-delete-<?php echo $row['id']; ?>" class="gbentry-delete" style="cursor:pointer" alt="" />
      <br/>
    </div>
    <div class="guestbook-message">
      <div class="online">
        <a href="<?php echo $path; ?>user_profile.php?id=<?php echo $userrow['id']; ?>">
          <?php echo $userrow['name']; ?>
        </a>
      </div>
      <p>
        <?php echo HoloText($row['message'], true); ?>
      </p>
    </div>
    <div class="guestbook-cleaner">&nbsp;</div>
    <div class="guestbook-entry-footer metadata">
      <?php echo $row['time']; ?>
    </div>
  </li>