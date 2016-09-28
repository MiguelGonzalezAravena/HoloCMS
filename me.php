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
require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');
require_once(dirname(__FILE__) . '/includes/news_headlines.php');

$do = (!empty($_GET['do'])) ? FilterText($_GET['do']) : '';
$key = (!empty($_GET['key'])) ? (int) $_GET['key'] : '';

if($do == 'RemoveFeedItem' && !empty($key)) { // ex. me.php?do=RemoveFeedItem&key=5
  mysqli_query($connection, "DELETE FROM cms_alerts WHERE userid = '{$my_id}' AND id = '{$key}' ORDER BY id ASC LIMIT 1") or die(mysqli_error($connection));
}

$pagename = $name;
$pageid = 1;

// Header for minimail
$messages = mysqli_query($connection, "SELECT COUNT(*) FROM cms_minimail WHERE to_id = '{$my_id}'") or $messages = 0;
//header("X-JSON: {\"totalMessages\":{$messages}}");

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');

// Query tags
$fetch_tags = mysqli_query($connection, "SELECT tag,id FROM cms_tags WHERE ownerid = '{$my_id}' LIMIT 20") or die(mysqli_error($connection));
$tags_num = mysqli_num_rows($fetch_tags);

  // Create the random tag questions array
  $randomq[] = "What is your favourite TV show?";
  $randomq[] = "Who is your favourite actor?";
  $randomq[] = "Who is your favourite actress?";
  $randomq[] = "Do you have a nickname?";
  $randomq[] = "What is your favorite song?";
  $randomq[] = "How do you describe yourself?";
  $randomq[] = "What is your favorite band?";
  $randomq[] = "What is your favorite comic?";
  $randomq[] = "What are you like?";
  $randomq[] = "What is your favorite food?";
  $randomq[] = "What sport you play?";
  $randomq[] = "Who was your first love?";
  $randomq[] = "What is your favorite movie?";
  $randomq[] = "Cats, dogs, or something more exotic?";
  $randomq[] = "What is your favorite color?";
  // Add new questions below this line
  $randomq[] = "Do you have a favorite staff member?";

// Select a random question from the array above
srand ((double) microtime() * 1000000);
$chosen = rand(0, count($randomq)-1);

