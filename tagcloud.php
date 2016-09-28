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

$sp = (!empty($_GET['sp']) ? FilterText($_GET['sp']) : '');

echo ($sp == 'plain') ? '<div class="habblet box-content">' : '';

  $result = mysqli_query($connection, "SELECT tag, COUNT(id) AS quantity FROM cms_tags GROUP BY tag ORDER BY quantity DESC LIMIT 20") or die(mysql_error($connection));
  $number = mysqli_num_rows($result);

  if($number > 0) {
?>
    <ul class="tag-list">
      <?php
        for($i = 0;($array[$i] = @mysqli_fetch_array($result, MYSQLI_ASSOC)) != ''; $i++) {
          $row[] = $array[$i];
        }
        sort($row);
        $i = -1;
        while($i + 1 != $number) {
          $i++;
          $tag = $row[$i]['tag'];
          $count = $row[$i]['quantity'];
          $tags[$tag] = $count;
        }
          $max_qty = max(array_values($tags));
          $min_qty = min(array_values($tags));
          $spread = $max_qty - $min_qty;
          $spread = ($spread == 0) ? 1 : $spread;
          $step = (200 - 100) / ($spread);
          foreach($tags as $key => $value) {
            $size = 100 + (($value - $min_qty) * $step);
            $size = ceil($size);
      ?>
      <li>
        <a href="<?php echo $path; ?>tags.php?tag=<?php echo strtolower($key); ?>" class="tag" style="font-size: <?php echo $size; ?>%"><?php echo trim(strtolower($key)) ; ?></a>
      </li>
      <?php
          }
      ?>
    </ul>
  <?php } else { ?>
  <div>No tags to display.</div>
  <?php
    }

    if($sp == 'plain') {
  ?>
  <div class="tag-search-form">
    <form name="tag_search_form" action="<?php echo $path; ?>tags.php" class="search-box">
      <input name="tag" id="search_query" value="" class="search-box-query" style="float: left;" type="text">
      <a onclick="$(this).up('form').submit(); return false;" href="#" class="new-button search-icon" style="float: left;"><b><span></span></b><i></i></a>
    </form>
  </div>
  <?php } ?>