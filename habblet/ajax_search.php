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

$search = isset($_POST['searchString']) ? FilterText($_POST['searchString']) : '';
$page = isset($_POST['pageNumber']) ? (int) $_POST['pageNumber'] : 1;

if(!empty($search)) {
  $sql = mysqli_query($connection, "SELECT name, figure, id, lastvisit FROM users WHERE name LIKE '%{$search}%' ORDER BY name ASC");
  $count = mysqli_num_rows($sql);
  $pages = ceil($count / 10);
  $limit = 10;
  $offset = $page - 1;
  $offset = $offset * 10;
  $sql = mysqli_query($connection, "SELECT name, figure, id, lastvisit FROM users WHERE name LIKE '%{$search}%' ORDER BY name ASC LIMIT {$limit} OFFSET {$offset}");
  if(mysqli_num_rows($sql) > 0) {
?>
<ul class="habblet-list">
  <?php
    while($row = mysqli_fetch_assoc($sql)) {
      $i++;
      $even = (IsEven($i)) ? 'odd' : 'even';
  ?>
  <li class="<?php echo $even; ?> offline" homeurl="<?php echo $path; ?>user_profile.php?tag=<?php echo $row['name']; ?>" style="background-image: url(http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $row['figure']; ?>&direction=2&head_direction=2&gesture=sml&size=s)">
    <div class="item">
      <b><?php echo $row['name']; ?></b><br />
    </div>
    <div class="lastlogin">
      <b>Last visit</b><br />
      <span title="<?php echo $row['lastvisit']; ?>"><?php echo $row['lastvisit']; ?></span>
    </div>
    <div class="tools">
      <a href="#" class="add" avatarid="<?php echo $row['id']; ?>" title="Send friend request"></a>
    </div>
    <div class="clear"></div>
  </li>
  <?php } ?>
  <div id="habblet-paging-avatar-habblet-list-container">
    <p id="avatar-habblet-list-container-list-paging" class="paging-navigation">
      <?php if($page > 1) { ?>
      <a href="#" class="avatar-habblet-list-container-list-paging-link" id="avatar-habblet-list-container-list-previous">&laquo;</a>
      <?php } else { ?>
      <span class="disabled">&laquo;</span>
      <?php
      }

      $i = 0;
      $n = $pages;
      while ($i != $n) {
        $i++;
        if($i < $page + 8) {
          if($i == $page) {
      ?>
      <span class="current"><?php echo $i; ?></span>
      <?php
          } else {
            if($i + 4 >= $page && $page + 4 >= $i) {
      ?>
      <a href="#" class="avatar-habblet-list-container-list-paging-link" id="avatar-habblet-list-container-list-page-<?php echo $i; ?>"><?php echo $i; ?></a>
      <?php
            }
          }
        }
      }
      
      if($page < $pages) {
      ?>
      <a href="#" class="avatar-habblet-list-container-list-paging-link" id="avatar-habblet-list-container-list-next">&raquo;</a>
      <?php } else { ?>
      <span class="disabled">&raquo;</span>
      <?php } ?>
    </p>
    <input type="hidden" id="avatar-habblet-list-container-pageNumber" value="<?php echo $page; ?>" />
    <input type="hidden" id="avatar-habblet-list-container-totalPages" value="<?php echo $pages; ?>" />
  </div>
    <?php } else { ?>
    <div class="box-content">
      <?php echo $shortname; ?> not found. Please make sure you have typed his or her name correctly and try again.<br />
    </div>
<?php
  }
}
?>