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

$pagename = 'Applications forms';
$msg = '';

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');

$catId = isset($_POST['category']) ? $_POST['category'] : 0;
$name = isset($_POST['name']) ? FilterText($_POST['name']) : '';
$introduction = isset($_POST['introduction']) ? FilterText($_POST['introduction']) : '';
$requirements = isset($_POST['requirements']) ? FilterText($_POST['requirements']) : '';
$disclaimer = isset($_POST['disclaimer']) ? FilterText($_POST['disclaimer']) : '';
$hconly = isset($_POST['hconly']) ? FilterText($_POST['hconly']) : '';
$username = isset($_POST['username']) ? FilterText($_POST['username']) : '';
$realname = isset($_POST['realname']) ? FilterText($_POST['realname']) : '';
$birth = isset($_POST['birth']) ? FilterText($_POST['birth']) : '';
$sex = isset($_POST['sex']) ? FilterText($_POST['sex']) : '';
$country = isset($_POST['country']) ? FilterText($_POST['country']) : '';
$general_information = isset($_POST['general_information']) ? FilterText($_POST['general_information']) : '';
$show_disclaimer = isset($_POST['show_disclaimer']) ? FilterText($_POST['show_disclaimer']) : '';
$enabled = isset($_POST['enabled']) ? FilterText($_POST['enabled']) : '';
$experience = isset($_POST['experience']) ? FilterText($_POST['experience']) : '';
$education = isset($_POST['education']) ? FilterText($_POST['education']) : '';
$additional_information = isset($_POST['additional_information']) ? FilterText($_POST['additional_information']) : '';

if(empty($catId) || !is_numeric($catId) || $catId < 1 || $catId > 5) {
  $catId = 1;
}

