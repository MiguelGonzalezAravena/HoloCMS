<?php
/*==================================+
|| # HoloCMS - Website and Content Management System
|+==================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+==================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+==================================*/
require_once(dirname(__FILE__) . '/../core.php');
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');
$pagename = 'FAQ';
$category = isset($_POST['category']) ? (int) $_POST['category'] : '';
$cat = isset($_GET['cat']) ? (int) $_GET['cat'] : '';
$edit = isset($_GET['edit']) ? FilterText($_GET['edit']) : '';
$delete = isset($_GET['delete']) ? FilterText($_GET['delete']) : '';
$title = isset($_POST['title']) ? FilterText($_POST['title']) : '';
$topic = isset($_POST['topic']) ? FilterText($_POST['topic']) : '';
$content = isset($_POST['content']) ? FilterText($_POST['content']) : '';
$key = isset($_GET['key']) ? (int) $_GET['key'] : 0;
$id = isset($_POST['id']) ? (int) $_POST['id'] : 0;
$catid = (isset($_POST['catid']) ? (int) $_POST['catid'] : (isset($_GET['catid']) ? (int) $_GET['catid'] : 0));
$uri = isset($_SERVER['HTTP_REFERER']) ? substr($_SERVER['HTTP_REFERER'], strpos($_SERVER['HTTP_REFERER'], 'index.php'), strlen($_SERVER['HTTP_REFERER'])) : '';
$success_delete = isset($_GET['success']) ? FilterText($_GET['success']) : '';

if(empty($category)) { // do not try to save when it's a category jump

}

