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
  $sql = mysqli_query($connection, "SELECT groupid FROM cms_homes_stickers WHERE id = '{$widgetid}' LIMIT 1");
  $row1 = mysqli_fetch_assoc($sql);
  $groupid = $row1['groupid'];
  $offset = $page - 1;
  $offset = $offset * 20;
  $sql = mysqli_query($connection, "SELECT userid, is_current, member_rank FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '0' ORDER BY member_rank ASC LIMIT 20 OFFSET {$offset}");
?>
  <div class="avatar-widget-list-container">
    <ul id="avatar-list-list" class="avatar-widget-list">
      <?php
        while($membership = mysqli_fetch_assoc($sql)) {
          $userrow = mysqli_query($connection, "SELECT id, name, figure, hbirth FROM users WHERE id = '{$membership['userid']}' LIMIT 1") or die(mysqli_error($connection));
          $found = mysqli_num_rows($userrow);
          $groupdetails = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1"));
          $ownerid = $groupdetails['ownerid'];
          if($found > 0) {
            $userrow = mysqli_fetch_assoc($userrow);
      ?>
        <li id="avatar-list-<?php echo $groupid; ?>-<?php echo $userrow['id']; ?>" title="<?php echo $userrow['name']; ?>">
          <div class="avatar-list-open">
            <a href="#" id="avatar-list-open-link-<?php echo $groupid; ?>-<?php echo $userrow['id']; ?>" class="avatar-list-open-link"></a>
          </div>
          <div class="avatar-list-avatar">
            <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userrow['figure']; ?>&size=s&direction=2&head_direction=2&gesture=sml" alt="" />
          </div>
          <h4>
  <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $userrow['name']; ?>"><?php echo $userrow['name']; ?></a>
</h4>
          <p class="avatar-list-birthday">
            <?php echo $userrow['hbirth']; ?>
          </p>
          <p>
            <?php if($userrow['id'] == $ownerid) { ?>
              <img src="<?php echo $web_gallery; ?>images/groups/owner_icon.gif" alt="" class="avatar-list-groupstatus" />
              <?php } elseif($membership['member_rank'] == 2) { ?>
                <img src="<?php echo $web_gallery; ?>images/groups/administrator_icon.gif" alt="" class="avatar-list-groupstatus" />
                <?php
                  }

                  if($membership['is_current'] == 1) {
                ?>
                  <img src="<?php echo $web_gallery; ?>images/groups/favourite_group_icon.gif" alt="Favorite" class="avatar-list-groupstatus" />
                  <?php } ?>
          </p>
        </li>
        <?php
  }
}
?>
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
      $sql = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '0'");
      $count = mysqli_num_rows($sql);
      $at = $page - 1;
      $at = $at * 20;
      $at = $at + 1;
      $to = $offset + 20;
      $to = ($to > $count) ? $count : $to;
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
      $sql = mysqli_query($connection, "SELECT groupid FROM cms_homes_stickers WHERE id = '{$widgetid}' LIMIT 1");
      $row1 = mysqli_fetch_assoc($sql);
      $groupid = $row1['groupid'];
      $offset = $page - 1;
      $offset = $offset * 20;
      $sql = mysqli_query($connection, "SELECT gm.userid, gm.is_current, gm.member_rank, u.name FROM (groups_memberships AS gm, users AS u) WHERE gm.userid = u.id AND groupid = '44' AND is_pending = '0' AND name LIKE '%{$search}%' ORDER BY member_rank ASC LIMIT 20 OFFSET {$offset}");
  ?>
  <div class="avatar-widget-list-container">
    <ul id="avatar-list-list" class="avatar-widget-list">
      <?php
        while($membership = mysqli_fetch_assoc($sql)) { 
          $userrow = mysqli_query($connection, "SELECT id, name, figure, hbirth FROM users WHERE id = '{$membership['userid']}' LIMIT 1") or die(mysqli_error($connection));
          $found = mysqli_num_rows($userrow);
          
          $groupdetails = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1"));
          $ownerid = $groupdetails['ownerid'];

          if($found > 0) {
            $userrow = mysqli_fetch_assoc($userrow);
      ?>
      <li id="avatar-list-<?php echo $groupid; ?>-<?php echo $userrow['id']; ?>" title="<?php echo $userrow['name']; ?>">
        <div class="avatar-list-open">
          <a href="#" id="avatar-list-open-link-<?php echo $groupid; ?>-<?php echo $userrow['id']; ?>" class="avatar-list-open-link"></a>
        </div>
        <div class="avatar-list-avatar">
          <img src="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $userrow['figure']; ?>&size=s&direction=2&head_direction=2&gesture=sml" alt="" />
        </div>
        <h4>
            <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $userrow['name']; ?>"><?php echo $userrow['name']; ?></a>
        </h4>
        <p class="avatar-list-birthday">
          <?php echo $userrow['hbirth']; ?>
        </p>
        <p>
          <?php if($userrow['id'] == $ownerid) { ?>
          <img src="<?php echo $web_gallery; ?>images/groups/owner_icon.gif" alt="" class="avatar-list-groupstatus" />
          <?php } elseif($membership['member_rank'] == 2) { ?>
          <img src="<?php echo $web_gallery; ?>images/groups/administrator_icon.gif" alt="" class="avatar-list-groupstatus" />
          <?php
            }

            if($membership['is_current'] == 1) {
          ?>
          <img src="<?php echo $web_gallery; ?>images/groups/favourite_group_icon.gif" alt="Favorite" class="avatar-list-groupstatus" />
          <?php } ?>
        </p>
      </li>
      <?php
          }
        }
      ?>
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
      $sql = mysqli_query($connection, "SELECT gm.userid, gm.is_current, gm.member_rank, u.name FROM (groups_memberships AS gm, users AS u) WHERE gm.userid = u.id AND groupid = '44' AND is_pending = '0' AND name LIKE '%{$search}%'");
      $count = mysqli_num_rows($sql);
      $at = $page - 1;
      $at = $at * 20;
      $at = $at + 1;
      $to = $offset + 20;
      $to = ($to > $count) ? $count : $to;
      $totalpages = ceil($count / 20);
      echo $at;
    ?>
     - <?php echo $to; ?> / <?php echo $count; ?> <br />
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