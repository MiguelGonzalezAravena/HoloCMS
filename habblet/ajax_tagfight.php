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
$allow_guests = true;

require_once(dirname(__FILE__) . '/../core.php');
require_once(dirname(__FILE__) . '/../includes/session.php');

$tag_1 = isset($_POST['tag1']) ? FilterText($_POST['tag1']) : '';
$tag_2 = isset($_POST['tag2']) ? FilterText($_POST['tag2']) : '';
$tmp = mysqli_query($connection, "SELECT id FROM cms_tags WHERE tag = '{$tag_1}'") or die(mysqli_error($connection));
$tag_1_results = mysqli_num_rows($tmp);
$tmp = mysqli_query($connection, "SELECT id FROM cms_tags WHERE tag = '{$tag_2}'") or die(mysqli_error($connection));
$tag_2_results = mysqli_num_rows($tmp);
(empty($tag_1) || empty($tag_2)) ? exit : '';

if($tag_1_results == $tag_2_results) {
  $end = 0;
} elseif($tag_1_results > $tag_2_results) {
  $tag_1 = '<b>' . $tag_1 . '</b>';
  $end = 2;
} elseif($tag_1_results < $tag_2_results) {
  $tag_2 = '<b>' . $tag_2 . '</b>';
  $end = 1;
}
?>
<div id="fightResultCount" class="fight-result-count">
  <?php echo ($end == 0 ? 'Tie!' : 'The winner is:'); ?><br />
  <?php echo HoloText($tag_1); ?> (<?php echo $tag_1_results; ?>) hits<br/>
  <?php echo HoloText($tag_2); ?> (<?php echo $tag_2_results; ?>) hits
</div>
<div class="fight-image">
  <img src="<?php echo $web_gallery; ?>images/tagfight/tagfight_end_<?php echo $end; ?>.gif" alt="" name="fightanimation" id="fightanimation" />
  <a id="tag-fight-button-new" href="#" class="new-button" onclick="TagFight.newFight(); return false;"><b>Again?</b><i></i></a>
  <a id="tag-fight-button" href="#" style="display:none" class="new-button" onclick="TagFight.init(); return false;"><b>Start</b><i></i></a>
</div>