if(!empty($cat)) {
  $page = 'items';
  if($success_delete == 'delete') {
    $msg = 'Item deleted.';
  }
} elseif($edit == 'cat') {
  $page = 'editcat';
  if($uri == 'index.php?p=faq&edit=cat' || $uri == 'index.php?p=faq&key=' . $key . '&edit=cat') {
    $msg = 'Category saved.';
  }
} elseif($edit == 'item') {
  $page = 'edititem';
  if($uri == 'index.php?p=faq&catid=' . $catid . '&edit=item' || $uri == 'index.php?p=faq&key=' . $key . '&edit=item&catid=' . $catid) {
    $msg = 'Item saved.';
  }
} elseif($delete == 'cat') {
  $page = 'main';
  mysqli_query($connection, "DELETE FROM cms_faq WHERE catid = '{$key}'");
  mysqli_query($connection, "DELETE FROM cms_faq WHERE id = '{$key}' LIMIT 1");
  header('Location: index.php?p=faq&success=delete');
} elseif($delete == 'item') {
  $page = 'main';
  mysqli_query($connection, "DELETE FROM cms_faq WHERE id = '{$key}' LIMIT 1");
  header('Location: index.php?p=faq&cat=' . $catid . '&success=delete');
} elseif($do == 'savecat') {
  $page = 'editcat';
  if(empty($id)) {
    mysqli_query($connection, "INSERT INTO cms_faq(type, title, content) VALUES('cat', '{$title}', '{$content}')");
    $id = mysqli_insert_id($connection);
    header('Location: index.php?p=faq&key=' . $id . '&edit=cat');
  } else {
    mysqli_query($connection, "UPDATE cms_faq SET title = '{$title}', content = '{$content}' WHERE id = '{$id}' LIMIT 1");
    header('Location: index.php?p=faq&key=' . $id . '&edit=cat');    
  }
} elseif($do == 'saveitem') {
  $page = 'edititem';
  if(empty($id)) {
    mysqli_query($connection, "INSERT INTO cms_faq(type, title, content, catid) VALUES('item', '{$topic}', '{$content}', '{$catid}')");
    $id = mysqli_insert_id($connection);
    $request = mysqli_query($connection, "SELECT catid FROM cms_faq WHERE type = 'item' AND id = '{$id}'");
    $row = mysqli_fetch_assoc($request);
    $catid = $row['catid'];
    header('Location: index.php?p=faq&key=' . $id . '&edit=item&catid=' . $catid);
  } else {
    mysqli_query($connection, "UPDATE cms_faq SET title = '{$topic}', content = '{$content}' WHERE id = '{$id}' LIMIT 1");
    $request = mysqli_query($connection, "SELECT catid FROM cms_faq WHERE type = 'item' AND id = '{$id}'");
    $row = mysqli_fetch_assoc($request);
    $catid = $row['catid'];
    header('Location: index.php?p=faq&key=' . $id . '&edit=item&catid=' . $catid);
  }
} elseif(empty($cat)) {
  $page = 'main';
  if($success_delete == 'delete') {
    $msg = 'Category deleted.';
  }
}

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="22%" valign="top" id="leftblock">
        <div>
          <!-- LEFT CONTEXT SENSITIVE MENU -->
          <?php require_once(dirname(__FILE__) . '/sitemenu.php'); ?>
            <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <?php
            if($page == 'main') {
              if(!empty($msg)) {
          ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
            <div class="tableborder">
              <div class="tableheaderalt">FAQ Categorys</div>
              <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                  <td class="tablesubheader" width="10%" align="center">ID</td>
                  <td class="tablesubheader" width="25%" align="center">Name</td>
                  <td class="tablesubheader" width="55%" align="center">Description</td>
                  <td class="tablesubheader" width="10%" align="center">Edit</td>
                </tr>
                <?php
                  $sql = mysqli_query($connection, "SELECT * FROM cms_faq WHERE type = 'cat' ORDER BY id ASC") or die(mysqli_error($connection));
                  $total = mysqli_num_rows($sql);
                  if($total == 0) {
                    echo '<tr><td colspan="4" lass="tablerow1"><center><strong>No categories.</strong></center></td></tr>';
                  } else {
                    while($row = mysqli_fetch_assoc($sql)) {
                ?>
                    <tr>
                      <td class="tablerow1" align="center">
                        <?php echo $row['id']; ?>
                      </td>
                      <td class="tablerow2" align="center">
                        <a href="index.php?p=faq&cat=<?php echo $row['id']; ?>">
                          <?php echo $row['title']; ?>
                        </a>
                      </td>
                      <td class="tablerow1" align="center">
                        <?php echo HoloText($row['content']); ?>
                      </td>
                      <td class="tablerow2" align="center">
                        <a href="index.php?p=faq&key=<?php echo $row['id']; ?>&edit=cat"><img src="./images/edit.gif" alt="Edit"></a>
                        <a href="index.php?p=faq&key=<?php echo $row['id']; ?>&delete=cat"><img src="./images/delete.gif" alt="Delete"></a>
                      </td>
                    </tr>
                <?php
                    }
                  }
                ?>
              </table>
              <div class="tablefooter" align="center">
                <div class="fauxbutton-wrapper"><span class="fauxbutton"><a href="index.php?p=faq&edit=cat">Create New Category</a></span></div>
              </div>
            </div>
            <?php
              } elseif($page == 'editcat') {
                if(!empty($msg)) {
            ?>
              <p><strong><?php echo $msg; ?></strong></p>
              <?php } ?>
                <form action="index.php?p=faq&do=savecat" method="post" name="theAdminForm" id="theAdminForm">
                  <div class="tableborder">
                    <div class="tableheaderalt">Edit/Create Category</div>
                    <?php
                      if(!empty($key)) {
                        $row = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM cms_faq WHERE id = '{$key}' LIMIT 1"));
                        $title = $row['title'];
                        $content = HoloText($row['content']);
                      }
                    ?>
                      <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Title</b>
                            <div class="graytext">The title of your category.</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <input type="text" name="title" value="<?php echo $title; ?>" size="30" class="textinput">
                          </td>
                        </tr>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Content</b>
                            <div class="graytext">The content displayed when clicked.
                              <br />HTML is allowed here.</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <textarea name="content" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext"><?php echo $content; ?></textarea>
                          </td>
                        </tr>
                        <input type="hidden" name="id" value="<?php echo (!empty($id) ? $id : $key); ?>">
                        <tr>
                          <tr>
                            <td align="center" class="tablesubheader" colspan="2">
                              <input type="submit" value="Save" class="realbutton" accesskey="s">
                            </td>
                          </tr>
                </form>
                </table>
                </div>
                <br />
                <?php
                  } elseif($page == 'items') {
                    $id = $cat;
                    $sql = mysqli_query($connection, "SELECT * FROM cms_faq WHERE id = '{$id}'");
                    $row = mysqli_fetch_assoc($sql);
                    if(!empty($msg)) {
                ?>
                  <p><strong><?php echo $msg; ?></strong></p>
                <?php } ?>
                  <div class="tableborder">
                    <div class="tableheaderalt">Items for:
                      <?php echo $row["title"]; ?>
                    </div>
                    <table cellpadding="4" cellspacing="0" width="100%">
                      <tr>
                        <td class="tablesubheader" width="10%" align="center">ID</td>
                        <td class="tablesubheader" width="40%" align="center">Topic</td>
                        <td class="tablesubheader" width="40%" align="center">Content</td>
                        <td class="tablesubheader" width="10%" align="center">Edit</td>
                      </tr>
                      <?php
                        $sql = mysqli_query($connection, "SELECT * FROM cms_faq WHERE catid = '{$id}'");
                        $total = mysqli_num_rows($sql);
                        if($total == 0) {
                          echo '<tr><td colspan="4" lass="tablerow1"><center><strong>No items.</strong></center></td></tr>';
                        } else {
                          while($row1 = mysqli_fetch_assoc($sql)) {
                      ?>
                      <tr>
                        <td class="tablerow1" align="center">
                          <?php echo $row1['id']; ?>
                        </td>
                        <td class="tablerow2" align="center">
                          <?php echo $row1['title']; ?>
                        </td>
                        <td class="tablerow1" align="center">
                          <?php echo HoloText($row1['content']); ?>
                        </td>
                        <td class="tablerow2" align="center">
                          <a href="index.php?p=faq&key=<?php echo $row1['id']; ?>&edit=item"><img src="./images/edit.gif" alt="Edit"></a>
                          <a href="index.php?p=faq&key=<?php echo $row1['id']; ?>&delete=item&catid=<?php echo $id; ?>"><img src="./images/delete.gif" alt="Delete"></a>
                        </td>
                      </tr>
                    <?php
                          }
                        }
                    ?>
                    </table>
                    <div class="tablefooter" align="center">
                      <div class="fauxbutton-wrapper"><span class="fauxbutton"><a href="index.php?p=faq&catid=<?php echo $id; ?>&edit=item">Create New Item</a></span></div>
                    </div>
                  </div>
        <?php
          } elseif($page == 'edititem') {
            if(isset($msg)) {
        ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
            <form action="index.php?p=faq&do=saveitem" method="post" name="theAdminForm" id="theAdminForm">
              <div class="tableborder">
                <div class="tableheaderalt">Edit/Create Item</div>
                <?php
                  if(!empty($key)) {
                    $row = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM cms_faq WHERE id = '{$key}' LIMIT 1"));
                    $topic = $row['title'];
                    $content = HoloText($row['content']);
                  }
                ?>
                  <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Topic</b>
                        <div class="graytext">The topic of your item.</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="text" name="topic" value="<?php echo $topic; ?>" size="30" class="textinput">
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Content</b>
                        <div class="graytext">The content displayed when clicked.
                          <br />HTML is allowed here.</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <textarea name="content" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext"><?php echo $content; ?></textarea>
                      </td>
                    </tr>
                    <input type="hidden" name="catid" value="<?php echo $catid; ?>">
                    <input type="hidden" name="id" value="<?php echo (!empty($id) ? $id : $key); ?>">
                    <tr>
                      <tr>
                        <td align="center" class="tablesubheader" colspan="2">
                          <input type="submit" value="Save" class="realbutton" accesskey="s">
                        </td>
                      </tr>
            </form>
            </table>
            </div>
            <br />
            <?php } ?>
              </div>
              <!-- / RIGHT CONTENT BLOCK -->
      </td>
      </tr>
  </table>
  </div>
  <!-- / OUTERDIV -->
  <div align="center">
    <br />
    <?php
      $mtime = explode(' ', microtime());
      $totaltime = $mtime[0] + $mtime[1] - $starttime;
      printf('Time: %.3f', $totaltime);
    ?>
  </div>
