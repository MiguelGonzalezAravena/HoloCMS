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

if($bypass1 == true) {
  $page = 1;
  $widgetid = 0;
} else {
  $page = isset($_POST['pageNumber']) ? (int) $_POST['pageNumber'] : 1;
  $widgetid = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;
}

$sql = mysqli_query($connection, "SELECT userid FROM cms_homes_stickers WHERE id = '{$widgetid}' LIMIT 1");
$rrow1 = mysqli_fetch_assoc($sql);
$user = $rrow1['userid'];
$offset = $page - 1;
$offset = $offset * 16;
$sql = mysqli_query($connection, "SELECT * FROM users_badges WHERE userid = '{$user}' ORDER BY iscurrent DESC LIMIT 16 OFFSET {$offset}");
?>
  <ul class="clearfix">
    <?php while($rrow = mysqli_fetch_assoc($sql)) { ?>
    <li style="background-image: url(<?php echo $cimagesurl . $badgesurl . $rrow['badgeid'] . '.gif'; ?>)"></li>
    <?php } ?>
  </ul>
  <div id="badge-list-paging">
    <?php
      $sql = mysqli_query($connection, "SELECT * FROM users_badges WHERE userid = '{$user}' ORDER BY iscurrent DESC");
      $count = mysqli_num_rows($sql);
      $offset = $offset * 2;
      $at = $page - 1;
      $at = $at * 16;
      $at = $at + 1;
      $to = $offset + 16;
      $to = ($to > $count) ? $count : $to;
      $totalpages = ceil($count / 16);
      echo $at;
    ?>
     - <?php echo $to; ?> / <?php echo $count; ?><br />
    <?php if($page != 1) { ?>
    <a href="#" id="badge-list-search-first">First</a> |
    <a href="#" id="badge-list-search-previous">&lt;&lt;</a> |
    <?php } else { ?>
    First | &lt;&lt; |
    <?php
      }

      if($page != $totalpages) {
    ?>
    <a href="#" id="badge-list-search-next">&gt;&gt;</a> |
    <a href="#" id="badge-list-search-last">Last</a>
    <?php } else { ?>
    &gt;&gt; | Last
    <?php } ?>
    <input type="hidden" id="badgeListPageNumber" value="<?php echo $page; ?>" />
    <input type="hidden" id="badgeListTotalPages" value="<?php echo $totalpages; ?>" />
  </div>