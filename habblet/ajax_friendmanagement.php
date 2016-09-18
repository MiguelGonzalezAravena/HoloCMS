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

$page = isset($_GET['pageNumber']) ? (int) $_GET['pageNumber'] : 1;
$pagesize = isset($_GET['pageSize']) ? (int) $_GET['pageSize'] : 1;
$search = isset($_POST['searchString']) ? FilterText($_POST['searchString']) : '';
if(!empty($page)) {
?>
  <div id="friend-list" class="clearfix">
    <div id="friend-list-header-container" class="clearfix">
      <div id="friend-list-header">
        <div class="page-limit">
          <div class="big-icons friend-header-icon">
            Friends<br />
            Show
            <?php if($pagesize == 30) { ?>
            30 |
            <a class="category-limit" id="pagelimit-50">50</a> |
            <a class="category-limit" id="pagelimit-100">100</a>
            <?php } elseif($pagesize == 50) { ?>
            <a class="category-limit" id="pagelimit-30">30</a> |
            50 |
            <a class="category-limit" id="pagelimit-100">100</a>
            <?php } elseif($pagesize == 100) { ?>
            <a class="category-limit" id="pagelimit-30">30</a> |
            <a class="category-limit" id="pagelimit-50">50</a> |
            100
            <?php } ?>
          </div>
        </div>
      </div>
      <div id="friend-list-paging">
        <?php
          if($page != 1) {
          $pageminus = $page - 1;
        ?>
        <a href="#" class="friend-list-page" id="page-<?php echo $pageminus; ?>">&lt;&lt;</a> |
        <?php
          }
          $afriendscount = mysqli_query($connection, "SELECT COUNT(*) FROM messenger_friendships WHERE userid = '{$my_id}' OR friendid = '{$my_id}'") or die(mysqli_error($connection));
          $friendscount = mysqli_num_rows($afriendscount);

          $pages = ceil($friendscount / $pagesize);

          if($pages == 1) {
            echo '1';
          } else {
            $n = 0;
            while ($n < $pages) {
              $n++;
              if($n == $page) {
              echo $n . ' |';
              } else {
              echo '<a href="#" class="friend-list-page" id="page-' . $n . '">' . $n . '</a> |';
              }
            }

            if($page != $pages) {
              $pageplus = $page + 1;
              echo '<a href="#" class="friend-list-page" id="page-' . $pageplus . '">&gt;&gt;</a>';
            }
          }
        ?>
      </div>
    </div>
    <form id="friend-list-form">
      <table id="friend-list-table" border="0" cellpadding="0" cellspacing="0">
        <thead>
          <tr class="friend-list-header">
            <td class="friend-select"></td>
            <td class="friend-name table-heading">Name</td>
            <td class="friend-login table-heading">Last login</td>
            <td class="friend-remove table-heading">Remove</td>
          </tr>
        </thead>
        <tbody>
          <?php
            $i = 0;
            $offset = $pagesize * $page;
            $offset = $offset - $pagesize;
            $getem = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$my_id}' OR friendid = '{$my_id}' LIMIT {$pagesize} OFFSET {$offset}") or die(mysqli_error($connection));
            while ($row = mysqli_fetch_assoc($getem)) {
              $i++;
              $even = (IsEven($i)) ? 'odd' : 'even';

              if($row['friendid'] == $my_id) {
                $friendsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['userid']}'");
              } else {
                $friendsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['friendid']}'");
              }

              $friendrow = mysqli_fetch_assoc($friendsql);
          ?>
          <tr class="<?php echo $even; ?>">
            <td>
              <input type="checkbox" name="friendList[]" value="<?php echo $friendrow['id']; ?>" />
            </td>
            <td class="friend-name">
              <?php echo $friendrow['name']; ?>
            </td>
            <td class="friend-login" title="<?php echo $friendrow['lastvisit']; ?>">
              <?php echo $friendrow['lastvisit']; ?>
            </td>
            <td class="friend-remove">
              <div id="remove-friend-button-<?php echo $friendrow['id']; ?>" class="friendmanagement-small-icons friendmanagement-remove remove-friend"></div>
            </td>
          </tr>
          <?php
            }
          ?>
        </tbody>
      </table>
      <a class="select-all" id="friends-select-all" href="#">Select all</a> |
      <a class="deselect-all" href=# " id="friends-deselect-all ">Deselect all</a>
    </form>
  </div>
  <script type="text/javascript ">
    new FriendManagement({ currentCategoryId: 0, pageListLimit: <?php echo $pagesize; ?>, pageNumber: <?php echo $page; ?>});
  </script>
