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

if($bypass == true) {
  $page = 1;
  $search = '';
} else {
  $page = isset($_POST['pageNumber']) ? (int) $_POST['pageNumber'] : 1;
  $widgetid = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;
  $search = isset($_POST['searchString']) ? FilterText($_POST['searchString']) : '';
}

if(empty($search)) {
  $sql = mysqli_query($connection, "SELECT userid FROM cms_homes_stickers WHERE id = '{$widgetid}' LIMIT 1");
  $row1 = mysqli_fetch_assoc($sql);
  $user = $row1['userid'];
  $offset = $page - 1;
  $offset = $offset * 20;
  $sql = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$user}' OR friendid = '{$user}' LIMIT 20 OFFSET {$offset}");
?>
  <div class="avatar-widget-list-container">
    <ul id="avatar-list-list" class="avatar-widget-list">
      <?php
        while($friendrow = mysqli_fetch_assoc($sql)) {
          $friendid = ($friendrow['userid'] == $userid) ? $friendrow['friendid'] : $friendrow['userid'];
          $friend = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$friendid}' LIMIT 1"));
      ?>
      <li id="avatar-list-<?php echo $widgetid; ?>-<?php echo $friendid; ?>" title="<?php echo $friend['name']; ?>">
        <div class="avatar-list-open">
          <a href="#" id="avatar-list-open-link-<?php echo $widgetid; ?>-<?php echo $friendid; ?>" class="avatar-list-open-link"></a>
        </div>
        <div class="avatar-list-avatar">
          <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $friend['figure']; ?>&size=s&direction=2&head_direction=2&gesture=sml" alt="" />
        </div>
        <h4>
          <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $friend['name']; ?>"><?php echo $friend['name']; ?></a>
        </h4>
        <p class="avatar-list-birthday">
          <?php echo $friend['hbirth']; ?>
        </p>
        <p></p>
      </li>
      <?php } ?>
    </ul>
    <div id="avatar-list-info" class="avatar-list-info">
      <div class="avatar-list-info-close-container">
        <a href="#" class="avatar-list-info-close"></a>
      </div>
      <div class="avatar-list-info-container"></div>
    </div>
  </div>
  <div id="avatar-list-paging">
    <?php
      $sql = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$user}' OR friendid = '{$user}'");
      $count = mysqli_num_rows($sql);
      $at = $page - 1;
      $at = $at * 20;
      $at = $at + 1;
      $to = $offset + 20;
      to = ($to > $count) ? $count : $to;
      $totalpages = ceil($count / 20);
      echo $at;
    ?>
    - <?php echo $to; ?> / <?php echo $count; ?><br />
    <?php if($page != 1) { ?>
    <a href="#" class="avatar-list-paging-link" id="avatarlist-search-first">First</a> |
    <a href="#" class="avatar-list-paging-link" id="avatarlist-search-previous">&lt;&lt;</a> |
    <?php } else { ?>
    First | &lt;&lt; |
    <?php
      }

      if($page != $totalpages) {
    ?>
    <a href="#" class="avatar-list-paging-link" id="avatarlist-search-next">&gt;&gt;</a> |
    <a href="#" class="avatar-list-paging-link" id="avatarlist-search-last">Last</a>
    <?php } else { ?>
    &gt;&gt; | Last
    <?php } ?>
    <input type="hidden" id="pageNumber" value="<?php echo $page; ?>" />
    <input type="hidden" id="totalPages" value="<?php echo $totalpages; ?>" />
  </div>
  <?php
    } else {
      $sql = mysqli_query($connection, "SELECT userid FROM cms_homes_stickers WHERE id = '{$widgetid}' LIMIT 1");
      $row1 = mysqli_fetch_assoc($sql);
      $user = $row1['userid'];
      $offset = $page - 1;
      $offset = $offset * 10;
      $sql = mysqli_query($connection, "SELECT u.id, u.name, u.figure, u.hbirth FROM (users AS u, messenger_friendships AS mf) WHERE mf.userid = u.id AND mf.friendid = '{$user}' AND u.name LIKE '%{$search}%' LIMIT 10 OFFSET {$offset}");
      $sql2 = mysqli_query($connection,  "SELECT u.id, u.name, u.figure, u.hbirth FROM (users AS u, messenger_friendships AS mf) WHERE mf.friendid = u.id AND mf.userid = '{$user}' AND u.name LIKE '%{$search}%' LIMIT 10 OFFSET {$offset}");
  ?>
  <div class="avatar-widget-list-container">
    <ul id="avatar-list-list" class="avatar-widget-list">
      <?php while($friendrow = mysqli_fetch_assoc($sql)) { ?>
      <li id="avatar-list-<?php echo $widgetid; ?>-<?php echo $friendrow['id']; ?>" title="<?php echo $friendrow['name']; ?>">
        <div class="avatar-list-open">
          <a href="#" id="avatar-list-open-link-<?php echo $widgetid; ?>-<?php echo $friendrow; ?>" class="avatar-list-open-link"></a>
        </div>
        <div class="avatar-list-avatar">
          <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $friendrow['figure']; ?>&size=s&direction=2&head_direction=2&gesture=sml" alt="" />
        </div>
        <h4>
          <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $friendrow['name']; ?>"><?php echo $friendrow['name']; ?></a>
        </h4>
        <p class="avatar-list-birthday">
          <?php echo $friendrow['hbirth']; ?>
        </p>
        <p></p>
      </li>
      <?php
      }
      while($friendrow = mysqli_fetch_assoc($sql2)) {
      ?>
      <li id="avatar-list-<?php echo $widgetid; ?>-<?php echo $friendrow['id']; ?>" title="<?php echo $friendrow['name']; ?>">
        <div class="avatar-list-open">
          <a href="#" id="avatar-list-open-link-<?php echo $widgetid; ?>-<?php echo $friendrow; ?>" class="avatar-list-open-link"></a>
        </div>
        <div class="avatar-list-avatar">
          <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $friendrow['figure']; ?>&size=s&direction=2&head_direction=2&gesture=sml" alt="" />
        </div>
        <h4>
          <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $friendrow['name']; ?>"><?php echo $friendrow['name']; ?></a>
        </h4>
        <p class="avatar-list-birthday">
          <?php echo $friendrow['hbirth']; ?>
        </p>
        <p></p>
      </li>
      <?php } ?>
      </ul>
      <div id="avatar-list-info" class="avatar-list-info">
        <div class="avatar-list-info-close-container">
          <a href="#" class="avatar-list-info-close"></a>
        </div>
        <div class="avatar-list-info-container"></div>
      </div>
    </div>
    <div id="avatar-list-paging">
      <?php
        $count = mysqli_num_rows($sql) + mysqli_num_rows($sql2);
        $offset = $offset * 2;
        $at = $page - 1;
        $at = $at * 20;
        $at = $at + 1;
        $to = $offset + 20;
        to = ($to > $count) ? $count : $to;
        $totalpages = ceil($count / 20);
        echo $at;
      ?>
       - <?php echo $to; ?> / <?php echo $count; ?><br />
      <?php if($page != 1) { ?>
      <a href="#" class="avatar-list-paging-link" id="avatarlist-search-first">First</a> |
      <a href="#" class="avatar-list-paging-link" id="avatarlist-search-previous">&lt;&lt;</a> |
      <?php } else { ?>
      First | &lt;&lt; |
      <?php
        }

        if($page != $totalpages) {
      ?>
      <a href="#" class="avatar-list-paging-link" id="avatarlist-search-next">&gt;&gt;</a> |
      <a href="#" class="avatar-list-paging-link" id="avatarlist-search-last">Last</a>
      <?php } else { ?>
      &gt;&gt; | Last
      <?php } ?>
      <input type="hidden" id="pageNumber" value="<?php echo $page; ?>" />
      <input type="hidden" id="totalPages" value="<?php echo $totalpages; ?>" />
    </div>
    <?php } ?>