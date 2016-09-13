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

$pagename = 'Collectables';
$a = isset($_GET['a']) ? FilterText($_GET['a']) : '';
$key = isset($_GET['key']) ? (int) $_GET['key'] : '';
$add = isset($_POST['add']) ? FilterText($_POST['add']) : '';
$edit = isset($_POST['edit']) ? FilterText($_POST['edit']) : '';
$title = isset($_POST['title']) ? FilterText($_POST['title']) : '';
$description = isset($_POST['description']) ? FilterText($_POST['description']) : '';
$furni_image_big = isset($_POST['furni_image_big']) ? FilterText($_POST['furni_image_big']) : '';
$furni_image_small = isset($_POST['furni_image_small']) ? FilterText($_POST['furni_image_small']) : '';
$year = isset($_POST['year']) ? (int) $_POST['year'] : '';
$month = isset($_POST['month']) ? (int) $_POST['month'] : '';
$tid = isset($_POST['tid']) ? (int) $_POST['tid'] : '';
$msg = '';

if($a == 'delete') {
  mysqli_query($connection, "DELETE FROM cms_collectables WHERE id = '{$key}'");
  header('Location: index.php?p=collectables');
}

if(
  !empty($title) && !empty($description) &&
  !empty($furni_image_big) && !empty($furni_image_small) &&
  !empty($year) && !empty($month) && !empty($tid)
  ) {
  if(!empty($edit)) {
    mysqli_query($connection, "UPDATE cms_collectables SET title = '{$title}', description = '{$description}', image_small = '{$furni_image_small}', image_large = '{$furni_image_big}', year = '{$year}', month = '{$month}', tid = '{$tid}' WHERE id = '{$key}' LIMIT 1") or die(mysqli_error($connection));
    $msg = 'Succesfully modified!';
  } else if(!empty($add)) {
    mysqli_query($connection, "INSERT INTO cms_collectables(title, image_small, image_large, tid, description, month, year) VALUES('{$title}', '{$furni_image_small}', '{$furni_image_big}', '{$tid}', '{$description}', '{$month}', '{$year}')") or die(mysqli_error($connection));
    $msg = 'Collectable added.';
  }
} else if(!empty($add) || !empty($edit)) {
  $msg = 'Fill in everything!';
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
              <form action="index.php?p=collectables_edit&a=<?php echo $a . (!empty($key) ? '&key=' . $key : ''); ?>" method="post" name="theAdminForm" id="theAdminForm">
                <div class="tableborder">
                  <div class="tableheaderalt">
                    <?php echo ($a == 'add' ? 'Add ' : ($a == 'edit' ? 'Edit ' : '')); ?>Collectables</div>
                  <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                    <?php if($a == 'add') { ?>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Name</b>
                          <div class="graytext">What's the name of the collectable?</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="title" value="<?php echo $title; ?>" maxlength="50" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Description</b>
                          <div class="graytext">What's the description?</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="description" value="<?php echo $description; ?>" maxlength="175" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Furni Image Big</b>
                          <div class="graytext">Give a url of a picture of the furniture (big).</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="furni_image_big" value="<?php echo $furni_image_big; ?>" maxlength="255" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Furni Image Small</b>
                          <div class="graytext">Give a url of a picture of the furniture (small).</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="furni_image_small" value="<?php echo $furni_image_small; ?>" maxlength=255 class=textinput>
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Month</b>
                          <div class="graytext">In what month the furni need to appear?</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <select style="color: black; font-family: Verdana" name="month">
                            <?php
                              for ($i = 1; $i < 13; $i++) { 
                                echo '<option value="' . $i . '">' . month($i) . '</option>';
                              }
                            ?>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Year</b>
                          <div class="graytext">In what year the furniture need to appear?</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="year" value="<?php echo $year; ?>" maxlength="4" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Furni tid</b>
                          <div class="graytext">What's the "tid" of the furniture? You can find all the tids of furnitures <a href="index.php?p=furniture">here</a>.</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="tid" value="<?php echo $tid; ?>" maxlength="9" class="textinput">
                        </td>
                      </tr>
                      <?php
                        } elseif($a == 'edit') {
                          if(!empty($key)) {
                            $sql = mysqli_query($connection, "SELECT * FROM cms_collectables WHERE id = '{$key}' LIMIT 1");
                            $row = mysqli_fetch_assoc($sql);
                      ?>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Name</b>
                            <div class="graytext">What's the name of the collectable?</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <input type="text" name="title" value="<?php echo $row['title']; ?>" maxlength="50" class="textinput">
                          </td>
                        </tr>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Description</b>
                            <div class="graytext">What's the description?</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <input type="text" name="description" value="<?php echo $row['description']; ?>" maxlength="175" class="textinput">
                          </td>
                        </tr>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Furni Image Big</b>
                            <div class="graytext">Give a url of a picture of the furniture (big).</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <input type="text" name="furni_image_big" value="<?php echo $row['image_large']; ?>" maxlength="255" class="textinput">
                          </td>
                        </tr>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Furni Image Small</b>
                            <div class="graytext">Give a url of a picture of the furniture (small).</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <input type="text" name="furni_image_small" value="<?php echo $row['image_small']; ?>" maxlength="255" class="textinput">
                          </td>
                        </tr>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Month</b>
                            <div class="graytext">In what month the furni need to appear?</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <select style="color: black; font-family: Verdana" name="month">
                              <?php
                                for ($i = 1; $i < 13; $i++) { 
                                  echo '<option value="' . $i . '"' . ($row['month'] == $i ? ' selected="selected"' : '') . '>' . month($i) . '</option>';
                                }
                              ?>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Year</b>
                            <div class="graytext">In what year the furniture need to appear?</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <input type="text" name="year" value="<?php echo $row['year']; ?>" maxlength="4" class="textinput">
                          </td>
                        </tr>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Furni tid</b>
                            <div class="graytext">What's the "tid" of the furniture? You can find all the tids of furnitures <a href="index.php?p=furniture">here</a>.</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <input type="text" name='tid' value="<?php echo $row['tid']; ?>" maxlength="4" class="textinput">
                          </td>
                        </tr>
                        <?php
                            }
                          }

                          if(!empty($a) && empty($key)) {
                            if($a == 'edit') {
                              echo 'If you want to edit a collectable, please go to the over-view and than click on the edit-icon.';
                            }
                          }
                        ?>
                          <tr>
                            <td align="center" class="tablesubheader" colspan="2">
                              <input type="submit" name="<?php echo ($a == 'add' ? 'add' : 'edit'); ?>" value="<?php echo ($a == 'add' ? 'Add collectable' : 'Edit collectable'); ?>" class="realbutton" accesskey="s">
                            </td>
                          </tr>
                  </table>
                </div>
              </form>
              <br /> </div>
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
