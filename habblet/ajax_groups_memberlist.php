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

$refer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
$pos = strrpos($refer, 'group_profile.php');
($pos == false) ? exit : '';


$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;
$page = isset($_POST['pageNumber']) ? (int) $_POST['pageNumber'] : 0;
$searchString = isset($_POST['searchString']) ? FilterText($_POST['searchString']) : '';
$pending = isset($_POST['pending']) ? FilterText($_POST['pending']) : '';
$pending = ($pending == 'true' ? true : false);
$rights = 0;
$lefts = 0;
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

$members = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '0'") or die(); // There have to be members; die if not
$members_pending = mysqli_evaluate("SELECT COUNT(*) FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '1'");

$pages = ceil($members / 12);
$pages_pending = ceil($members_pending / 12);

if($pending == true) {
  $totalPagesMemberList = $pages_pending;
  $totalMembers = $members_pending;
  if($page < 1 || empty($page) || $page > $pages_pending) {
    $page = 1;
  }
} else {
  $totalPagesMemberList = $pages;
  $totalMembers = $members;
  if($page < 1 || empty($page) || $page > $pages) {
    $page = 1;
  }
}

$queryLimitMin = ($page * 12) - 12;
$queryLimit = $queryLimitMin . ',12';

header('X-JSON: {"pending": "Pending Members (' . $members_pending . ')", "members": "Members (' . $members . ')"}');
?>
  <div id="group-memberlist-members-list">
    <form method="post" action="#" onsubmit="return false;">
      <ul class="habblet-list two-cols clearfix">
        <?php
          $counter = 0;
          if($pending == true) {
            if($members_pending < 1) {
              echo 'There are no pending membership requests at this time. Please check back later.';
            } else {
              $get_memberships = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '1' ORDER BY member_rank DESC LIMIT {$queryLimit}") or die(mysqli_error($connection));
              while($membership = mysqli_fetch_assoc($get_memberships)) {
                if(!is_numeric($membership['userid'])) {
                  exit;
                }
                $get_userdata = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$membership['userid']}' LIMIT 1") or die(mysqli_error($connection));
                $valid_user = mysqli_num_rows($get_userdata);
                if($valid_user > 0) {
                  $counter++;
                  $userdata = mysqli_fetch_assoc($get_userdata);

                  if(IsEven($counter)) {
                    $pos = 'right';
                    $rights++;
                  } else {
                    $pos = 'left';
                    $lefts++;
                  }
                  $oddeven = (IsEven($lefts)) ? 'odd' : 'even';
        ?>
        <li class="<?php echo $oddeven; ?> online <?php echo $pos; ?>">
          <div class="item" style="padding-left: 5px; padding-bottom: 4px;">
            <div style="float: right; width: 16px; height: 16px; margin-top: 1px">
              <?php echo ($membership['userid'] == $groupdata['ownerid'] ? '<img src="' . $web_gallery . 'images/groups/owner_icon.gif" width="15" height="15" alt="Owner" title="Owner" />' : ($membership['member_rank'] > 1 ? '<img src="' . $web_gallery . 'images/groups/administrator_icon.gif" width="15" height="15" alt="Administrator" title="Administrator" />' : '')); ?>
            </div>
            <input id="group-memberlist-m-<?php echo $userdata['id']; ?>" type="checkbox" <?php echo ($membership['userid'] == $groupdata[ 'ownerid'] || $membership['userid'] == $my_id ? ' disabled' : ''); ?> style="margin: 0; padding: 0; vertical-align: middle" />
            <a class="home-page-link" href="<?php echo $path; ?>user_profile.php?name=<?php echo $userdata['name']; ?>"><span><?php echo $userdata['name']; ?></span></a>
          </div>
        </li>
        <?php
        }
      }
    }
  } else {
    if($members < 1) {
      echo 'There are no pending membership requests at this time. Please check back later.';
    } else {
      $get_memberships = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE groupid = '{$groupid}' AND is_pending = '0' ORDER BY member_rank DESC LIMIT {$queryLimit}") or die(mysqli_error($connection));
      while($membership = mysqli_fetch_assoc($get_memberships)) {
        $tinyrank = 'm';
        if(!is_numeric($membership['userid'])) {
          exit;
        }
        $get_userdata = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$membership['userid']}' LIMIT 1") or die(mysqli_error($connection));
        $valid_user = mysqli_num_rows($get_userdata);
        if($valid_user > 0) {
          $counter++;
          $userdata = mysqli_fetch_assoc($get_userdata);
          if(IsEven($counter)) {
            $pos = 'right';
            $rights++;
          } else {
            $pos = 'left';
            $lefts++;
          }

          $oddeven = (IsEven($lefts)) ? 'odd' : 'even';
        ?>
        <li class="<?php echo $oddeven; ?> online <?php echo $pos; ?>">
          <div class="item" style="padding-left: 5px; padding-bottom: 4px;">
            <div style="float: right; width: 16px; height: 16px; margin-top: 1px">
              <?php
                if($membership['userid'] == $groupdata['ownerid']) {
                  $tinyrank = 'a';
                  echo '<img src="' . $web_gallery . 'images/groups/owner_icon.gif" width="15" height="15" alt="Owner" title="Owner" />';
                } elseif($membership['member_rank'] > 1) {
                  $tinyrank = 'a';
                  echo '<img src="' . $web_gallery . 'images/groups/administrator_icon.gif" width="15" height="15" alt="Administrator" title="Administrator" />';
                }
              ?>
            </div>
            <input id="group-memberlist-<?php echo $tinyrank; ?>-<?php echo $userdata['id']; ?>" type="checkbox"<?php echo ($membership['userid'] == $groupdata['ownerid'] ? ' disabled' : ''); ?> style="margin: 0; padding: 0; vertical-align: middle" />
              <a class="home-page-link" href="<?php echo $path; ?>user_profile.php?name=<?php echo $userdata['name']; ?>"><span><?php echo $userdata['name']; ?></span></a>
          </div>
        </li>
        <?php
        }
      }
    }
  }
        
  $results = @mysqli_num_rows($get_memberships);

        ?>
      </ul>
    </form>
  </div>
  <div id="member-list-pagenumbers">
    <?php echo ($queryLimitMin + 1); ?> - <?php echo ($results + $queryLimitMin); ?> / <?php echo $totalMembers; ?>
  </div>
  <div id="member-list-paging">
    <?php echo ($page > 1 ? '<a href="#" class="avatar-list-paging-link" id="memberlist-search-first" >First</a>' : 'First'); ?>
     | 
    <?php echo ($page > 1 ? '<a href="#" class="avatar-list-paging-link" id="memberlist-search-previous" >&lt;&lt;</a>' : '&lt;&lt;'); ?>
     | 
    <?php echo ($page < $totalPagesMemberList ? '<a href="#" class="avatar-list-paging-link" id="memberlist-search-next" >&gt;&gt;</a>' : '&gt;&gt;'); ?>
    | 
    <?php echo ($page < $totalPagesMemberList ? '<a href="#" class="avatar-list-paging-link" id="memberlist-search-last" >Last</a>' : 'Last'); ?>
    <input type="hidden" id="pageNumberMemberList" value="<?php echo $page; ?>" />
    <input type="hidden" id="totalPagesMemberList" value="<?php echo $totalPagesMemberList; ?>" />
  </div>