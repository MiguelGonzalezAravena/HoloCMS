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

$pagename = 'Manage Existing Articles';
$title = isset($_POST['title']) ? FilterText($_POST['title']) : '';
$category = isset($_POST['category']) ? FilterText($_POST['category']) : '';
$topstory = isset($_POST['topstory']) ? FilterText($_POST['topstory']) : '';
$short_story = isset($_POST['short_story']) ? FilterText($_POST['short_story']) : '';
$story = isset($_POST['story']) ? FilterText($_POST['story']) : '';
$categories = array('HoloCMS', 'News', 'Furniture', 'Updates', 'Server', 'Credits', $shortname . ' Club', 'Maintenance', 'Technical', 'Downtime', 'Website', 'Special Offers', 'Sponsored', 'Events & Competitions', 'Security', 'Staff', 'Announcements', 'Tips', 'Holograph Emulator', 'Other');
$editor_mode = false;
$msg = '';

if(!empty($key) && $do == 'delete') {
  $check = mysqli_query($connection, "SELECT num FROM cms_news WHERE num = '{$key}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);

  if($exists > 0) {
    mysqli_query($connection, "DELETE FROM cms_news WHERE num = '{$key}' LIMIT 1") or die(mysqli_error($connection));
    $msg = 'Article deleted successfully.';
  } else {
    $msg = 'Unable to delete article; this article does not exist!';
  }
} elseif(!empty($key) && $do == 'edit') {
  $check = mysqli_query($connection, "SELECT * FROM cms_news WHERE num = '{$key}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);

  if($exists > 0) {
    $article = mysqli_fetch_assoc($check);
    $editor_mode = true;
  } else {
    $msg = 'Unable to edit article; this article does not exist!';
  }

} elseif(!empty($key) && $do == 'save' && !empty($topstory)) {
  $check = mysqli_query($connection, "SELECT num FROM cms_news WHERE num = '{$key}' LIMIT 1") or die(mysqli_error($connection));
  $exists = mysqli_num_rows($check);

  if($exists > 0) {
    $num = $key;
    mysqli_query($connection, "UPDATE cms_news SET title = '{$title}', category = '{$category}', topstory = '{$topstory}', short_story = '{$short_story}', story = '{$story}' WHERE num = '{$num}' LIMIT 1") or die(mysqli_error($connection));
    $msg = 'Article updated successfully.';
    $editor_mode = false;
  } else {
    $msg = 'Unable to edit article; this article does not exist!';
  }
} elseif($do == 'bounce') {
  $msg = 'Article published successfully.';
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
            if($editor_mode != true) {
              if(!empty($msg)) {
          ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <form action="index.php?p=news_manage&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">News Articles</div>
              <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                  <td class="tablesubheader" width="1%" align="center">ID</td>
                  <td class="tablesubheader" width="28%">Title</td>
                  <td class="tablesubheader" width="10%" align="center">Date</td>
                  <td class="tablesubheader" width="10%" align="center">Author</td>
                  <td class="tablesubheader" width="10%" align="center">Edit</td>
                  <td class="tablesubheader" width="12%" align="center">Delete</td>
                </tr>
                <?php
                  $get_articles = mysqli_query($connection, "SELECT num, title, short_story, date, author FROM cms_news ORDER BY num DESC") or die(mysqli_error($connection));
                  $total = mysqli_num_rows($get_articles);
                  if($total == 0) {
                    echo '<tr align="center"><td colspan="6" class="tablerow1"><strong>No news.</strong></td></tr>';
                  } else {
                    while($row = mysqli_fetch_assoc($get_articles)) {
                ?>
                  <tr>
                    <td class="tablerow1" align="center">
                      <?php echo $row['num']; ?>
                    </td>
                    <td class="tablerow2"><strong><?php echo HoloText($row['title']); ?></strong>
                      <div class="desctext">
                        <?php echo HoloText($row['short_story']); ?>
                      </div>
                    </td>
                    <td class="tablerow2" align="center">
                      <?php echo $row['date']; ?>
                    </td>
                    <td class="tablerow2" align="center">
                      <?php echo  $row['author']; ?>
                    </td>
                    <td class="tablerow2" align="center"><a href="index.php?p=news_manage&do=edit&key=<?php echo $row['num']; ?>"><img src="<?php echo $housekeeping; ?>images/edit.gif" alt="Edit"></a></td>
                    <td class="tablerow2" align="center"><a href="index.php?p=news_manage&do=delete&key=<?php echo $row['num']; ?>"><img src="<?php echo $housekeeping; ?>images/delete.gif" alt="Delete"></a></td>
                  </tr>
                <?php
                    }
                  }
                ?>
              </table>
              <div class="tablefooter" align="center">
                <div class="fauxbutton-wrapper"><span class="fauxbutton"><a href="index.php?p=news_compose">Compose New News Item</a></span></div>
              </div>
            </div>
          </form>
          <?php } else { ?>
          <form action="index.php?p=news_manage&do=save&key=<?php echo $article['num']; ?>" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Edit News Article (
                <?php echo $article['title']; ?>)</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Title</b>
                    <div class="graytext">The full title of your article.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="title" value="<?php echo HoloText($article['title']); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>News Category</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="category" class="dropdown">
                      <?php
                        for ($i = 0; $i < count($categories); $i++) { 
                          echo '<option value="' . $categories[$i] . '"' . ($article['category'] == $categories[$i] ? ' selected="selected"' : '') . '>' . $categories[$i] . '</option>';
                        }
                      ?>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Topstory Image</b>
                    <div class="graytext">The URL to the topstory image.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="topstory" value="<?php echo $article['topstory']; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Short Story</b>
                    <div class="graytext">A small introduction to the article.
                      <br />HTML is not allowed here.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="short_story" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext"><?php echo HoloText($article['short_story']); ?></textarea>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Story</b>
                    <div class="graytext">The actual news message.
                      <br />HTML is allowed here.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="story" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext"><?php echo HoloText($article['story']); ?></textarea>
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Update Article" class="realbutton" accesskey="s">
                  </td>
                </tr>
              </table>
            </div>
          </form>
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