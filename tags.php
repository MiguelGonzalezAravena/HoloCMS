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

$pagename = 'Tags';
$pageid = 5;
$body_id = 'tags';
$results = 0;
$tag = isset($_GET['tag']) ? FilterText(strtolower($_GET['tag'])) : '';
$add = isset($_GET['add']) ? FilterText($_GET['add']) : '';

if(!empty($tag)) {
  $query = $tag;
  $add = ($add == 'true') ? true : false;
  $mytags = mysqli_evaluate("SELECT COUNT(*) FROM cms_tags WHERE ownerid = '{$my_id}'");
  if(!empty($query)) {
    $valid_search = true;
    $filter = preg_replace("/[^a-z\d]/i", '', $query);
    $valid_tag = (strlen($query) < 2 || $filter != $query || strlen($query) > 20 || $mytags > 20) ? false : true;
    $check = mysqli_query($connection, "SELECT id FROM cms_tags WHERE ownerid = '{$my_id}' AND tag = '{$query}' LIMIT 1") or die(mysqli_error($connection));
    $tag_count = mysqli_num_rows($check);
    $already_tagged = ($tag_count > 0) ? true : false;
    if($valid_tag && $add && !$already_tagged) {
      mysqli_query($connection, "INSERT INTO cms_tags(tag, ownerid) VALUES('{$query}', '{$my_id}')") or die(mysqli_error($connection));
      $already_tagged = true;
    }
    $get_taggers = mysqli_query($connection, "SELECT ownerid FROM cms_tags WHERE tag LIKE '{$query}' LIMIT 20") or die(mysqli_error($connection));
    $results = mysqli_num_rows($get_taggers);
  } else {
    $valid_search = false;
  }
} else {
  $valid_search = false;
}

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix default">
            <h2 class="title">Tag Cloud</h2>
            <div id="tag-related-habblet-container" class="habblet box-contents">
              <?php require_once(dirname(__FILE__) . '/tagcloud.php'); ?>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
          <div class="cbb clearfix default">
            <h2 class="title">Tag Fight</h2>
            <div id="tag-fight-habblet-container">
              <div class="fight-process" id="fight-process">The fight ... is on ...</div>
              <div id="fightForm" class="fight-form">
                <div class="tag-field-container">
                  First tag<br />
                  <input maxlength="30" type="text" class="tag-input" name="tag1" id="tag1" />
                </div>
                <div class="tag-field-container">
                  Second tag<br />
                  <input maxlength="30" type="text" class="tag-input" name="tag2" id="tag2" />
                </div>
              </div>
              <div id="fightResults" class="fight-results">
                <div class="fight-image">
                  <img src="<?php echo $web_gallery; ?>images/tagfight/tagfight_start.gif" alt="" name="fightanimation" id="fightanimation" />
                  <a id="tag-fight-button" href="#" class="new-button" onclick="TagFight.init(); return false;"><b>Fight!</b><i></i></a>
                </div>
              </div>
              <div class="tagfight-preload">
                <img src="<?php echo $web_gallery; ?>images/tagfight/tagfight_end_0.gif" width="1" height="1" />
                <img src="<?php echo $web_gallery; ?>images/tagfight/tagfight_end_1.gif" width="1" height="1" />
                <img src="<?php echo $web_gallery; ?>images/tagfight/tagfight_end_2.gif" width="1" height="1" />
                <img src="<?php echo $web_gallery; ?>images/tagfight/tagfight_loop.gif" width="1" height="1" />
                <img src="<?php echo $web_gallery; ?>images/tagfight/tagfight_start.gif" width="1" height="1" />
              </div>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <div id="column2" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix default">
            <h2 class="title">Find others with the same interests <?php echo ($valid_search ? '(' . $results . ')' : ''); ?></h2>
            <div id="tag-search-habblet-container">
              <form name="tag_search_form" action="<?php echo $path; ?>tags.php" class="search-box">
                <input type="text" name="tag" id="search_query" value="<?php echo (!empty($query) ? HoloText($query) : ''); ?>" class="search-box-query" style="float: left" />
                <a onclick="$(this).up('form').submit(); return false;" href="#" class="new-button search-icon" style="float: left"><b><span></span></b><i></i></a>
              </form>
              <?php echo ($results > 0 ? '<br /><p class="search-result-count">&nbsp;1 - ' . $results . ' / ' . $results . '</p>' : '<p class="search-result-count">No results</p>'); ?>
              <?php echo ($valid_search && $logged_in && $valid_tag && !$already_tagged ? '<p id="tag-search-add" class="clearfix"><span style="float:left">Tag yourself with:</span><a id="tag-search-tag-add" href="' . $path . 'tags.php?tag=' . $query . '&add=true" class="new-button" style="float:left"><b>' . $query . '</b><i></i></a></p>' : ''); ?>
              <p class="search-result-divider"></p>
              <table border="0" cellpadding="0" cellspacing="0" width="100%" class="search-result">
                <tbody>
                  <?php
                    $count = 0;
                    if($valid_search == true && $results > 0) {
                      while($tmp = mysqli_fetch_assoc($get_taggers)) {
                        $check = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$tmp['ownerid']}' ORDER BY name ASC LIMIT 1") or die(mysqli_error($connection));
                        $exists = mysqli_num_rows($check);
                        if($exists > 0) {
                          $count++;
                          $userdata = mysqli_fetch_assoc($check);
                          $oddeven = (IsEven($count)) ? 'even' : 'odd';
                  ?>
                  <tr class="<?php echo $oddeven; ?>">
                    <td class="image" style="width:39px;">
                      <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userdata['figure']; ?>&size=s&direction=4&head_direction=4&gesture=sml" alt="<?php echo $userdata['name']; ?>" align="left"/>
                    </td>
                    <td class="text">
                      <a href="user_profile.php?name=<?php echo $userdata['name']; ?>" class="result-title"><?php echo $userdata['name']; ?></a><br/>
                      <span class="result-description"><?php echo HoloText($userdata['mission']); ?></span>
                      <ul class="tag-list">
                        <?php
                          $get_tags = mysqli_query($connection, "SELECT tag FROM cms_tags WHERE ownerid = '{$userdata['id']}'") or die(mysqli_error($connection));
                          while($tag = mysqli_fetch_assoc($get_tags)) {
                        ?>
                        <li>
                          <a href="<?php echo $path; ?>tags.php?tag=<?php echo strtolower($tag['tag']); ?>" class="tag" style="font-size:10px"><?php echo strtolower($tag['tag']); ?></a>
                        </li>
                        <?php } ?>
                      </ul>
                    </td>
                  </tr>
                  <?php
                        }
                      }
                    }
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <script type="text/javascript">
        HabboView.run();
      </script>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>