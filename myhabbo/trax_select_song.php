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

$songid = isset($_POST['songId']) ? (int) $_POST['songId'] : 0;
$id = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;

mysqli_query($connection, "UPDATE cms_homes_stickers SET var = '{$songid}' WHERE id = '{$id}'");?>
  <embed type="application/x-shockwave-flash" src="<?php echo $path; ?>web-gallery/flash/traxplayer/traxplayer.swf" name="traxplayer" quality="high" base="<?php echo $path; ?>web-gallery/flash/traxplayer/" allowscriptaccess="always" menu="false" wmode="transparent" flashvars="songUrl=<?php echo $path; ?>myhabbo/trax_song.php?songId=<?php echo $songid; ?>&amp;sampleUrl=http://images.habbohotel.com/dcr/hof_furni//mp3/" height="66" width="210" />