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
  ($member_rank < 2) ? exit : '';
} else {
  exit;
}

$check = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1") or die(mysqli_error($connection));
$valid = mysqli_num_rows($check);

if($valid > 0) {
  $groupdata = mysqli_fetch_assoc($check);
} else {
  exit;
}
?>
<div id="badge-editor-flash" align="center">
<strong>Flash is required to use this tool</strong>
</div>
<script type="text/javascript" language="JavaScript">
  var swfobj = new SWFObject('<?php echo $web_gallery; ?>flash/BadgeEditor.swf', 'badgeEditor', '280', '366', '8');
  swfobj.addParam('base', '<?php echo $web_gallery; ?>flash/');
  swfobj.addParam('bgcolor', '#FFFFFF');
  swfobj.addVariable('post_url', '<?php echo $path; ?>save_group_badge.php');
  swfobj.addVariable('__app_key', 'HoloCMS');
  swfobj.addVariable('groupId', '<?php echo $groupid; ?>');
  swfobj.addVariable('badge_data', '<?php echo $groupdata['badge']; ?>');
  swfobj.addVariable('localization_url', '<?php echo $path; ?>xml/badge_editor.xml');
  swfobj.addVariable('xml_url', '<?php echo $path; ?>xml/badge_data_xml.xml');
  swfobj.addParam('allowScriptAccess', 'always');
  swfobj.write('badge-editor-flash');
</script>