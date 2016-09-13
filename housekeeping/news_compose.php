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

$pagename = 'Compose New Article';
$top_story = isset($_POST['topstory']) ? FilterText($_POST['topstory']) : '';

$num = $key;
$title = isset($_POST['title']) ? FilterText($_POST['title']) : '';
$category = isset($_POST['category']) ? FilterText($_POST['category']) : '';
$topstory = isset($_POST['topstory']) ? FilterText($_POST['topstory']) : '';
$short_story = isset($_POST['short_story']) ? FilterText($_POST['short_story']) : '';
$story = isset($_POST['story']) ? FilterText($_POST['story']) : '';
$name = isset($_POST['author']) ? FilterText($_POST['author']) : '';
$categories = array('HoloCMS', 'News', 'Furniture', 'Updates', 'Server', 'Credits', $shortname . ' Club', 'Maintenance', 'Technical', 'Downtime', 'Website', 'Special Offers', 'Sponsored', 'Events & Competitions', 'Security', 'Staff', 'Announcements', 'Tips', 'Holograph Emulator', 'Other');

if(
  $do == 'save' &&
  !empty($title) && !empty($category) &&
  !empty($top_story) && !empty($short_story) &&
  !empty($story) && !empty($name)
  ) {
  mysqli_query($connection, "INSERT INTO cms_news(title, category, topstory, short_story, story, author, date) VALUES('{$title}', '{$category}', '{$topstory}', '{$short_story}', '{$story}', '{$name}', '{$date_reversed}')") or die(mysqli_error($connection));
  header('Location: index.php?p=news_manage&do=bounce');
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
          <form action="index.php?p=news_compose&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Compose News Article</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Title</b>
                    <div class="graytext">The full title of your article.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="title" value="<?php echo $title; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>News Category</b></td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select name="category" class="dropdown">
                      <?php
                        for ($i = 0; $i < count($categories); $i++) { 
                          echo '<option value="' . $categories[$i] . '"' . ($category == $categories[$i] ? ' selected="selected"' : '') . '>' . $categories[$i] . '</option>';
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
                    <input type="text" name="topstory" value="<?php echo $web_gallery . 'images/top-story/top_story_bugs.png'; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Short Story</b>
                    <div class="graytext">A small introduction to the article.
                      <br />HTML is not allowed here.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="short_story" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext">
                      <?php echo HoloText($short_story); ?>
                    </textarea>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Story</b>
                    <div class="graytext">The actual news message.
                      <br />HTML is allowed here.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="story" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext">
                      <?php echo HoloText($story); ?>
                    </textarea>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Author</b>
                    <div class="graytext">Who's the author of the article?</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="author" value="<?php echo $name; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Publish Article" class="realbutton" accesskey="s">
                  </td>
                </tr>
              </table>
            </div>
          </form>
          <br />
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