<?php
} elseif(!empty($search)) {
  $page = 1;
?>
<div id="friend-list" class="clearfix">
  <div id="friend-list-header-container" class="clearfix">
    <div id="friend-list-header">
      <div class="page-limit">
        <div class="big-icons friend-header-icon">
          Friends<br />
          Show
          <?php if($pagesize == 30) { ?>
          30 |
          <a class="category-limit" id="pagelimit-50">50</a> |
          <a class="category-limit" id="pagelimit-100">100</a>
          <?php } elseif($pagesize == 50) { ?>
          <a class="category-limit" id="pagelimit-30">30</a> |
          50 |
          <a class="category-limit" id="pagelimit-100">100</a>
          <?php } elseif($pagesize == 100) { ?>
          <a class="category-limit" id="pagelimit-30">30</a> |
          <a class="category-limit" id="pagelimit-50">50</a> |
          100
          <?php } ?>
        </div>
      </div>
    </div>
    <div id="friend-list-paging ">
      <?php
        if($page != 1) {
          $pageminus = $page - 1;
          echo '<a href="# " class="friend-list-page " id="page- ' . $pageminus . ' ">&lt;&lt;</a> |';
        }
        $i = 0;
        $list = 0;
        $sql = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$my_id}' OR friendid = '{$my_id}'") or die(mysqli_error($connection));
        while ($row = mysqli_fetch_assoc($sql)) {
          $i++;
          if($row['friendid'] == 1) {
            $friendsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['userid']}' AND name LIKE '%{$search}%'");
          } else {
            $friendsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['friendid']}' AND name LIKE '%{$search}%'");
          }

          $list = $list + mysqli_num_rows($friendsql);
        }

        $pages = ceil($list / $pagesize);

        if($pages == 1) {
          echo '1';
        } else {
          $n = 0;
          while ($n < $pages) {
            $n++;
            if($n == $page) {
              echo $n . ' |';
            } else {
              echo '<a href="# " class="friend-list-page " id="page- ' . $n . ' ">' . $n . '</a> |';
            }
          }

          if($page != $pages) {
            $pageplus = $page + 1;
            echo '<a href="# " class="friend-list-page " id="page- ' . $pageplus . ' ">&gt;&gt;</a>';
          }
        }
      ?>
    </div>
  </div>
  <form id="friend-list-form">
    <table id="friend-list-table" border="0" cellpadding="0" cellspacing="0">
      <thead>
        <tr class="friend-list-header">
          <td class="friend-select"></td>
          <td class="friend-name table-heading">Name</td>
          <td class="friend-login table-heading">Last login</td>
          <td class="friend-remove table-heading">Remove</td>
        </tr>
      </thead>
      <tbody>
        <?php
          $i = 0;
          $n = 0;
          $getem = mysqli_query($connection, "SELECT * FROM messenger_friendships WHERE userid = '{$my_id}' OR friendid = '{$my_id}' ") or die(mysqli_error($connection));
          while ($row = mysqli_fetch_assoc($getem)) {
            $i++;
            if($row['friendid'] == $my_id) {
              $friendsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['userid']}' AND name LIKE '%{$search}%'");
            } else {
              $friendsql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['friendid']}' AND name LIKE '%{$search}%'");
            }
            $friendrow = mysqli_fetch_assoc($friendsql);
            if(!empty($friendrow['name'])) {
              $n++;
              $even = (IsEven($i)) ? 'odd' : 'even';
        ?>
        <tr class="<?php echo $even; ?>">
          <td>
            <input type="checkbox" name="friendList[]" value="<?php echo $friendrow['id']; ?>" />
          </td>
          <td class="friend-name">
            <?php echo $friendrow['name']; ?>
          </td>
          <td class="friend-login" title="<?php echo $friendrow['lastvisit']; ?>">
            <?php echo $friendrow['lastvisit']; ?>
          </td>
          <td class="friend-remove">
            <div id="remove-friend-button-<?php echo $friendrow['id']; ?>" class="friendmanagement-small-icons friendmanagement-remove remove-friend"></div>
          </td>
        </tr>
        <?php
              }
            }
        ?>
      </tbody>
    </table>
    <a class="select-all" id="friends-select-all" href="#">Select all</a> |
    <a class="deselect-all" href=# " id="friends-deselect-all ">Deselect all</a>
  </form>
</div>
<script type="text/javascript ">
  new FriendManagement({ currentCategoryId: 0, pageListLimit: <?php echo $pagesize; ?>, pageNumber: <?php echo $page; ?>});
</script>
<?php } ?>