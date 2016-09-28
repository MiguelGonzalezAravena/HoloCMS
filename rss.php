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
header('Content-type: text/xml');
?>
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" version="2.0">
<channel>
  <title><?php echo $shortname; ?> News</title>
  <link><?php echo $path; ?></link>
  <description>The latest happenings on <?php echo $shortname; ?> direct to your news reader</description>
  <?php
    $data = mysqli_query($connection, "SELECT * FROM cms_news ORDER BY num DESC");
    while($row = mysqli_fetch_array($data)) {
  ?>
  <item>
    <title><?php echo $row['title']; ?></title>
    <link><?php echo $path; ?>news.php?id=<?php echo $row['num']; ?></link>
    <description><?php echo $row['short_story']; ?></description>
    <pubDate><?php echo $row['date']; ?></pubDate>
    <guid isPermaLink="true"><?php echo $path; ?>news.php?id=<?php echo $row['num']; ?></guid>
    <dc:date><?php echo $row['date']; ?></dc:date>
  </item>
  <?php } ?>
</channel>
</rss>