// Appoint the variable
$tag_question = $randomq[$chosen];
$wide_enabled = (getContent('client-widescreen') == 1) ? true : false;
?>
  <div id="container">
    <div id="content">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div id="new-personal-info" style="background-image:url(<?php echo $web_gallery; ?>v2/images/personal_info/hotel_views/htlview_br.png)" />
            <div id="enter-hotel">
              <?php if($online == 'online') { ?>
                <div class="open">
                  <a href="<?php echo $path; ?>client.php<?php echo ($wide_enabled == false ? '?wide=false' : ''); ?>" target="client" onclick="openOrFocusHabbo(this); return false;">Enter <?php echo $shortname; ?><i></i></a>
                  <b></b>
                </div>
                <?php } else { ?>
                <div class="closed">
                  <span>Hotel Offline</span>
                  <b></b>
                </div>
                <?php } ?>
            </div>
            <div id="habbo-plate">
              <a href="<?php echo $path; ?>account.php?tab=1">
                <img alt="<?php echo $name; ?>" src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $myrow['figure']; ?>&size=b&direction=3&head_direction=3&gesture=sml" width="64" height="110" />
              </a>
            </div>
            <div id="habbo-info">
              <div id="motto-container" class="clearfix">
                <strong><?php echo $name; ?>:</strong>
                <div>
                  <span title="Click to enter your motto/ status"><?php if(!empty($myrow['mission'])) { echo HoloText($myrow['mission']); } else { echo "Click here to enter your motto"; } ?></span>
                  <p style="display: none">
                    <input type="text" length="30" name="motto" value="<?php echo HoloText($myrow['mission']); ?>" />
                  </p>
                </div>
              </div>
              <div id="motto-links" style="display: none"><a href="#" id="motto-cancel">Cancel</a></div>
            </div>
            <ul id="link-bar" class="clearfix">
              <li class="change-looks"><a href="<?php echo $path; ?>account.php?tab=1">Change looks &raquo;</a></li>
              <li class="credits">
                <a href="<?php echo $path; ?>credits.php"><?php echo $myrow['credits']; ?></a> credits
              </li>
              <li class="club">
                <a href="<?php echo $path; ?>club.php"><?php echo (!IsHCMember($my_id) ? 'Join ' . $shortname . ' Club &raquo;</a>' : HCDaysLeft($my_id) . '</a> HC days'); ?>
              </li>
            </ul>
            <div id="habbo-feed">
              <ul id="feed-items">
                <?php
                  $sqluser = mysqli_query($connection, "SELECT hc_before FROM users WHERE id = '{$my_id}' LIMIT 1");
                  $user = mysqli_fetch_assoc($sqluser);
                  $sql = mysqli_query($connection, "SELECT * FROM users_club WHERE userid = '{$my_id}' LIMIT 1");
                  if($user['hc_before'] > 0 && mysqli_num_rows($sql) == 0) {
                ?>
                <li id="feed-item-hc-reminder">
                  <a href="#" class="remove-feed-item" id="remove-hc-reminder" title="Remove notification">Remove notification</a>
                  <div>
                    <?php echo (mysqli_num_rows($sql) == 0 ? 'Your ' . $shortname . ' Club is expired. Do you want to extend your ' . $shortname . ' Club?' : ''); ?>
                  </div>
                  <div id="hc-reminder-buttons" class="clearfix">
                    <a href="#" class="new-button" id="hc-reminder-1" title="31 days, 20 Credits"><b>1 month</b><i></i></a>
                    <a href="#" class="new-button" id="hc-reminder-2" title="93 days, 50 Credits"><b>3 months</b><i></i></a>
                    <a href="#" class="new-button" id="hc-reminder-3" title="186 days, 80 Credits"><b>6 months</b><i></i></a>
                  </div>
                </li>
                <script type="text/javascript">
                  L10N.put('subscription.title', '<?php echo $shortname; ?> CLUB');
                </script>
                <?php
                  }

                  if(IsHCMember($my_id)) {
                    if($user['hc_before'] > 0) {
                      if(HCDaysLeft($my_id) < 6) {
                ?>
                <li id="feed-item-hc-reminder">
                  <a href="#" class="remove-feed-item" id="remove-hc-reminder" title="Remove notification">Remove notification</a>
                  <div>
                    Your <?php echo $shortname; ?> Club expires over <?php echo HCDaysLeft($my_id); ?> days. Do you want to extend your <?php echo $shortname; ?> Club?
                  </div>
                  <div id="hc-reminder-buttons" class="clearfix">
                    <a href="#" class="new-button" id="hc-reminder-1" title="31 days, 20 Credits"><b>1 month</b><i></i></a>
                    <a href="#" class="new-button" id="hc-reminder-2" title="93 days, 50 Credits"><b>3 months</b><i></i></a>
                    <a href="#" class="new-button" id="hc-reminder-3" title="186 days, 80 Credits"><b>6 months</b><i></i></a>
                  </div>
                </li>
                <script type="text/javascript">
                  L10N.put('subscription.title', '<?php echo $shortname; ?> CLUB');
                </script>
                <?php
                      }
                    }
                  }

                  if($user_rank > 5) {
                    $alerts = mysqli_evaluate("SELECT COUNT(*) FROM cms_help WHERE picked_up = '0'");
                    if($alerts > 0) {
                ?>
                <li class="small" id="feed-group-discussion">
                  <strong>Staff Message</strong><br />
                  There <?php echo ($alerts == 1 ? 'is' : 'are'); ?>
                  <strong><a href="<?php echo $path; ?>housekeeping/index.php?p=helper" target="_self"><?php echo $alerts; ?></a></strong>
                  non-picked up help quer<?php echo ($alerts > 1 ? 'ies' : 'y'); ?>.
                </li>
                <?php
                    }
                  }

                  $tmp = mysqli_query($connection, "SELECT * FROM cms_alerts WHERE userid = '{$my_id}'") or die(mysqli_error($connection));
                  $alerts = mysqli_num_rows($tmp);
                      if($alerts > 0) {
                          $row = mysqli_fetch_assoc($tmp);
                          $id = $row['id'];
                          $type = $row['type'];
                          if($type == 1) {
                            $heading = 'Notification';
                          } elseif($type == 2) {
                            $heading = 'Message from ' . $shortname . ' Staff';
                          } else {
                            $heading = 'Undefined';
                          }
                          if(mysqli_num_rows($tmp) > 0) {
                ?>
                <li id="feed-item-campaign" class="contributed">
                  <a href="#" class="remove-feed-item" id="remove-feed-item-<?php echo $row['id']; ?>" title="Remove notification">Remove notification</a>
                  <div>
                    <b><?php echo $heading; ?></b><br />
                    <?php echo HoloText($row['alert']); ?>
                  </div>
                </li>
                <?php while($row = mysqli_fetch_assoc($tmp)) { ?>
                <li id="feed-item-campaign" class="contributed">
                  <a href="#" class="remove-feed-item" id="remove-feed-item-<?php echo $row['id']; ?>" title="Remove notification">Remove notification</a>
                  <div>
                    <b><?php echo $heading; ?></b><br />
                    <?php echo HoloText($row['alert']); ?>
                  </div>
                </li>
                <?php
                      }
                    }
                  }

                  $sql = mysqli_query($connection, "SELECT * FROM cms_noobgifts WHERE userid = '{$my_id}' LIMIT 1");
                  if(mysqli_num_rows($sql) > 0) {
                    $row = mysqli_fetch_assoc($sql);
                ?>
                <li id="feed-item-giftqueue" class="contributed">
                  <a href="#" class="remove-feed-item" title="Remove notification">Remove notification</a>
                  <div>
                    A new gift has arrived. This time you received a <?php echo ($row['gift'] == 0 ? 'My first ' . $shortname . ' stool' : ($row['gift'] == 1 ? 'plant' : '')); ?>.
                  </div>
                </li>
                <?php
                  }

                  $dob = $myrow['birth'];
                  $bits = explode('-', $dob);
                  $day = $bits[0];
                  $month2 = $bits[1];
                  $year2 = $bits[2];
                  if($day == $today && $month2 == $month && getContent('birthday-notifications') == 1) {
                    $age = $year - $year2;
                    // If we have haxxorz that bypassed the age check (only javascript validates it), they may be like, what,
                    // one year old, so instead of showing 'happy 1th birthday', we properly show 'happy 1st birthday' etc.
                    if($age == 1 || $age == 21) {
                      $age .= 'st';
                    } elseif($age == 2 || $age == 22) {
                      $age .= 'nd';
                    } elseif($age == 3 || $age = 33) {
                      $age .= 'rd';
                    } else {
                      $age .= 'th';
                    }
                ?>
                <li id="feed-birthday">
                  <div>
                    Happy <?php echo $age; ?> birthday, <?php echo $name; ?>!<br />
                    We hope you have a great day today.
                  </div>
                </li>
                <?php
                  }

                  $sql = mysqli_query($connection, "SELECT * FROM messenger_friendrequests WHERE userid_to = '{$my_id}'");
                  $count = mysqli_num_rows($sql);
                  if($count != 0) {
                ?>
                <li id="feed-notification">
                  You have  <a href="<?php echo $path; ?>client.php" onclick="HabboClient.openOrFocus(this); return false;"> <?php echo $count; ?> friend requests</a> waiting
                </li>
                <?php
                  }

                  /*
                      $onlineCutOff = (time() - 601);
                      $onlineUsers = mysqli_evaluate("SELECT COUNT(*) FROM users WHERE online > {$onlineCutOff}");
                      $get_users = mysqli_query($connection, "SELECT id, name, email, ipaddress_last, hbirth, online FROM users WHERE online > {$onlineCutOff} ORDER BY online DESC LIMIT {$onlineUsers}") or die(mysqli_error($connection));
                      while($row = mysqli_fetch_assoc($get_users)) {
                        $row['ipaddress_last'] = (empty($row['ipaddress_last'])) ? 'No IP Found' : $row['ipaddress_last'];
                    ?>
                    <tr>
                      <td class="tablerow1" align="center"><?php echo $row['id']; ?></td>
                      <td class="tablerow2"><strong><?php echo $row['name']; ?></strong><div class="desctext"><?php echo $row['ipaddress_last']; ?> [<a href="http://who.is/whois-ip/ip-address/<?php echo $row['ipaddress_last']; ?>/" target="_blank">WHOIS</a>]</div></td>
                      <td class="tablerow2" align="center"><a href="mailto:<?php echo $row['email']; ?>"><?php echo $row['email']; ?></a></td>
                      <td class="tablerow2" align="center"><?php echo $row['hbirth']; ?></td>
                      <td class="tablerow2" align="center"><?php echo (time() - $row['online']) . ' seconds ago'; ?></td>
                      <td class="tablerow2" align="center"><a href="index.php?p=edituser&key=<?php echo $row['id']; ?>"><img src="./images/edit.gif" alt="Edit User Data"></a></td>
                    </tr>
                      <?php } ?>
                      <li id="feed-friends">
                        You have <strong>1</strong> friends online
                        <span>Dafor</span>
                      </li>
                  */
                ?>
                <li class="small" id="feed-lastlogin">
                  Last signed in: <?php echo $myrow['lastvisit']; ?>
                </li>
              </ul>
            </div>
            <p class="last"></p>
          </div>
          <script type="text/javascript">
            HabboView.add(function() {
              L10N.put('personal_info.motto_editor.spamming', 'Don\'t spam me, bro!');
              PersonalInfo.init('');
            });
          </script>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <?php /* Minimail */ ?>
        <div class="habblet-container minimail" id="mail">
          <div class="cbb clearfix blue">
            <h2 class="title">My Messages</h2>
            <div id="minimail">
              <div class="minimail-contents">
                <?php
                  $bypass = true;
                  $page = 'inbox';
                  require_once(dirname(__FILE__) . '/minimail/loadMessage.php');
                ?>
              </div>
              <div id="message-compose-wait"></div>
              <form style="display: none" id="message-compose">
                <div>To</div>
                <div id="message-recipients-container" class="input-text" style="width: 426px; margin-bottom: 1em">
                  <input type="text" value="" id="message-recipients" />
                  <div class="autocomplete" id="message-recipients-auto">
                    <div class="default" style="display: none;">Type the name of your friend</div>
                    <ul class="feed" style="display: none;"></ul>
                  </div>
                </div>
                <div>
                  Subject<br />
                  <input type="text" style="margin: 5px 0" id="message-subject" class="message-text" maxlength="100" tabindex="2" />
                </div>
                <div>
                  Message<br />
                  <textarea style="margin: 5px 0" rows="5" cols="10" id="message-body" class="message-text" tabindex="3"></textarea>
                </div>
                <div class="new-buttons clearfix">
                  <a href="#" class="new-button preview"><b>Preview</b><i></i></a>
                  <a href="#" class="new-button send"><b>Send</b><i></i></a>
                </div>
              </form>
            </div>
            <?php
              $sql = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$my_id}' OR friendid = '{$my_id}'") or die(mysqli_error($connection));
              $count = mysqli_num_rows($sql); 
              $sql = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' OR senderid = '{$my_id}'") or die(mysqli_error($connection));
              $mescount = mysqli_num_rows($sql); 
            ?>
            <script type="text/javascript">
              L10N
                .put('minimail.compose', 'Compose').put('minimail.cancel', 'Cancel')
                .put('bbcode.colors.red', 'Red').put('bbcode.colors.orange', 'Orange')
                .put('bbcode.colors.yellow', 'Yellow').put('bbcode.colors.green', 'Green')
                .put('bbcode.colors.cyan', 'Cyan').put('bbcode.colors.blue', 'Blue')
                .put('bbcode.colors.gray', 'Gray').put('bbcode.colors.black', 'Black')
                .put('minimail.empty_body.confirm', 'Are you sure you want to send the message with an empty body?')
                .put('bbcode.colors.label', 'Color').put('linktool.find.label', ' ')
                .put('linktool.scope.habbos', '<?php echo $shortname; ?>s')
                .put('linktool.scope.rooms', 'Rooms')
                .put('linktool.scope.groups', 'Groups').put('minimail.report.title', 'Report message to moderators')
                .put('date.pretty.just_now', 'just now')
                .put('date.pretty.one_minute_ago', '1 minute ago')
                .put('date.pretty.minutes_ago', '{0} minutes ago')
                .put('date.pretty.one_hour_ago', '1 hour ago')
                .put('date.pretty.hours_ago', '{0} hours ago')
                .put('date.pretty.yesterday', 'yesterday')
                .put('date.pretty.days_ago', '{0} days ago')
                .put('date.pretty.one_week_ago', '1 week ago')
                .put('date.pretty.weeks_ago', '{0} weeks ago');
              new MiniMail({
                pageSize: 10,
                total: <?php echo $mescount; ?>,
                friendCount: <?php echo $count; ?>,
                maxRecipients: 50,
                messageMaxLength: 20,
                bodyMaxLength: 4096,
                secondLevel: <?php echo ($count = 0 ? 'true' : 'false'); ?>
              });
            </script>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <?php
          /* Noob Gift ?>
            $sql = mysqli_query($connection, "SELECT noob, gift, roomid, sort FROM users WHERE id = '{$my_id}' LIMIT 1");
            $row = mysqli_query($sql);
            // Calculate time
            $date = mktime(0, 0, 0, $n, $j, $y);
            $timeleft = $date - $time; 
            if($row['noob'] == 0 && $row['gift'] == 0 && $row['roomid'] == 0) {
            ?>
            <script type="text/javascript">
              if(!$(document.body).hasClassName('process-template')) {
                Rounder.init();
              }
            </script>
            <div class="habblet-container" id="roomselection">
              <div class="cbb clearfix rooms">
                <h2 class="title">
                  Select your room!
                  <span class="habblet-close" id="habblet-close-roomselection"></span>
                </h2>
                <div id="roomselection-plp-intro" class="box-content">
                  Hey! You haven't chosen your pre-decorated room, which comes with free furniture! Choose one below:
                </div>
                <ul id="roomselection-plp" class="clearfix">
                  <li class="top">
                    <a class="roomselection-select new-button green-button" href="<?php echo $path; ?>client.php?createRoom=0" target="client" onclick="return RoomSelectionHabblet.create(this, 0);"><b>Select</b><i></i></a>
                  </li>
                  <li class="top">
                    <a class="roomselection-select new-button green-button" href="<?php echo $path; ?>client.php?createRoom=1" target="client" onclick="return RoomSelectionHabblet.create(this, 1);"><b>Select</b><i></i></a>
                  </li>
                  <li class="top">
                    <a class="roomselection-select new-button green-button" href="<?php echo $path; ?>client.php?createRoom=2" target="client" onclick="return RoomSelectionHabblet.create(this, 2);"><b>Select</b><i></i></a>
                  </li>
                  <li class="bottom">
                    <a class="roomselection-select new-button green-button" href="<?php echo $path; ?>client.php?createRoom=3" target="client" onclick="return RoomSelectionHabblet.create(this, 3);"><b>Select</b><i></i></a>
                  </li>
                  <li class="bottom">
                    <a class="roomselection-select new-button green-button" href="<?php echo $path; ?>client.php?createRoom=4" target="client" onclick="return RoomSelectionHabblet.create(this, 4);"><b>Select</b><i></i></a>
                  </li>
                  <li class="bottom">
                    <a class="roomselection-select new-button green-button" href="<?php echo $path; ?>client.php?createRoom=5" target="client" onclick="return RoomSelectionHabblet.create(this, 5);"><b>Select</b><i></i></a>
                  </li>
                </ul>
                <script type="text/javascript">
                  L10N.put('roomselection.hide.title', 'Hide room selection');
                  L10N.put('roomselection.old_user.done', 'And you\'re done! The hotel will now open in a new window and you\'ll be redirected to your room in no time!');
                  HabboView.add(RoomSelectionHabblet.initClosableHabblet);
                </script>
              </div>
            </div>
            <?php } else if($row['noob'] == 1 && $row['roomid'] != 0) { ?>
              <script type="text/javascript">
                if(!$(document.body).hasClassName('process-template')) {
                  Rounder.init();
                }
              </script>
              <div class="habblet-container " id="giftqueue">
                <div class="cbb clearfix rooms">
                  <h2 class="title">
                    Your next gift!
                    <span class="habblet-close" id="habblet-close-giftqueue"></span>
                  </h2>
                  <div class="box-content" id="gift-container">
                    <?php if($row['gift'] < 2) { ?>
                    <div class="gift-img">
                      <?php if($row['gift'] == 0) { ?>
                      <img src="<?php echo $web_gallery; ?>v2/images/welcome/newbie_furni/noob_stool_<?php echo $row['sort']; ?>.png" alt="My first <?php echo $shortname; ?> stool" />
                      <?php } else if($row['gift'] == 1) { ?>
                      <img src="<?php echo $web_gallery; ?>v2/images/welcome/newbie_furni/noob_plant.png" alt="My first <?php echo $shortname; ?> plant">
                      <?php } ?>
                    </div>
                    <div class="gift-content-container">
                      <p class="gift-content">
                        Your next piece of free furniture will be <strong><?php echo ($row['gift'] == 0 ? 'My first  stool' : ($row['gift'] == 1 'plant' : '')); ?></strong>
                      </p>
                      <p>
                        <b>Time left:</b>
                        <span id="gift-countdown"></span>
                      </p>
                      <p class="last">
                        <a class="new-button green-button" href="<?php echo $path; ?>client.php?forwardId=2&roomId=<?php echo $row['roomid']; ?>" target="client" onclick="HabboClient.roomForward(this, '<?php echo $row['roomid']; ?>', 'private'); return false;"><b>Go to your room &gt;&gt;</b><i></i></a>
                      </p>
                      <br style="clear: both" />
                    </div>
                    <script type="text/javascript">
                      L10N.put('time.hours', '{0}h');
                      L10N.put('time.minutes', '{0}min');
                      L10N.put('time.seconds', '{0}s');
                      GiftQueueHabblet.init(<?php echo $timeleft; ?>);
                    </script>
                    <?php } else { ?>
                    <p>
                      How do you get more furniture into Your room?
                    </p>
                    <p>
                      You could buy a set of furniture for just 3 credits including a lamp, mat, and two armchairs. How do you do that?
                    </p>
                    <ul>
                      <li>1. Buy some credits from the <a href="<?php echo $path; ?>credits.php">credits</a> section</li>
                      <li>2. Open the catalogue from the Hotel toolbar (Chair icon)</li>
                      <li>3. Open the deals section</li>
                      <li>4. Pick up the furni set You want</li>
                      <li>5. Thank You for shopping!</li>
                    </ul>
                    <p class="aftergift-img">
                      <img src="<?php echo $web_gallery; ?>v2/images/giftqueue/aftergifts.png" alt="" width="381" height="63" />
                    </p>
                    <p class="last">
                      <a class="new-button green-button" href="client.php?forwardId=2&roomId=<?php echo $row['roomid']; ?>" target="client" onclick="HabboClient.roomForward(this, '<?php echo $row['roomid']; ?>', 'private'); return false;"><b>Go to your room &gt;&gt;</b><i></i></a>
                    </p>
                    <script type="text/javascript">
                      HabboView.add(GiftQueueHabblet.initClosableHabblet);
                    </script>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <?php } ?>
              <script type="text/javascript">
              if (!$(document.body).hasClassName('process-template')) {
                Rounder.init();
              }
              </script>
                <?php */
        ?>
        <?php /*Habbo Search*/ ?>
        <div class="habblet-container">
          <div class="cbb clearfix default">
            <div class="box-tabs-container clearfix">
              <h2><?php echo $shortname; ?>s</h2>
              <ul class="box-tabs">
                <li id="tab-0-4-1"><a href="#">Search <?php echo $shortname; ?>s</a><span class="tab-spacer"></span></li>
                <li id="tab-0-4-2" class="selected"><a href="#">Invite Friends</a><span class="tab-spacer"></span></li>
              </ul>
            </div>
            <div id="tab-0-4-1-content" style="display: none">
              <div class="habblet-content-info">
                <a name="habbo-search">Type in the first characters of the name to search for other <?php echo $shortname; ?>s.</a>
              </div>
              <div id="habbo-search-error-container" style="display: none;">
                <div id="habbo-search-error" class="rounded rounded-red"></div>
              </div>
              <br clear="all" />
              <div id="avatar-habblet-list-search">
                <input type="text" id="avatar-habblet-search-string" />
                <a href="#" id="avatar-habblet-search-button" class="new-button"><b>Search</b><i></i></a>
              </div>
              <br clear="all" />
              <div id="avatar-habblet-content">
                <div id="avatar-habblet-list-container" class="habblet-list-container">
                  <ul class="habblet-list">
                  </ul>
                </div>
                <script type="text/javascript">
                  L10N
                    .put('habblet.search.error.search_string_too_long', 'The search keyword was too long. Maximum length is 30 characters.')
                    .put('habblet.search.error.search_string_too_short', 'The search keyword was too short. 2 characters required.')
                    .put('habblet.search.add_friend.title', 'Add to friend list');
                  new HabboSearchHabblet(2, 30);
                </script>
              </div>
              <script type="text/javascript">
                Rounder.addCorners($('habbo-search-error'), 8, 8);
              </script>
            </div>
            <div id="tab-0-4-2-content">
              <div id="friend-invitation-habblet-container" class="box-content">
                <div style="display: none">
                  <div id="invitation-form" class="clearfix">
                    <textarea name="invitation_message" id="invitation_message" class="invitation-message">Come and hangout with me in <?php echo $shortname; ?>. -  <?php echo $rawname; ?> </textarea>
                    <div id="invitation-email">
                      <div class="invitation-input">
                        1.
                        <input onkeypress="$('invitation_recipient2').enable()" type="text" name="invitation_recipients" id="invitation_recipient1" value="Friend's email address:" class="invitation-input" />
                      </div>
                      <div class="invitation-input">
                        2.
                        <input disabled onkeypress="$('invitation_recipient3').enable()" type="text" name="invitation_recipients" id="invitation_recipient2" value="Friend's email address:" class="invitation-input" />
                      </div>
                      <div class="invitation-input">
                        3.
                        <input disabled type="text" name="invitation_recipients" id="invitation_recipient3" value="Friend's email address:" class="invitation-input" />
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
                  <hr/>
                </div>
                <div id="invitation-link-container">
                  <h3>Enjoy <?php echo $shortname; ?> more with real life friends!</h3>
                  <div class="copytext">
                    <p>
                      Invite your friends to <?php echo $shortname; ?> and earn cool rewards! Send a link to your friend and ask them to register and activate their email. <?php echo ($email_verify_reward != 0 ? 'If they are using ' . $shortname . ' in active way you get rewarded with ' . $reward . ' credits.' : ''); ?>
                    </p>
                  </div>
                  <div class="invitation-buttons clearfix">
                    <a class="new-button" id="getlink-friend-invite-button" href="#"><b>Click for the invitation link!</b><i></i></a>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                L10N
                  .put('invitation.button.invite', 'Invite friend(s)')
                  .put('invitation.form.recipient', 'Friend\'s email address:')
                  .put('invitation.error.message_too_long', 'invitation.error.message_limit');
                  inviteFriendHabblet = new InviteFriendHabblet(500);
                  $('friend-invitation-habblet-container').select('.fielderror .rounded').each(function(el) {
                    Rounder.addCorners(el, 8, 8);
                  });
              </script>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <?php
          /* Events  */
          $res = mysqli_query($connection, "SHOW TABLE STATUS LIKE 'events'") or die(mysqli_error($connection));
          $table_exists = mysqli_num_rows($res) == 1;
          if($table_exists == 1) {
        ?>
        <div class="habblet-container">
          <div class="cbb clearfix darkred">
            <h2 class="title">Events</h2>
            <div id="current-events">
              <div class="category-selector">
                <p>Browse latest events by their category</p>
                <select id="event-category">
                  <option value="1">Parties &amp; Music</option>
                  <option value="2">Trading</option>
                  <option value="3">Games</option>
                  <option value="4"><? echo $shortname; ?> Guides</option>
                  <option value="5">Debates &amp; Discussion</option>
                  <option value="6">Grand Openings</option>
                  <option value="7">Dating</option>
                  <option value="8">Jobs</option>
                  <option value="9">Group Events</option>
                  <option value="10">Performance</option>
                  <option value="11">Help Desk</option>
                </select>
              </div>
              <div id="event-list">
                <ul class="habblet-list">
                  <?php
                    $getem = mysqli_query($connection, "SELECT * FROM events WHERE category = '1'");
                    while ($row = mysqli_fetch_assoc($getem)) {
                      $roomrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM rooms WHERE id = '{$row['roomid']}'"));
                      $userrow = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['userid']}'"));
                      $i++;
                      $even = (IsEven($i)) ? 'odd' : 'even';

                      // Calculate percentage
                      $roomrow['incnt_max'] = ($roomrow['incnt_max'] == 0) ? 1 : $roomrow['incnt_max'];
                      $data[$i] = ($roomrow['incnt_now'] / $roomrow['incnt_max']) * 100;

                      // Base room icon based on this - percantage levels may not be habbolike
                      if($data[$i] == 99 || $data[$i] > 99) {
                        $room_fill = 5;
                      } elseif($data[$i] > 65) {
                        $room_fill = 4;
                      } elseif($data[$i] > 32) {
                        $room_fill = 3;
                      } elseif($data[$i] > 0) {
                        $room_fill = 2;
                      } elseif($data[$i] < 1) {
                        $room_fill = 1;
                      }
                  ?>
                  <li class="<?php echo $even; ?> room-occupancy-<?php echo $room_fill; ?>" roomid="<?php echo $row['roomid']; ?>">
                    <div title="Go to the room where this event is held">
                      <span class="event-name">
                        <a href="<?php echo $path; ?>client.php?forwardId=2&amp;roomId=<?php echo $row['roomid']; ?>" onclick="HabboClient.roomForward(this, '<?php echo $row['roomid']; ?>', 'private'); return false;"><?php echo $row['name']; ?></a>
                      </span>
                      <span class="event-owner">
                         by <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $userrow['name']; ?>"><?php echo $userrow['name']; ?></a>
                      </span>
                      <p>
                        <?php echo $row['description']; ?> (<span class="event-date"><?php echo $row['date']; ?></span>)
                      </p>
                    </div>
                  </li>
                  <?php } ?>
                </ul>
              </div>
            </div>
            <script type="text/javascript">
              document.observe('dom:loaded', function() {
                CurrentRoomEvents.init();
              });
            </script>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <?php } ?>
      </div>
      <script type="text/javascript">
        if(!$(document.body).hasClassName('process-template')) {
          Rounder.init();
        }
      </script>
      <div id="column2" class="column">
        <div class="habblet-container news-promo">
          <div class="cbb clearfix notitle">
            <div id="newspromo">
              <div id="topstories">
                <div class="topstory" style="background-image: url(<?php echo $news_1_topstory; ?>)">
                <h4>
                  Latest news
                  <a href="<?php echo $path; ?>rss.php"><img src="<?php echo $web_gallery; ?>v2/images/holo/feed-icon.gif" alt="" border="0"/></a>
                </h4>
                <h3>
                  <a href="<?php echo $path; ?>news.php?id=<?php echo $news_1_id; ?>"><?php echo $news_1_title; ?></a>
                </h3>
                <p class="summary">
                  <?php echo $news_1_snippet; ?>
                </p>
                <p>
                  <a href="<?php echo $path; ?>news.php?id=<?php echo $news_1_id; ?>">Read more &raquo;</a>
                </p>
              </div>
              <div class="topstory" style="background-image: url(<?php echo $news_2_topstory; ?>); display: none">
                <h4>Latest news</h4>
                <h3>
                  <a href="<?php echo $path; ?>news.php?id=<?php echo $news_2_id; ?>"><?php echo $news_2_title; ?></a>
                </h3>
                <p class="summary">
                  <?php echo $news_2_snippet; ?>
                </p>
                <p>
                  <a href="<?php echo $path; ?>news.php?id=<?php echo $news_2_id; ?>">Read more &raquo;</a>
                </p>
              </div>
            </div>
            <ul class="widelist">
              <li class="even">
                <a href="<?php echo $path; ?>news.php?id=<?php echo $news_3_id; ?>">
                  <?php echo $news_3_title; ?>
                </a>
                <div class="newsitem-date">
                  <?php echo $news_3_date; ?>
                </div>
              </li>
              <li class="odd">
                <a href="<?php echo $path; ?>news.php?id=<?php echo $news_4_id; ?>">
                  <?php echo $news_4_title; ?>
                </a>
                <div class="newsitem-date">
                  <?php echo $news_4_date; ?>
                </div>
              </li>
              <li class="last"><a href="<?php echo $path; ?>news.php">More news &raquo;</a></li>
            </ul>
          </div>
          <script type="text/javascript">
            document.observe('dom:loaded', function() {
              NewsPromo.init();
            });
          </script>
        </div>
      </div>
      <?php /* Recommend Groups  */?>
      <div class="habblet-container">
        <div class="cbb clearfix blue">
          <h2 class="title">Recommended</h2>
          <div id="promogroups-habblet-list-container" class="habblet-list-container groups-list">
            <ul class="habblet-list two-cols clearfix">
              <?php
                $sql = mysqli_query($connection, "SELECT * FROM cms_recommended WHERE type = 'group' ORDER BY id ASC") or die(mysqli_error($connection));
                while($row = mysqli_fetch_assoc($sql)) {
                  $i++;
                  $groupsql = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$row['rec_id']}' LIMIT 1");
                  $grouprow = mysqli_fetch_assoc($groupsql);
                  $even = (IsEven($i)) ? 'even left' : 'even right';
              ?>
              <li class="<?php echo $even; ?>" style="background-image: url(<?php echo $path; ?>habbo-imaging/badge-fill/<?php echo $grouprow['badge']; ?>.gif)">
                <?php echo ($grouprow['roomid'] != 0 ? ' <a href="' . $path . 'client.php?forwardId=2&amp;roomId=' . $grouprow['roomid'] . '" onclick="HabboClient.roomForward(this, \'' . $grouprow['roomid'] . '\', \'private\'); return false;" target="client" class="group-room"></a>' : ''); ?>
                <a class="item" href="<?php echo $path; ?>group_profile.php?id=<?php echo $grouprow['id']; ?>">
                  <?php echo HoloText($grouprow['name']); ?>
                </a>
              </li>
              <?php } ?>
            </ul>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        if(!$(document.body).hasClassName('process-template')) {
          Rounder.init();
        }
      </script>
      <?php /*Tags */ ?>
      <div class="habblet-container">
        <div class="cbb clearfix green">
          <div class="box-tabs-container clearfix">
            <h2>Tags</h2>
            <ul class="box-tabs">
              <li id="tab-3-1"><a href="#">Others Like...</a><span class="tab-spacer"></span></li>
              <li id="tab-3-2" class="selected"><a href="#">My Tags</a><span class="tab-spacer"></span></li>
            </ul>
          </div>
          <div id="tab-3-1-content" style="display: none">
            <div class="progressbar"><img src="<?php echo $web_gallery; ?>images/progress_bubbles.gif" alt="" width="29" height="6" /></div>
            <a href="<?php echo $path; ?>tagcloud.php?sp=plain" class="tab-ajax"></a>
          </div>
          <div id="tab-3-2-content">
            <div id="my-tag-info" class="habblet-content-info">
              <?php
                if($tags_num > 19) {
                  echo 'Tag limit reached. You need you remove one of your tags before adding another.';
                } else if($tags_num == 0) {
                  echo 'You have no tags. Answer the question below or just add a tag of your choice.';
                } elseif($tags_num < 20) {
                  echo 'You haven\'t used up all your tags yet - add some more!';
                }
              ?>
            </div>
            <div class="box-content">
              <div class="habblet" id="my-tags-list">
                <?php if($tags_num > 0) { ?>
                <ul class="tag-list make-clickable">
                  <?php while($row = mysqli_fetch_assoc($fetch_tags)) { ?>
                  <li>
                    <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row['tag']; ?>" class="tag" style="font-size:10px"><?php echo $row['tag']; ?></a>
                    <a class="tag-remove-link" title="Remove tag" href="#"></a>
                  </li>
                  <?php } ?>
                </ul>
                <?php
                  }

                  if($tags_num < 20) {
                ?>
                <form method="post" action="<?php echo $path; ?>tags_ajax.php?key=add" onsubmit="TagHelper.addFormTagToMe(); return false;">
                  <div class="add-tag-form clearfix">
                    <a class="new-button" href="#" id="add-tag-button" onclick="TagHelper.addFormTagToMe(); return false;"><b>Add tag</b><i></i></a>
                    <input type="text" id="add-tag-input" maxlength="20" style="float: right" />
                    <em class="tag-question"><?php echo $tag_question; ?></em>
                  </div>
                  <div style="clear: both"></div>
                </form>
                <?php } ?>
              </div>
            </div>
            <script type="text/javascript">
              document.observe('dom:loaded', function() {
                TagHelper.setTexts({
                  tagLimitText: 'You\'ve reached the tag limit - delete one of your tags if you want to add a new one.',
                  invalidTagText: 'Invalid tag',
                  buttonText: 'OK'
                });
                TagHelper.init('21063711');
              });
            </script>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        if(!$(document.body).hasClassName('process-template')) {
          Rounder.init();
        }
      </script>
      <?php /* Groups */ ?>
      <div class="habblet-container">
        <div class="cbb clearfix blue">
          <div class="box-tabs-container clearfix">
            <h2>Groups</h2>
            <ul class="box-tabs">
              <li id="tab-2-1"><a href="#">Hot Groups</a><span class="tab-spacer"></span></li>
              <li id="tab-2-2" class="selected"><a href="#">My Groups</a><span class="tab-spacer"></span></li>
            </ul>
          </div>
          <div id="tab-2-1-content" style="display: none">
            <div class="progressbar"><img src="<?php echo $web_gallery; ?>images/progress_bubbles.gif" alt="" width="29" height="6" /></div>
            <a href="<?php echo $path; ?>randomgroups.php?sp=plain" class="tab-ajax"></a>
          </div>
          <div id="tab-2-2-content">
            <div id="groups-habblet-info" class="habblet-content-info">
              View the groups you are in, create your own group, or get some inspiration from the 'Hot Groups'-tab!
            </div>
            <div id="groups-habblet-list-container" class="habblet-list-container groups-list">
              <?php
                $get_em = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}'") or die(mysqli_error($connection));
                $groups = mysqli_num_rows($get_em);
              ?>
              <ul class="habblet-list two-cols clearfix">
                <?php
                  $num = 0;
                  $lefts = 0;
                  $rights = 0;
                  while($row = mysqli_fetch_assoc($get_em)) {
                    $num++;
                    if(IsEven($num)) {
                      $pos = 'right';
                      $rights++;
                    } else {
                      $pos = 'left';
                      $lefts++;
                    }

                    $oddeven = (IsEven($lefts)) ? 'odd' : 'even';
                    $group_id = $row['groupid'];
                    $check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$group_id}' LIMIT 1");
                    $groupdata = mysqli_fetch_assoc($check);
                ?>
                <li class="<?php echo $oddevenM ?> <?php echo $pos; ?>" style="background-image: url(<?php echo $path; ?>habbo-imaging/badge.php?badge=<?php echo $groupdata['badge']; ?>)">
                  <a class="item" href="<?php echo $path; ?>group_profile.php?id=<?php echo $group_id; ?>"><?php echo HoloText($groupdata['name']); ?></a>
                </li>
                <?php
                  }

                  $rights_should_be = $lefts;
                  if($rights !== $rights_should_be) {
                ?>
                <li class="<?php echo $oddeven; ?> right"><div class="item">&nbsp;</div></li>
                <?php } ?>
              </ul>
              <div class="habblet-button-row clearfix"><a class="new-button" id="purchase-group-button" href="#"><b>Create/buy a Group</b><i></i></a></div>
            </div>
            <div id="groups-habblet-group-purchase-button" class="habblet-list-container"></div>
            <script type="text/javascript">
              $('purchase-group-button').observe('click', function(e) {
                Event.stop(e);
                GroupPurchase.open();
              });
            </script>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        if(!$(document.body).hasClassName('process-template')) {
          Rounder.init();
        }
      </script>
      <?php
      /* DISABLED AS HABBO NO LONGER HAS THESE!!! --- Users Online  ?>
      <div class="cbb clearfix white">
        <div class="box-content">
          <p>
            <ul id="feed-items">
              <li id="feed-friends">
                <img src="<?php echo $web_gallery; ?>album1/users_online.PNG" border="0" alt="Server Status" align="left">
                <?php echo ($enable_status_image == 0 || $enable_status_image == 1 & $online == "online" ? '<b>' . $online_count . '</b> users online right now' : $sitename . ' is <b>offline</b>'); ?>
              </li>
              <br />
            </ul>
          </p>
        </div>
      </div>
      <script type="text/javascript">
        if(!$(document.body).hasClassName('process-template')) {
          Rounder.init();
        }
      </script>
      <?php /* Random Rooms ?>
      <div class="habblet-container">
        <div class="cbb clearfix green">
          <div class="box-tabs-container clearfix">
            <h2>Random Rooms</h2>
            <ul class="box-tabs"></ul>
          </div>
          <div id="tab-0-2-content">
            <div id="rooms-habblet-list-container-h105" class="recommendedrooms-lite-habblet-list-container">
              <ul class="habblet-list">
                <?php
                  $i = 0;
                  $getem = mysqli_query($connection, "SELECT * FROM rooms WHERE owner IS NOT NULL ORDER BY RAND() LIMIT 5") or die(mysqli_error($connection));
                  while ($row = mysqli_fetch_assoc($getem)) {
                    if(!empty($row['owner'])) { // Public Rooms (and possibly bugged rooms) have no owner, thus do not display them
                      $i++;
                      $even = (IsEven($i)) ? 'odd' : 'even';

                      // Calculate percentage
                      $row['incnt_max'] = ($row['incnt_max'] == 0) ? 1 : $row['incnt_max'];
                      $data[$i] = ($row['incnt_now'] / $row['incnt_max']) * 100;

                      // Base room icon based on this - percantage levels may not be habbolike
                      if($data[$i] == 99 || $data[$i] > 99) {
                        $room_fill = 5;
                      } elseif($data[$i] > 65) {
                        $room_fill = 4;
                      } elseif($data[$i] > 32) {
                        $room_fill = 3;
                      } elseif($data[$i] > 0) {
                        $room_fill = 2;
                      } elseif($data[$i] < 1) {
                        $room_fill = 1;
                      }
                ?>
                <li class="<?php echo $even; ?>">
                  <span class="clearfix enter-room-link room-occupancy-<?php echo $room_fill; ?>" title="Go to room" roomid="<?php echo $row['id']; ?>">
                    <span class="room-enter">Enter</span>
                    <span class="room-name"><?php echo $row['name']; ?></span>
                    <span class="room-description"><?php echo $row['description']; ?></span>
                    <span class="room-owner">Owner: <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['owner']; ?>"><?php echo $row['owner']; ?></a></span>
                  </span>
                </li>
                <?php
                    }
                  }
                ?>
              </ul>
              <div class="clearfix"></div>
            </div>
            <script type="text/javascript">
              L10N
                .put('show.more', 'Show more rooms')
                .put('show.less', 'Show fewer rooms');
              var roomListHabblet_h105 = new RoomListHabblet('rooms-habblet-list-container-h105', 'room-toggle-more-data-h105', 'room-more-data-h105');
            </script>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        if(!$(document.body).hasClassName('process-template')) {
          Rounder.init();
        }
      </script>
      */
      ?>
    </div>
    <script type="text/javascript">
      HabboView.add(LoginFormUI.init);
    </script>
    <?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>