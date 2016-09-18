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

// simple check to avoid most direct access
$refer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
$pos = strrpos($refer, 'group_profile.php');
($pos == false) ? exit : '';

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
(empty($groupid)) ? exit : '';

$check = mysqli_query($connection, "SELECT member_rank FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank > 1 AND is_pending = '0' LIMIT 1") or die(mysqli_error($connection));
$is_member = mysqli_num_rows($check);

if($is_member > 0) {
  $my_membership = mysqli_fetch_assoc($check);
  $member_rank = $my_membership['member_rank'];
} else {
  exit;
}

$check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
$valid = mysqli_num_rows($check);

if($valid > 0) {
  $groupdata = mysqli_fetch_assoc($check);
  $ownerid = $groupdata['ownerid'];
} else {
  exit;
}
($ownerid != $my_id) ? exit : '';
?>
  <form action="#" method="post" id="group-settings-form">
    <div id="group-settings">
      <div id="group-settings-data" class="group-settings-pane">
        <div id="group-logo">
          <img src="./habbo-imaging/badge-fill/<?php echo $groupdata['badge']; ?>.gif" />
        </div>
        <div id="group-identity-area">
          <div id="group-name-area">
            <div id="group_name_message_error" class="error"></div>
            <label for="group_name" id="group_name_text">Edit group name:</label>
            <input type="text" name="group_name" id="group_name" onKeyUp="GroupUtils.validateGroupElements('group_name', 25, 'Maximum Group name length reached');" value="<?php echo HoloText($groupdata['name']); ?>" />
            <br />
          </div>
          <div id="group-url-area">
            <div id="group_url_message_error" class="error"></div>
            <label for="group_url" id="group_url_text"></label>
            <br/>
            <?php /* <span id="group_url_text"><a href="group_profile.php?id=<?php echo $groupid; ?>ddsa">group_profile.php?id=
              <?php echo $groupid; ?>
                </a>
                </span>
                <br/> */ ?>
                <input type="hidden" name="group_url" id="group_url" value="system" />
                <input type="hidden" name="group_url_edited" id="group_url_edited" value="0" />
          </div>
        </div>
        <div id="group-description-area">
          <div id="group_description_message_error" class="error"></div>
          <label for="group_description" id="description_text">Edit text:</label>
          <span id="description_chars_left">
          <label for="characters_left">Characters left:</label>
          <input id="group_description-counter" type="text" value="<?php echo 255 - strlen(HoloText($groupdata['description'])); ?>" size="3" readonly="readonly" class="amount" />
      </span>
          <textarea name="group_description" id="group_description" onKeyUp="GroupUtils.validateGroupElements('group_description', 255, 'Description limit reached');"><?php echo HoloText($groupdata['description']); ?></textarea>
        </div>
      </div>
      <div id="group-settings-type" class="group-settings-pane group-settings-selection">
        <label for="group_type">Edit Group type:</label>
        <input type="radio" name="group_type" id="group_type" value="0"<?php echo ($groupdata[ 'type'] == 0 ? ' checked' : ($groupdata[ 'type'] == 3 ? ' disabled' : '')); ?> />
          <div class="description">
            <div class="group-type-normal">Regular</div>
            <p>Anyone can join. 500 members limit.</p>
          </div>
          <input type="radio" name="group_type" id="group_type" value="1"<?php echo ($groupdata[ 'type'] == 1 ? ' checked' : ($groupdata[ 'type'] == 3 ? ' disabled' : '')); ?> />
          <div class="description">
            <div class="group-type-exclusive">Exclusive</div>
            <p>Group Admin controls who can join.</p>
          </div>
          <input type="radio" name="group_type" id="group_type" value="2"<?php echo ($groupdata[ 'type'] == 2 ? ' checked' : ($groupdata[ 'type'] == 3 ? ' disabled' : '')); ?> />
          <div class="description">
            <div class="group-type-private">Private</div>
            <p>No one can join.</p>
          </div>
          <input type="radio" name="group_type" id="group_type" value="3"<?php echo ($groupdata[ 'type'] == 3 ? ' checked' : ($groupdata[ 'type'] == 3 ? ' disabled' : '')); ?> />
          <div class="description">
            <div class="group-type-large">Unlimited</div>
            <p>Anyone can join. No membership limit. Unable to browse members.</p>
            <p class="description-note">Note: If you choose the option 'unlimited' you will not be able to change the type later!</p>
          </div>
          <input type="hidden" id="initial_group_type" value="<?php echo $groupdata['type']; ?>">
      </div>
    </div>
    <div id="forum-settings" style="display: none;">
      <div id="forum-settings-type" class="group-settings-pane group-settings-selection">
        <label for="forum_type">Edit Forum type:</label>
        <input type="radio" name="forum_type" id="forum_type" value="0"<?php echo ($groupdata['pane'] == 0 ? ' checked' : ''); ?> />
        <div class="description">
          Public
          <br />
          <p>Anyone can read forum posts.</p>
        </div>
        <input type="radio" name="forum_type" id="forum_type" value="1"<?php echo ($groupdata['pane'] == 1 ? ' checked' : ''); ?> />
        <div class="description">
          Private
          <br />
          <p>Only group members can read forum posts.</p>
        </div>
      </div>
      <div id="forum-settings-topics" class="group-settings-pane group-settings-selection">
        <label for="new_topic_permission">Edit New threads:</label>
        <input type="radio" name="new_topic_permission" id="new_topic_permission" value="2"<?php echo ($groupdata['topics'] == 2 ? ' checked' : ''); ?> />
        <div class="description">
          Admin<br />
          <p>Only Admins can start new threads.</p>
        </div>
        <input type="radio" name="new_topic_permission" id="new_topic_permission" value="1"<?php echo ($groupdata['topics'] == 1 ? ' checked' : ''); ?> />
        <div class="description">
          Members<br />
          <p>Only group members can start new threads.</p>
        </div>
        <input type="radio" name="new_topic_permission" id="new_topic_permission" value="0"<?php echo ($groupdata['topics'] == 0 ? ' checked' : ''); ?> />
        <div class="description">
          Everyonebr <br />
          <p>Anyone can start a new thread.</p>
        </div>
      </div>
    </div>
    <div id="room-settings" style="display: none;">
      <?php
        $sql = mysqli_query($connection, "SELECT id, name, description FROM rooms WHERE owner = '{$rawname}'");
        $row = mysqli_fetch_assoc($sql);
        $groupdetails = mysqli_query($connection, "SELECT * FROM groups_details WHERE roomid = '{$row['id']}' AND id = '{$groupid}' LIMIT 1");
        $group = mysqli_fetch_assoc($groupdetails);
      ?>
      <label>Select a room for your group:</label>
      <div id="room-settings-id" class="group-settings-pane-wide group-settings-selection">
        <ul>
          <li>
            <input type="radio" name="roomId" value=""<?php echo ($group['roomid'] == 0 ? ' checked' : ''); ?> />
            <div>No room</div>
          </li>
          <?php
            while($row = mysqli_fetch_assoc($sql)) {
              $i++;
              $even = (IsEven($i)) ? 'even' : 'odd';
          ?>
          <li class="<?php echo $even; ?>">
            <input type="radio" name="roomId" value="<?php echo $row['id']; ?>"<?php echo ($group['roomid'] == $row['id'] ? ' checked' : ''); ?> /><a href="client.php?forwardId=2&roomId=<?php echo $row['id']; ?>" onclick="HabboClient.roomForward(this, '<?php echo $row['id']; ?>', 'private'); return false;" target="client" class="room-enter">Go to room!</a>
            <div>
              <?php echo HoloText($row['name']) . (empty($row['name']) ? '&nbsp;' : ''); ?><br />
              <span class="room-description"><?php echo HoloText($row['description']) . (empty($row['description']) ? '&nbsp;' : ''); ?></span>
            </div>
          </li>
          <?php } ?>
        </ul>
      </div>
    </div>
    <div id="group-button-area">
      <a href="#" id="group-settings-update-button" class="new-button" onclick="showGroupSettingsConfirmation('<?php echo $groupid; ?>');">
        <b>Save changes</b><i></i>
      </a>
      <a id="group-delete-button" href="#" class="new-button red-button" onclick="openGroupActionDialog('groups_confirm_delete_group.php', 'groups_delete_group.php', null , '<?php echo $groupid; ?>', null);">
        <b>Delete group</b><i></i>
      </a>
      <a href="#" id="group-settings-close-button" class="new-button" onclick="closeGroupSettings(); return false;"><b>Cancel</b><i></i></a>
    </div>
  </form>
  <div class="clear"></div>
  <script type="text/javascript" language="JavaScript">
    L10N.put('group.settings.title.text', 'Edit Group Settings');
    L10N.put('group.settings.group_type_change_warning.normal', 'Are you sure you want to change the group type to <strong>normal</strong>?');
    L10N.put('group.settings.group_type_change_warning.exclusive', 'Are you sure you want to change the group type to <strong>exclusive</strong>?');
    L10N.put('group.settings.group_type_change_warning.closed', 'Are you sure you want to change the group type to <strong>private</strong>?');
    L10N.put('group.settings.group_type_change_warning.large', 'Are you sure you want to change the group type to <strong>large</strong>? If you continue you can\'t change it back later!');
    L10N.put('myhabbo.groups.confirmation_ok', 'OK');
    L10N.put('myhabbo.groups.confirmation_cancel', 'Cancel');
    switchGroupSettingsTab(null, 'group');
  </script>