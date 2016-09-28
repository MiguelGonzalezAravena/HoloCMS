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
require_once(dirname(__FILE__) . '/core.php');

$email = isset($_POST['recipientEmails']) ? FilterText($_POST['recipientEmails']) : '';
$email2 = isset($_POST['recipientEmails']) ? FilterText($_POST['recipientEmails']) : '';
$email3 = isset($_POST['recipientEmails']) ? FilterText($_POST['recipientEmails']) : '';
$message = isset($_POST['message']) ? FilterText($_POST['message']) : '';

$sql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$my_id}'");
$row = mysqli_fetch_assoc($sql);

if($email == $row['email']) {
?>
  <div id="invitation-form" class="clearfix">
    <textarea name="invitation_message" id="invitation_message" class="invitation-message"><?php echo $message; ?></textarea>
    <div id="invitation-email">
      <div class="invitation-input">
        1.
        <input onkeypress="$('invitation_recipient2').enable()" type="text" name="invitation_recipients" id="invitation_recipient1" value="<?php echo $email; ?>" class="invitation-input" />
        <div class="fielderror">
          <div class="rounded">You may not use the same email address as your own!</div>
        </div>
      </div>
      <div class="invitation-input">
        2.
        <input onkeypress="$('invitation_recipient3').enable()" type="text" name="invitation_recipients" id="invitation_recipient2" value="<?php echo $email2; ?>" class="invitation-input" />
      </div>
      <div class="invitation-input">
        3.
        <input disabled type="text" name="invitation_recipients" id="invitation_recipient3" value="<?php echo $email3; ?>" class="invitation-input" />
      </div>
    </div>
    <div class="clear"></div>
    <div class="fielderror" id="invitation_message_error" style="display: none;">
      <div class="rounded"></div>
    </div>
  </div>
  <div class="invitation-buttons clearfix" id="invitation_buttons">
    <a class="new-button" id="send-friend-invite-button" href="#"><b>Invite friend(s)</b><i></i></a>
  </div>
  <script type="text/javascript">
    L10N.put('invitation.button.invite', 'Invite friend(s)');
    L10N.put('invitation.form.recipient', 'Friend\'s email');
    L10N.put('invitation.error.message_too_long', 'invitation.error.message_limit');
    inviteFriendHabblet = new InviteFriendHabblet(500);
    $('friend-invitation-habblet-container').select('.fielderror .rounded').each(function(el) {
      Rounder.addCorners(el, 8, 8);
    });
  </script>
<?php } ?>