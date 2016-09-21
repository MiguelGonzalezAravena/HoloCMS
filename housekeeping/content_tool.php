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

$catId = (isset($_POST['category']) ? (int) $_POST['category'] : (isset($_GET['category']) ? (int) $_GET['category'] : 0));
$categories = array('General Options', 'Staff Module', 'Credits Page', 'Discussion Board Module', 'Newsletter');
$msg = '';

if(empty($catId)) { // do not try to save when it's a category jump
  foreach($_POST as $key => $value) {
    if(strlen($value) > 0 && strlen($key) > 0) {
      mysqli_query($connection, "UPDATE cms_content SET contentvalue = '" . FilterText($value) . "' WHERE contentkey = '" . FilterText($key) . "' LIMIT 1") or die(mysqli_error($connection));
      $msg = 'Settings saved successfully.'; // I know, we shouldn't do this in a loop but meh, doesn't really matter that much, does it?
    }
  }
}
// Note this tool is pretty dynamic. If you add a option in the database, it will be open for editing on this page - automaticly.

$pagename = 'Content Management';

if(empty($catId) || $catId < 1 || $catId > 6) {
  $catId = 1;
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
          <?php if(!empty($msg)){ ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
          <div class="tableborder">
            <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
              <form action="index.php?p=content&do=jumpCategory" method="post" name="Jumper!" id="Jumper!">
                <div class="tableheaderalt">Select Category</div>
                <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                  <tr>
                    <td class="tablerow2" width="100%" valign="middle" align="center">
                      <select name="category" class="dropdown">
                        <?php
                      for ($i = 0; $i < count($categories); $i++) { 
                        echo '<option value="' . ($i + 1) . '"' . ($catId == ($i + 1) ? ' selected="selected"' : '') . '>' . $categories[$i] . '</option>';
                      }
                    ?>
                      </select>
                      &nbsp;
                      <input type="submit" value="Go" class="realbutton" accesskey="s">
                    </td>
                  </tr>
                </table>
              </form>
          </div>
          <br />
          <form action="index.php?p=content&do=save" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Manage Content Options</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <?php
                    $get_settings = mysqli_query($connection, "SELECT * FROM cms_content WHERE category = '{$catId}' ORDER BY contentkey ASC") or die(mysqli_error($connection));
                    $total = mysqli_num_rows($get_settings);
                    if($total == 0) {
                      echo '<tr align="center"><td class="tablerow1"><strong>Nothing here.</strong></td></tr>';
                    } else {
                      while($row = mysqli_fetch_assoc($get_settings)) {
                        if($row['contentkey'] != 'client-widescreen') {
                ?>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b><?php echo $row['setting_title']; ?></b>
                      <div class="graytext">
                        <?php echo $row['setting_desc']; ?>
                      </div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <?php
                          switch ($row['fieldtype']) {
                            case 1:
                              // Dynamicly calculate the size of the boxes. Please note that due to the word-is-too-long-so-we-break-the-line
                              // stuff we can't really determine it here so it may not be '100%' correct (eg. one line too few creating scrollbars.)
                              $rows = ceil(strlen(stripslashes($row['contentvalue'])) / 60);
                              // If it is too long, by the means of more than 10 rows, we stick with 10 (avoiding boxes that are way to large).
                              if($rows > 10) {
                                $rows = 10;
                              }
                              
                              // Default amount of cols is 60, but we'll adjust it if it's only one line
                              if($rows < 2) {
                                $cols = strlen(stripslashes($row['contentvalue']));
                              } else {
                                $cols = 60;
                              }

                              if($rows < 2 && $cols > 3) {
                                $cols = $cols + 10;
                              } else {
                                $cols = $cols + 1;
                              } // give a little extra space

                              echo '<textarea name="' . $row['contentkey'] . '" cols="' . $cols . '" rows="' . $rows . '" wrap="soft" id="sub_desc" class="multitext">' . stripslashes($row['contentvalue']) . '</textarea>';
                              break;
                            case 2:
                              echo '<select name="' . $row['contentkey'] . '" class="dropdown">';
                              echo '<option value="1"' . ($row['contentvalue'] == 1 ? ' selected="selected"' : '') . '>Enabled</option>';
                              echo '<option value="0"' . ($row['contentvalue'] == 0 ? ' selected="selected"' : '') . '>Disabled</option>';
                              echo '</select>';
                              break;
                            case 3:
                              echo '<select name="' . $row['contentkey'] . '" class="dropdown">';
                              echo '<option value="red"' . ($row['contentvalue'] == 'red' ? ' selected="selected"' : '') . '>Red</option>';
                              echo '<option value="blue"' . ($row['contentvalue'] == 'blue' ? ' selected="selected"' : '') . '>Blue</option>';
                              echo '<option value="white"' . ($row['contentvalue'] == 'white' ? ' selected="selected"' : '') . '>White (no Header)</option>';
                              echo '<option value="green"' . ($row['contentvalue'] == 'green' ? ' selected="selected"' : '') . '>Green</option>';
                              echo '</select>';
                              break;
                          }
                      ?>
                    </td>
                  </tr>
                  <?php
                        }
                      }
                  ?>
                  <tr>
                    <td align="center" class="tablesubheader" colspan="2">
                      <input type="submit" value="Save Settings" class="realbutton" accesskey="s">
                    </td>
                  </tr>
                <?php
                  }
                ?>
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