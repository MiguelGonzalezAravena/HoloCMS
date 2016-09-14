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

$id = isset($_POST['messageId']) ? (int) $_POST['messageId'] : 0;

$sql = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE id = '{$id}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);

if($row['senderid'] == $my_id) {
  $error = 1;
  $message = 'You can\'t report your own messages.';
}

if($error == 1) {
?>
  <ul class="error">
    <li>
      <?php echo $message; ?>
    </li>
  </ul>
  <p>
    <a href="#" class="new-button cancel-report"><b>Cancel</b><i></i></a>
  </p>
<?php
} else {
  $sql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['senderid']}' LIMIT 1");
  $senderrow = mysqli_fetch_assoc($sql);
?>
    <p>
      Are you sure you want to report the message <b><?php echo $row['subject']; ?></b> to the moderators and remove <b><?php echo $senderrow['name']; ?></b> from your friend list? You cant undo this.
    </p>
    <p>
      <a href="#" class="new-button cancel-report"><b>Cancel</b><i></i></a>
      <a href="#" class="new-button send-report"><b>Send report</b><i></i></a>
    </p>
<?php } ?>