if(
  !empty($name) && !empty($introduction) && !empty($requirements) && !empty($disclaimer) &&
  !empty($hconly) && !empty($username) && !empty($realname) && !empty($birth) &&
  !empty($sex) && !empty($country) && !empty($general_information) && !empty($show_disclaimer) &&
  !empty($enabled) && !empty($experience) && !empty($education) && !empty($additional_information)
  ) {
  mysqli_query($connection, "INSERT INTO cms_application_forms(name, introduction, requirements, hconly, username, realname, birth, sex, country, general_information, show_disclaimer, disclaimer_text, enabled) VALUES ('{$name}', '{$introduction}', '{$requirements}', '{$hconly}', '{$username}', '{$realname}', '{$birth}', '{$sex}', '{$country}', '{$general_information}', '{$show_disclaimer}', '{$disclaimer}', '{$enabled}')") or die(mysqli_error($connection));
  $msg = 'Succesfully added';
} else if(isset($_POST['name'])) {
  $msg = 'Fill in all fields!';
}
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="22%" valign="top" id="leftblock">
        <div>
          <!-- LEFT CONTEXT SENSITIVE MENU -->
          <?php require_once(dirname(__FILE__) . '/usermenu.php'); ?>
            <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
            <?php echo $msg; ?>
              <form action="index.php?p=application_edit&do=jumpCategory" method="post" name="Jumper!" id="Jumper!">
                <div class="tableborder">
                  <div class="tableheaderalt">Select Category</div>
                  <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                    <tr>
                      <td class="tablerow2" width="100%" valign="middle" align="center">
                        <select name="category" class="dropdown">
                          <option value="1" <?php echo ($catId==1 ? ' selected="selected"' : ''); ?>>Application forms</option>
                          <option value="2" <?php echo ($catId==2 ? ' selected="selected"' : ''); ?>>Add application form</option>
                        </select>
                        &nbsp;
                        <input type="submit" value="Go" class="realbutton" accesskey="s">
                      </td>
                    </tr>
                  </table>
                </div>
              </form>
        </div>
        <br />
        <?php 
          if(!empty($catId)) {
            if($catId == 1) {
        ?>
          <div class="tableborder">
            <div class="tableheaderalt">
              <?php echo $sitename; ?> application forms editor</div>
            <table cellpadding="4" cellspacing="0" width="100%">
              <tr>
                <td class="tablesubheader" width="2%" align="center">Application ID</td>
                <td class="tablesubheader" width="31%" align="center">Name</td>
                <td class="tablesubheader" width="31%" align="center">Introduction</td>
                <td class="tablesubheader" width="31%" align="center">Disclaimer</td>
                <td class="tablesubheader" width="3%" align="center">HC Only</td>
                <td class="tablesubheader" width="2%" align="center">Edit</td>
              </tr>
              <?php
                $get_rooms = mysqli_query($connection, "SELECT id, name, introduction, hconly, disclaimer_text FROM cms_application_forms WHERE deleted = '0'") or die(mysqli_error($connection));
                $total = mysqli_num_rows($get_rooms);
                if($total == 0) {
                  echo '<tr align="center"><td colspan="6"><strong>No applications.</strong></td></tr>';
                } else {
                  while($row = mysqli_fetch_assoc($get_rooms)) {
              ?>
                <tr>
                  <td class="tablerow1" align="center">
                    <?php echo $row['id']; ?>
                  </td>
                  <td class="tablerow2">
                    <?php echo HoloText($row['name']); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo HoloText($row['introduction']); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo HoloText($row['disclaimer_text']); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <?php echo ($row['hconly'] == 0 ? 'No' : 'Yes'); ?>
                  </td>
                  <td class="tablerow2" align="center">
                    <a href="index.php?p=application_form_edit&key=<?php echo $row['id']; ?>&a=edit"><img src="./images/edit.gif" alt="Edit application form"></a>
                    <a href="index.php?p=application_form_edit&key=<?php echo $row['id']; ?>&a=delete"><img src="./images/delete.gif" alt="Delete application form"></a>
                  </td>
                </tr>
                <?php
                    }
                  }
                ?>
            </table>
          </div>
          <?php } elseif($catId == 2) { ?>
            <form action="index.php?p=application_edit&do=save" method="post" name="theAdminForm" id="theAdminForm">
              <div class="tableborder">
                <div class="tableheaderalt">Add a form</div>
                <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Rank name</b>
                      <div class="graytext">Where can people apply for?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="text" name="name" value="<?php echo $name; ?>" size="30" class="textinput">
                    </td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Introduction</b>
                      <div class="graytext">Tell shortly what you"ve to do for this rank and what it is.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <textarea name="introduction" cols="84" rows="5" class="textinput">
                        <?php echo $introduction; ?>
                      </textarea>
                    </td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Requirements</b>
                      <div class="graytext">What are the requirements for this job? <b>Example:</b> good English, don"t get angry, good working together.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <textarea name="requirements" cols="84" rows="5" class="textinput"><?php echo $requirements; ?></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>HC Only?</b>
                      <div class="graytext">Can only people who are member of HC apply?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="hconly" value="0" <?php echo ($hconly == 0 ? ' checked' : ''); ?>> Everybody can apply
                      <input type="radio" name="hconly" value="1" <?php echo ($hconly == 1 ? ' checked' : ''); ?>> HC Only can apply</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Username?</b>
                      <div class="graytext">Show (NOT fill in because the username is already in database) username in application form? <b>Example:</b>
                        <br><b>Username:</b> membername</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="username" value="0" <?php echo ($username == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="username" value="1" <?php echo ($username == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Real name?</b>
                      <div class="graytext">Need people to fill in their real name?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="realname" value="0" <?php echo ($realname == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="realname" value="1" <?php echo ($realname == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Birth?</b>
                      <div class="graytext">Show (NOT fill in because the birth is already in database) birth in application form? <b>Example:</b>
                        <br><b>Date of birth:</b> 24-02-1991</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="birth" value="0" <?php echo ($birth == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="birth" value="1" <?php echo ($birth == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Sex?</b>
                      <div class="graytext">Need people to fill in what they are (male/female/shemale)?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="sex" value="0" <?php echo ($sex == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="sex" value="1" <?php echo ($sex == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Country?</b>
                      <div class="graytext">Need people to fill in, in what country they live?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="country" value="0" <?php echo ($country == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="country" value="1" <?php echo ($country == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Experience?</b>
                      <div class="graytext">Need people to fill in their experience with this job (if they did it before)?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="experience" value="0" <?php echo ($experience == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="experience" value="1" <?php echo ($experience == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Education?</b>
                      <div class="graytext">Need people to fill in what study the do or did?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="education" value="0" <?php echo ($education == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="education" value="1" <?php echo ($education == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>General information?</b>
                      <div class="graytext">Need people to fill in general information (why they want to do this job, why they are interested etc.)?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="general_information" value="0" <?php echo ($general_information == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="general_information" value="1" <?php echo ($general_information == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Additional information?</b>
                      <div class="graytext">Need people to fill in additional information (what their hobbies are etc.)?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="additional_information" value="0" <?php echo ($additional_information == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="additional_information" value="1" <?php echo ($additional_information == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Show disclaimer?</b>
                      <div class="graytext">Need people to read a disclaimer before they can submit there application?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="show_disclaimer" value="0" <?php echo ($show_disclaimer == 0 ? ' checked' : ''); ?>> No
                      <input type="radio" name="show_disclaimer" value="1" <?php echo ($show_disclaimer == 1 ? ' checked' : ''); ?>> Yes</td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Disclaimer</b>
                      <div class="graytext">Make here your own disclaimer. They need to accept the disclaimer (if configurated) before they can submit the application.</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <textarea name="disclaimer" cols="84" rows="5" class="textinput"><?php echo $disclaimer; ?></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td class="tablerow1" width="40%" valign="middle"><b>Enabled/disabled?</b>
                      <div class="graytext">Is the application open or closed?</div>
                    </td>
                    <td class="tablerow2" width="60%" valign="middle">
                      <input type="radio" name="enabled" value="0"<?php echo ($enabled == 0 ? ' checked' : ''); ?>> Closed
                      <input type="radio" name="enabled" value="1"<?php echo ($enabled == 1 ? ' checked' : ''); ?>> Open</td>
                  </tr>
                  <tr>
                    <td align="center" class="tablesubheader" colspan="2">
                      <input type="submit" value="Make application form" class="realbutton" accesskey="s">
                      <input type="hidden" name="category" value="2">
                    </td>
                  </tr>
                </table>
              </div>
              </div>
            </form>
            <?php
                  }
                }

                if(empty($catId)) {
                ?>
              <div class="tableborder">
                <div class="tableheaderalt">
                  <?php echo $sitename; ?> application forms editor</div>
                <table cellpadding="4" cellspacing="0" width="100%">
                  <tr>
                    <td class="tablesubheader" width="2%" align="center">Application ID</td>
                    <td class="tablesubheader" width="31%" align="center">Name</td>
                    <td class="tablesubheader" width="31%" align="center">Introduction</td>
                    <td class="tablesubheader" width="31%" align="center">Disclaimer</td>
                    <td class="tablesubheader" width="3%" align="center">HC Only</td>
                    <td class="tablesubheader" width="2%" align="center">Edit</td>
                  </tr>
                  <?php
                    $get_rooms = mysqli_query($connection, "SELECT id, name, introduction, hconly, disclaimer_text FROM cms_application_forms WHERE deleted = '0'") or die(mysqli_error($connection));
                    while($row = mysqli_fetch_assoc($get_rooms)) {
                  ?>
                    <tr>
                      <td class="tablerow1" align="center">
                        <?php echo $row['id']; ?>
                      </td>
                      <td class='tablerow2'>
                        <?php echo HoloText($row['name']); ?>
                      </td>
                      <td class="tablerow2" align="center">
                        <?php echo HoloText($row['introduction']); ?>
                      </td>
                      <td class="tablerow2" align="center">
                        <?php echo HoloText($row['disclaimer_text']); ?>
                      </td>
                      <td class="tablerow2" align="center">
                        <?php echo ($row['hconly'] == 0 ? 'No' : 'Yes'); ?>
                      </td>
                      <td class="tablerow2" align="center">
                        <a href="index.php?p=application_form_edit&key=<?php echo $row['id']; ?>&a=edit"><img src="./images/edit.gif" alt="Edit application form"></a>
                        <a href="index.php?p=application_form_edit&key=<?php echo $row['id']; ?>&a=delete'><img src=" ./images/delete.gif " alt="Delete application form "></a>
                        </td>
                    </tr>
                  <?php } ?>
                  </table>
                </div>
                <?php } ?>
          </div>
          <!-- / RIGHT CONTENT BLOCK -->
      </td>
    </tr>
  </table>
</div>
<!-- / OUTERDIV -->
<div align='center'>
  <br />
  <?php
    $mtime = explode(' ', microtime());
    $totaltime = $mtime[0] + $mtime[1] - $starttime;
    printf('Time: %.3f', $totaltime);
  ?>
</div>