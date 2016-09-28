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
$allow_guests = true;

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

(getContent('mod_staff-enabled') != 1) ? header('Location: index.php') : '';

$pagename = 'Staff Team';
$pageid = 8;

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix green">
            <h2 class="title">Staff</h2>
            <div class="habblet box-content">
              <?php
                $getem = mysqli_query($connection, "SELECT name, mission, rank, lastvisit, figure, sex, id FROM users WHERE rank > 4 ORDER BY name") or die(mysqli_error($connection));
                $staff_members = mysqli_num_rows($getem);
                if($staff_members < 1) {
                  echo 'No staff to display yet.';
                } else {
                  while ($row = mysqli_fetch_assoc($getem)) {
                    if($row['rank'] == 7 || $row['rank'] > 7) { // = 7 or higher - Admin
                      $row['rank'] = 'Administrator';
                    } else if($row['rank'] > 5) { // = 6 - Moderator
                      $row['rank'] = 'Moderator';
                    } else if($row['rank'] > 4) { // = 5 - Gold
                      $row['rank'] = 'Gold';
                    } else if($row['rank'] > 3) { // = 4 - Silver
                      $row['rank'] = 'Silver';
                    }
                    $row['mission'] = (empty($row['mission'])) ? 'No motto' : $row['mission'];

                    $badge = GetUserBadge($row['name']);
                    if($badge != false) {
                      $badge = '<img src="' . $cimagesurl . $badgesurl . $badge . '.gif" /></a>';
                    } else {
                      $badge= '';
                    }

                    $groupbadge = GetUserGroupBadge($row['id']);
                    if($groupbadge != false) {
                      $gbadge = '<a href="group_profile.php?id=' . GetUserGroup($row['id']) . '"><img src="' . $path . 'habbo-imaging/badge.php?badge=' . $groupbadge . '"></a>';
                    } else {
                      $gbadge = '';
                    }

                    if(IsUserOnline($row['id'])) {
                      $online_img = 'online_anim';
                      $online_caption = 'Online now!';
                    } else {
                      $online_img = 'offline';
                      $online_caption = 'Offline';
                    }
              ?>
              <p>
                <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $row['figure']; ?>&size=b&direction=2&head_direction=3&gesture=sml&size=s" alt="<?php echo $row['name']; ?>" align="left" />
                <b>
                  <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['name']; ?>"><?php echo $row['name']; ?></a>
                </b>&nbsp;
                <img src="<?php echo $web_gallery; ?>v2/images/habbo_<?php echo $online_img; ?>.gif" title="<?php echo $online_caption; ?>" alt="<?php echo $online_caption; ?>" border="0"><br />
                <i><?php echo HoloText($row['mission']); ?></i><br />
                <br />
                Rank: <?php echo $row['rank']; ?><br />
                Last Visit: <?php echo $row['lastvisit']; ?><br />
                <br />
                <?php echo $badge; ?>&nbsp;
                <?php echo $gbadge; ?><br />
                <br />
              </p>
              <?php
                  }
                }
              ?>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <div id="column2" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix <?php echo getContent('staff1-color'); ?>">
            <h2 class="title"><?php echo HoloText(getContent('staff1-heading')); ?></h2>
            <div id="notfound-looking-for" class="box-content">
              <p>
                <?php echo HoloText(getContent('staff1'), true); ?>
              </p>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
          <div class="cbb clearfix <?php echo HoloText(getContent('staff2-color'), true); ?>">
            <h2 class="title"><?php echo HoloText(getContent('staff2-heading'), true); ?>
              </h2>
            <div id="notfound-looking-for" class="box-content">
              <p>
                <?php echo HoloText(getContent('staff2'), true); ?>
              </p>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>