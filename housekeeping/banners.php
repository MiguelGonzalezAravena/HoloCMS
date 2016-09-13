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

$pagename = 'Wordfilter Options';

$id = isset($_POST['id']) ? (int) $_POST['id'] : 0;
$text = isset($_POST['text']) ? FilterText($_POST['text']) : '';
$banner = isset($_POST['text']) ? FilterText($_POST['banner']) : '';
$url = isset($_POST['url']) ? FilterText($_POST['url']) : '';
$status = isset($_POST['status']) ? FilterText($_POST['status']) : '';
$advanced = isset($_POST['advanced']) ? FilterText($_POST['advanced']) : '';
$html = isset($_POST['html']) ? FilterText($_POST['html']) : '';
$add = isset($_POST['add']) ? FilterText($_POST['add']) : '';
$edit = isset($_POST['edit']) ? FilterText($_POST['edit']) : '';
$delete = isset($_POST['delete']) ? FilterText($_POST['delete']) : '';
$a = isset($_GET['a']) ? FilterText($_GET['a']) : '';
$d = isset($_GET['d']) ? FilterText($_GET['d']) : '';
$msg = '';


if(!empty($add)) {
  mysqli_query($connection, "INSERT INTO cms_banners (text, banner, url, status, advanced, html) VALUES ('{$text}', '{$banner}', '{$url}', '{$status}', '{$advanced}', '{$html}')");
  $msg = 'Action succesfull!';
}
  
if(!empty($edit)) {
  mysqli_query($connection, "UPDATE cms_banners SET text = '{$text}', banner = '{$banner}', url = '{$url}', status = '{$status}', advanced = '{$advanced}', html = '{$html}' WHERE id = '{$id}'");
  $msg = 'Action succesfull!';
}
  
