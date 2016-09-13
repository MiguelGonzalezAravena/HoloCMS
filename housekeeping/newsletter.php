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
set_time_limit(7200);
require_once(dirname(__FILE__) . '/../core.php');
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

$pagename = 'Create Newsletter';
$subject = isset($_POST['subject']) ? FilterText($_POST['subject']) : '';
$where = isset($_POST['where']) ? FilterText($_POST['where']) : '';
$body = isset($_POST['body']) ? FilterText($_POST['body']) : '';
$msg = '';

if($do == 'publish' && !empty($body)) {
  $num = $key;
  $header = HoloText(getContent('newsletter-1header'));
  $footer = HoloText(getContent('newsletter-2footer'));
  $from = HoloText(getContent('newsletter-3from'));
  $fromname = HoloText(getContent('newsletter-4fromname'));
  $headers  = '';
  $headers  = "Return-Path: <{$from}>\r\n";
  $headers  = "From: {$fromname}  <{$from}>\r\n";
  $headers .= "MIME-Version: 1.0 \r\n";
  $headers .= "Content-Type: multipart/related; \r\n";
  $headers .= " boundary='----=_Part_1218195_2242574.1223844236223'\r\n";
  $headers .= "Precedence: Bulk\r\n";
  $headers = stripslashes($headers);
  $where = empty($where) ? 'newsletter = \'1\'' : $where;
  $sql = mysqli_query($connection, "SELECT * FROM users WHERE {$where}");
  $i = 0;
  while($row = mysqli_fetch_assoc($sql)) {
    $to = $row['email'];
    $message = '------=_Part_1218195_2242574.1223844236223
    Content-Type: multipart/alternative; 
      boundary="----=_Part_1218194_9233741.1223844236223"

    ------=_Part_1218194_9233741.1223844236223
    Content-Type: text/plain; charset=ISO-8859-1
    Content-Transfer-Encoding: 7bit

    ' . preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", strip_tags(str_replace("<br />", "\n", str_replace("%name%", $row['name'], $header.$body.$footer)))).'

    ------=_Part_1218194_9233741.1223844236223
    Content-Type: text/html;charset=ISO-8859-1
    Content-Transfer-Encoding: 7bit

    '.str_replace("%name%", $row['name'], $header . $body . $footer).'

    ------=_Part_1218194_9233741.1223844236223--';
    mail($to, $subject, $message, $headers);
    $i++;
  }
  $msg = 'Attempted to send the newsletter to ' . $i . ' users.';
}

$template = '<h1 style="font-size: 13px; font-family: verdana,times,times new roman; color: rgb(71, 131, 157); padding-left: 20px;">Hi %name% from everyone at ' . $sitename . '!</h1>

<p style="font-family: Verdana; color: black; font-size: 12px; padding-left: 20px; padding-right: 20px;">
<br />This a sample message, edit it to your likings.</p>

<span style="font-family: Verdana;"></span>

<h1 style="font-size: 13px; font-family: verdana,times,times new roman; color: rgb(71, 131, 157); padding-left: 20px;"><a href="' . $path . '">Visit ' . $shortname . ' Now! &gt;&gt;</a></h1>';

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
          <form action="index.php?p=newsletter&do=publish" method="post" name="theAdminForm" id="theAdminForm">
            <div class="tableborder">
              <div class="tableheaderalt">Compose News Article</div>
              <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Subject</b>
                    <div class="graytext">The subject of the newsletter.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="subject" value="<?php echo $subject; ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>WHERE clause</b>
                    <div class="graytext">For advanced users, the WHERE clause of the MySQL query for getting users. DO NOT EDIT UNLESS YOU KNOW WHAT YOU ARE DOING!</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <input type="text" name="where" value="<?php echo (empty($where) ? 'newsletter = \'1\' AND email_verified = \'1\'' : $where); ?>" size="30" class="textinput">
                  </td>
                </tr>
                <tr>
                  <td class="tablerow1" width="40%" valign="middle"><b>Body</b>
                    <div class="graytext">The body of the newsletter. (Header and footer is already there!)
                      <br />HTML is allowed here. Use %name% for the user"s name.</div>
                  </td>
                  <td class="tablerow2" width="60%" valign="middle">
                    <textarea name="body" cols="60" rows="5" wrap="soft" id="sub_desc" class="multitext"><?php echo (empty($body) ? $template : $body); ?></textarea>
                  </td>
                </tr>
                <tr>
                  <td align="center" class="tablesubheader" colspan="2">
                    <input type="submit" value="Publish Newsletter" class="realbutton" accesskey="s">
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