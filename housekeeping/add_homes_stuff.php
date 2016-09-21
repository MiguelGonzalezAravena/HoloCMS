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
require_once(dirname(__FILE__) . '/../core.php');
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

$pagename = 'Stickers & Backgrounds';

$url = isset($_POST['url']) ? FilterText($_POST['url']) : '';
$price = isset($_POST['price']) ? (int) $_POST['price'] : '';
$name = isset($_POST['name']) ? FilterText($_POST['name']) : '';
$type = isset($_POST['type']) ? (int) $_POST['type'] : '';
$submit = isset($_POST['submit']) ? FilterText($_POST['submit']) : '';
$msg = '';
$categories = array(
  array('id' => 19, 'name' => 'General'),
  array('id' => 50, 'name' => 'Staff'),
  array('id' => 3, 'name' => 'Trax'),
  array('id' => 5, 'name' => 'Plastic'),
  array('id' => 6, 'name' => 'Bling'),
  array('id' => 7, 'name' => 'Borders'),
  array('id' => 8, 'name' => 'Crazy'),
  array('id' => 9, 'name' => 'Cute'),
  array('id' => 10, 'name' => 'Scary'),
  array('id' => 11, 'name' => 'Deals'),
  array('id' => 12, 'name' => 'Aarows &amp; Pointers'),
  array('id' => 13, 'name' => 'Plants'),
  array('id' => 14, 'name' => 'FX'),
  array('id' => 15, 'name' => 'Snowstorm'),
  array('id' => 16, 'name' => 'Battleball'),
  array('id' => 17, 'name' => $shortname . ' Club'),
  array('id' => 18, 'name' => 'Personality'),
  array('id' => 20, 'name' => 'Other'),
  array('id' => 21, 'name' => 'Alpha Wood'),
  array('id' => 27, 'name' => 'Backgrounds'),
);

if(!empty($url) && !empty($price) && !empty($name) && !empty($type)) {
  $filename = '../web-gallery/styles/myhabbo/assets.css';
  $stickyname = explode(' ', $name);
  $image = getimagesize($url);
  $h = $image[0];
  $w = $image[1];
  if($type != 27 || $type != 50) {
    $somecontent = "
    div.s_{$stickyname[0]} {
        width: {$h}px; height: {$w}px;
        background-image: url({$url});
    }
    div.s_{$stickyname[0]}_pre {
        background: url({$url}) no-repeat 50% 50%;
    }";
  } else {
    $somecontent = "
    div.b_{$stickyname[0]} {
        background-image: url({$url});
    }
    div.b_{$stickyname[0]}_pre {
        background-image: url({$url});
    }";
  }

  if(is_writable($filename)) {
    if(!$handle = fopen($filename, 'a')) {
      $msg =  'Can\'t open file (' . $filename . ')';
      exit;
    }
    if(fwrite($handle, $somecontent) == FALSE) {
      $msg = 'Can\'t add sticker';
      exit;
    }
    $msg = 'Success, your sticker/background has been added';
    fclose($handle);
  } else {
    $msg = 'The file ' . $filename . ' is not writable';
  }


  if($type == 27 || $type == 50) {
    mysqli_query($connection, "INSERT INTO cms_homes_catalouge(name, type, subtype, data, price, category) VALUES('{$name}', '4',  '0',  '{$stickyname[0]}',  '{$price}',  '{$type}')") or die(mysqli_error($connection));
  } else {
    mysqli_query($connection, "INSERT INTO cms_homes_catalouge(name, type, subtype, data, price, category) VALUES('{$name}', '1', '0', '{$stickyname[0]}', '{$price}', '{$type}')") or die(mysqli_error($connection));
  }
  
  mysqli_query($connection, "INSERT INTO system_stafflog(action, message, note, userid, targetid, timestamp) VALUES('Housekeeping', 'Created Sticker or Background {$name} worth {$price} credits', 'add_homes_stuff.php', '{$my_id}', '', '{$date_full}')") or die(mysqli_error($connection));

} else if(!empty($submit)) {
  $msg = 'Please do not leave any fields blank.';
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
          <?php if(!empty($msg)) { ?>
          <p><strong><?php echo $msg; ?></p></strong>
          <?php } ?>
          <form action="index.php?p=add_homes&do=create" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Create Sticker or Background</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>URL</strong>
                    <div class="graytext">
                      The URL of the image</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="url" size="43" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Category</strong>
                    <div class="graytext">
                      The category the item will be on</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <select size="1" name="type">
                      <?php
                        for ($i = 0; $i < count($categories); $i++) { 
                          echo '<option value="' . $categories[$i]['id'] . '">' . $categories[$i]['name'] . '</option>';
                        }
                      ?>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Name</strong>
                    <div class="graytext">
                      The name that will be displayed with the image in the homes and groups catalogue
                    </div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="name" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><strong>Price</strong>
                    <div class="graytext">
                      The amount of credits the item will cost</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="price" value="" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" name="submit" value="Create Sticker" class="realbutton" accesskey="s">
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