if(!empty($delete)) {
  mysqli_query($connection, "DELETE FROM cms_banners WHERE id = '{$id}'");
  $msg = 'Action succesfull!';
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
          <?php if(!empty($add)) { ?>
          <p><strong><?php echo $msg; ?></strong></p>
          <?php } ?>
              <!-- RIGHT CONTENT BLOCK -->
              <?php if(empty($a) && empty($d)) { ?>
                <form action="index.php?p=banners" method="post" name="theAdminForm" id="theAdminForm">
                  <div class="tableborder">
                    <div class="tableheaderalt">Add banners</div>
                    <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Text</b>
                          <div class="graytext">The text below your banner.</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="text" value="<?php echo $text; ?>" size="30" maxlength="50" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Url of banner</b>
                          <div class="graytext">What"s the url of your banner?</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="banner" value="<?php echo $banner; ?>" size="30" maxlength="255" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Url</b>
                          <div class="graytext">To what site are they going when they click on the text/banner?</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="url" value="<?php echo $url; ?>" size="30" maxlength="255" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Advanced</b>
                          <div class="graytext">Enable HTML code (overrides previous settings)</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="radio"<?php echo ($advanced == 0 ? ' checked' : ''); ?> value="0" name="advanced"> Disabled
                          <br />
                          <input type="radio"<?php echo ($advanced == 1 ? ' checked' : ''); ?> value="1" name="advanced"> Enabled</td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>HTML</b>
                          <div class="graytext">HTML code for advanced users (for placing Google Adsense or something)</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <textarea name="html" cols="61" rows="3" wrap="soft" id="sub_desc" class="multitext"><?php echo $html; ?></textarea>
                        </td>
                      </tr>
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><b>Enable/disable</b>
                          <div class="graytext">Enable or disable the banner.</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="radio"<?php echo ($status == 0 ? ' checked' : ''); ?> value="0" name="status"> Disabled
                          <br />
                          <input type="radio"<?php echo ($status == 1 ? ' checked' : ''); ?> value="1" name="status"> Enabled</td>
                      </tr>
                      <tr>
                        <tr>
                          <td align="center" class="tablesubheader" colspan="2">
                            <input type="submit" value="Add banner" name="add" class="realbutton" accesskey="s">
                          </td>
                        </tr>
                    </table>
                  </div>
                </form>
                <br />
        </div>
        <form action="index.php?p=banners" method="post" name="theAdminForm" id="theAdminForm">
          <div class="tableborder">
            <div class="tableheaderalt">Banner editer</div>
            <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
              <?php
                $request = mysqli_query($connection, "SELECT * FROM cms_banners");
                $total = mysqli_num_rows($request);
                if($total == 0) {
                  echo '<tr align="center"><td colspan="4"><strong>No banners.</strong></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($request)) {
                ?>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle">
                    <b>Text</b><br />
                    <?php echo $row['text']; ?><br />
                    <b>Banner url</b><br />
                    <?php echo $row['banner']; ?><br />
                    <b>Linking url</b><br />
                    <?php echo $row['url']; ?><br />
                    <b>Status</b><br />
                    <?php echo ($row['status'] == 1 ? 'Enabled' : 'Disabled'); ?><br />
                    <b>Advanced</b><br />
                    <?php echo ($row['advanced'] == 1 ? 'Enabled' : 'Disabled'); ?>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <center>
                      <a href="index.php?p=banners&a=<?php echo $row['id']; ?>">Edit</a> |
                      <a href="index.php?p=banners&d=<?php echo $row['id']; ?>">Delete</a>
                    </center>
                  </td>
                </tr>
                <?php
                  }
                }
            ?>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Add banner" name="add" class="realbutton" accesskey="s">
                  </td>
                </tr>
        </form>
        </table>
        </div>
        <br />
        </div>
        <?php 
          }
            if(!empty($a) || !empty($d)) { 
        ?>
          <form action="index.php?p=banners<?php echo (!empty($a) ? '&a=' . $a : '&d=' . $d); ?>" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">
                <?php echo (!empty($a) ? 'Edit banner' : 'Delete banner'); ?>
              </div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <?php
                    if(!empty($a)) {
                      $sql = mysqli_query($connection, "SELECT * FROM cms_banners WHERE id = '{$a}'");
                      $row = mysqli_fetch_assoc($sql); 

                      if(!empty($msg)) {
                    ?>
                  <tr>
                    <td class="graytext" width="40%" valign="middle" align="center" colspan="2"><b><?php echo $msg; ?></b></td>
                  </tr>
                  <?php } ?>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Text</b>
                        <div class="graytext">The text below your banner.</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="text" name="text" value="<?php echo $row['text']; ?>" size="30" maxlength="50" class="textinput">
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Url of banner</b>
                        <div class="graytext">What"s the url of your banner?</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="text" name="banner" value="<?php echo $row['banner']; ?>" size="30" maxlength="255" class="textinput">
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Url</b>
                        <div class="graytext">To what site are they going when they click on the text/banner?</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="text" name="url" value="<?php echo $row['url']; ?>" size="30" maxlength="255" class="textinput">
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Advanced</b>
                        <div class="graytext">Enable HTML code (overrides previous settings)</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="radio" <?php echo ($row[ 'advanced']==0 ? ' checked' : ''); ?> value="0" name="advanced"> Disabled
                        <br>
                        <input type="radio" <?php echo ($row[ 'advanced']==1 ? ' checked' : ''); ?> value="1" name="advanced"> Enabled</td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>HTML</b>
                        <div class="graytext">HTML code for advanced users (for placing Google Adsense or something)</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <textarea name="html" cols="61" rows="3" wrap="soft" id="sub_desc" class="multitext">
                          <?php echo HoloText($row['html']); ?>
                        </textarea>
                      </td>
                    </tr>
                    <tr>
                      <td class="tablerow1" width="40%" valign="middle"><b>Enable/disable</b>
                        <div class="graytext">Enable or disable the banner.</div>
                      </td>
                      <td class="tablerow2" width="60%" valign="middle">
                        <input type="radio" <?php echo ($row[ 'status']==0 ? ' checked' : ''); ?> value="0" name="status"> Disabled
                        <br />
                        <input type="radio" <?php echo ($row[ 'status']==1 ? ' checked' : ''); ?> value="1" name="status"> Enabled</td>
                    </tr>
                    <?php
                    } else {
                      $sql = mysqli_query($connection, "SELECT * FROM cms_banners WHERE id = '{$d}'");
                      $row = mysqli_fetch_assoc($sql);
                      if(!empty($delete) && !empty($msg)) {
                      ?>
                      <tr>
                        <td class="graytext" width="40%" valign="middle" align="center" colspan="2"><b><?php echo $msg; ?></b></td>
                      </tr>
                      <?php } ?>
                        <tr>
                          <td class="tablerow1" width="40%" valign="middle"><b>Delete</b>
                            <div class="graytext">Do you want to delete the banner with the following text:</div>
                          </td>
                          <td class="tablerow2" width="60%" valign="middle">
                            <?php echo $row['text']; ?>
                          </td>
                        </tr>
                        <?php } ?>
                          <tr>
                            <input type="hidden" name="id" value="<?php echo (!empty($a) ? $a : $d); ?>">
                            <tr>
                              <td align="center" class="tablesubheader" colspan="2">
                                <input type="submit" value="<?php echo (!empty($a) ? 'Edit' : 'Delete'); ?> banner" name="<?php echo (!empty($a) ? 'edit' : 'delete'); ?>" class="realbutton" accesskey="s">
                              </td>
                            </tr>
          </form>
          </table>
          </div>
          <br /> </div>
          <?php } ?>
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
