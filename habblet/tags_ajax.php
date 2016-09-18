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

$key = isset($_GET['key']) ? FilterText($_GET['key']) : '';
$tag = isset($_POST['tagName']) ? strtolower(FilterText($_POST['tagName'])) : '';

$tmp = mysqli_query($connection, "SELECT * FROM cms_tags WHERE ownerid = '{$my_id}' LIMIT 20") or die(mysqli_error($connection));
$tag_num = mysqli_num_rows($tmp);

$randomq[] = 'What is your favourite TV show?';
$randomq[] = 'Who is your favourite actor?';
$randomq[] = 'Who is your favourite actress?';
$randomq[] = 'What\'s your favourite pastime?';
$randomq[] = 'What is your favorite song?';
$randomq[] = 'How do you describe yourself?';
$randomq[] = 'What is your favorite band?';
$randomq[] = 'What is your favorite comic?';
$randomq[] = 'What is your favourite time of year?';
$randomq[] = 'What is your favorite food?';
$randomq[] = 'What sport you play?';
$randomq[] = 'Who was your first love?';
$randomq[] = 'What is your favorite movie?';
$randomq[] = 'Cats, dogs, or something more exotic?';
$randomq[] = 'What is your favorite color?';
srand((double) microtime() * 1000000);
$chosen = rand(0, count($randomq) - 1);

switch ($key) {
  case 'remove':
    mysqli_query($connection, "DELETE FROM cms_tags WHERE tag = '{$tag}' AND ownerid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
    echo 'SUCCESS';
    break;
  case 'p_remove':
?>
<div id="profile-tags-container">
  <?php
      mysqli_query($connection, "DELETE FROM cms_tags WHERE tag = '{$tag}' AND ownerid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
      $get_tags = mysqli_query($connection, "SELECT * FROM cms_tags WHERE ownerid = '{$my_id}' ORDER BY id LIMIT 25") or die(mysqli_error($connection));
      $rows = mysqli_num_rows($get_tags);
      if($rows > 0) {
        while ($row = mysqli_fetch_assoc($get_tags)) {
  ?>
  <span class="tag-search-rowholder">
    <a href="tags.php?tag=<?php echo $row['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row['tag']; ?>"
          ><?php echo $row['tag']; ?></a>
    <img border="0" class="tag-delete-link tag-delete-link-<?php echo $row['tag']; ?>" onMouseOver="this.src='<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete_hi.gif'" onMouseOut="this.src='<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif'" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif"
          />
  </span>
  <?php
        }
      } else {
        echo 'No tags';
      }
  ?>
  <img id="tag-img-added" border="0" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_added.gif" style="display:none"/>    
</div>
<?php
    break;
  case 'p_list':
?>
<div id="profile-tags-container">
  <?php  
      mysqli_query($connection, "DELETE FROM cms_tags WHERE tag = '{$tag}' AND ownerid = '{$my_id}' LIMIT 1") or die(mysqli_error($connection));
      $get_tags = mysqli_query($connection, "SELECT * FROM cms_tags WHERE ownerid = '{$my_id}' ORDER BY id LIMIT 25") or die(mysqli_error($connection));
      $rows = mysqli_num_rows($get_tags);
      if($rows > 0) {
        while ($row = mysqli_fetch_assoc($get_tags)) {
  ?>
  <span class="tag-search-rowholder">
    <a href="tags.php?tag=<?php echo $row['tag']; ?>" class="tag-search-link tag-search-link-<?php echo $row['tag']; ?>"
    ><?php echo $row['tag']; ?></a>
    <img border="0" class="tag-delete-link tag-delete-link-<?php echo $row['tag']; ?>" onMouseOver="this.src='<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete_hi.gif'" onMouseOut="this.src='<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif'" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_delete.gif"
    />
  </span>
  <?php
        }
      } else {
        echo 'No tags';
      }
  ?>
  <img id="tag-img-added" border="0" src="<?php echo $web_gallery; ?>images/buttons/tags/tag_button_added.gif" style="display:none"/>    
</div>
<?php
    break;
  case 'add':
    $filter = preg_replace("/[^a-z\d]/i", "", $tag);
    if(strlen($tag) < 2 || $filter != $tag || strlen($tag) > 20) {
      echo 'invalidtag';
      exit;
    } else {
      $check = mysqli_query($connection, "SELECT * FROM cms_tags WHERE ownerid = '{$my_id}' AND tag = '{$tag}' LIMIT 1") or die(mysqli_error($connection));
      $num = mysqli_num_rows($check);
      if($num > 0) {
        echo 'invalidtag';
        exit;
      } else {
        if($tag_num > 20) {
          echo 'invalidtag';
          exit;
        } else {
          mysqli_query($connection, "INSERT INTO cms_tags(ownerid, tag) VALUES('{$my_id}', '{$tag}')");
          echo 'valid';
          exit;
        }
      }
    }
    break;
  case 'mytagslist':
?>
<div class="habblet" id="my-tags-list">
  <ul class="tag-list make-clickable">
    <?php while($row = mysqli_fetch_assoc($tmp)) { ?>
    <li>
      <a href="<?php echo $path; ?>tags.php?tag=<?php echo $row['tag']; ?>" class="tag" style="font-size:10px"><?php echo $row['tag']; ?></a>
      <a class="tag-remove-link" title="Remove tag" href="#"></a>
    </li>
    <?php } ?>
  </ul>
  <?php if($tag_num < 20) { ?>
  <form method="post" action="<?php echo $path; ?>/habblet/tag_ajax.php?key=add" onsubmit="TagHelper.addFormTagToMe();return false;" >
    <div class="add-tag-form clearfix">
      <a  class="new-button" href="#" id="add-tag-button" onclick="TagHelper.addFormTagToMe(); return false;"><b>Add tag</b><i></i></a>
        <input type="text" id="add-tag-input" maxlength="20" style="float: right"/>
        <em class="tag-question"><?php echo $randomq[$chosen]; ?></em>
    </div>
    <div style="clear: both"></div> 
  </form>
  <?php } ?>
</div>
<script type="text/javascript">
  TagHelper.setTexts({
    tagLimitText: 'You\'ve reached the tag limit - delete one of your tags if you want to add a new one.',
    invalidTagText: 'Invalid tag',
    buttonText: 'OK'
  });
  TagHelper.bindEventsToTagLists();
</script>
<?php
    break;
}
?>