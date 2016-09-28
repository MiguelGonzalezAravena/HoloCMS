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

$gosend = isset($_POST['gosend']) ? FilterText($_POST['gosend']) : '';
$post = (isset($_POST['post']) ? (int) $_POST['post'] : (isset($_GET['post']) ? (int) $_GET['post'] : 0));
$lang = isset($_GET['lang']) ? FilterText($_GET['lang']) : '';
$sure = isset($_GET['sure']) ? FilterText($_GET['sure']) : '';
$page = isset($_GET['page']) ? (int) $_GET['page'] : 1;
$country = isset($_GET['country']) ? FilterText($_GET['country']) : '';
$subject = isset($_POST['subject']) ? FilterText($_POST['subject']) : '';
$message = isset($_POST['message']) ? FilterText($_POST['message']) : '';
$disableform = 0;

if(empty($gosend) && empty($post)) {
  // Let's give the URL that pointless help tool feeling
  if(empty($lang)) {
    header('Location: go.php?lang=en&country=uk');
  } else if($lang != 'en') {
    header('Location: go.php?lang=en&country=uk');
  } else if($country != 'uk') {
    header('Location: go.php?lang=en&country=uk');
  }
}

require_once(dirname(__FILE__) . '/header.php');

if(!empty($gosend)) {
  if(empty($subject) || empty($message)) {
    $result = 'Please do not leave any fields blank';
  } else {
    $sql2 = mysqli_query($connection, "SELECT * FROM cms_help WHERE ip = '{$remote_ip}' and picked_up = '0' LIMIT 1");
    $num2 = mysqli_num_rows($sql2);
    if($num2 == 0) {
      $result = 'Ticket submitted. We will get back to you shortly, please be patient as this might take a while. Note that you cannot send any more support requests untill this support ticket is picked up.';
      $disableform = 1;
      $go_sql = mysqli_query($connection, "INSERT INTO cms_help(username, message, subject, ip, date, picked_up) VALUES('{$rawname}', '{$message}', '{$subject}', '{$remote_ip}', '{$date_full}', '0')") or die(mysqli_error($connection));
    } else {
      $result = 'Unable to submit support request: you still have a pending support request. Please try again later.';
      $disableform = 1;
    }
  }
}

if(!empty($post)) {
  $sql2 = mysqli_query($connection, "SELECT * FROM cms_help WHERE ip = '{$remote_ip}' and picked_up = '0' LIMIT 1");
  $num2 = mysqli_num_rows($sql2);
  $sql3 = mysqli_query($connection, "SELECT * FROM cms_forum_posts WHERE id = '{$post}' LIMIT 1");
  $exists = mysqli_num_rows($sql3);
  if($exists > 0) {
    $row3 = mysqli_fetch_assoc($sql3);
  }

  if($num2 == 0) {
    if($sure == 'yes' && $exists > 0) {
      $result = 'Thank you for reporting this post.';
      $disableform = 1;
      $go_sql = mysqli_query($connection, "INSERT INTO cms_help(username, message, subject, ip, date, picked_up) VALUES('{$rawname}', 'This user has reported an post on the Discussion Board. The Post ID is {$post},  in thread {$row3['threadid']}.\n\nOriginal Message\n-----------------------------------\n" . FilterText($row3['message']) . "\n\nURL:\n-----------------------------------\n{$path}viewthread.php?thread={$row3['threadid']}&page={$page}#post-{$row3['id']}', 'DISCUSSION BOARD - REPORTED POST', '{$remote_ip}', '{$date_full}', '0')") or die(mysqli_error($connection));
    } elseif($exists < 1) {
      $result = 'Invalid post specified';
      $disableform = 1;
    } else {
      $result = 'Is the post you have selected offensive or breaking the rules? Are you sure you want to report this post?<br /><br /><a href="' . $path . 'iot/go.php?do=report&post=' . $post . '&page=' . $page . '&sure=yes">Proceed</a>';
      $disableform = 1;
    }
  } else {
    $result = 'Unable to report post: you still have a pending support request. Please try again later. Note that post reports also count as support requests.';
    $disableform = 1;
  }
}
?>
  <div style="height: 4px;"></div>
  <div style="height: 18px; padding: 0 0 0 12px;">&nbsp;</div>
  <div class="portlet">
    <div class="portlet-top-process">
      <div class="portlet-process-header">&nbsp;</div>
    </div>
    <div class="portlet-body-process">
      <div class="imaindiv">
        <form method="post" action="<?php echo $path; ?>go.php">
          <input type="hidden" name="sid" value="55">
          <table border="0" cellspacing="0" cellpadding="0" class="ihead">
            <tr>
              <td class="icon"><img src="<?php echo $path; ?>/iot/header_images/Western2/1.gif" alt="" width="47" height="37" /></td>
              <td class="text">
                <h2>Ask your question</h2></td>
            </tr>
          </table>
          <br />
          <table border="0" cellspacing="0" cellpadding="0" class="content-table">
            <tr>
              <td>
                <div class="iinfodiv">
                  You can contact Player Support through this form. They will get back to you as soon as possible. If it's urgent, you may also use the Call For Help system ingame.
                  <br />
                  <br />
                  <?php if(!empty($result)) { ?>
                  <b><?php echo $result; ?></b><br /><br />
                  <?php } ?>
                  <?php if($disableform != 1) { ?>
                    Subject:<br />
                    <input type="text" name="subject" size="50" maxlength="50" value="" /><br />
                    Your question/problem:<br />
                    <textarea name="message" class="imessageform"></textarea>
                <?php } ?>
                </div>
                  <br />
              </td>
            </tr>
          </table>
          <div style="float:right;">
            <table height="21" border="0" cellpadding="0" cellspacing="0" class="button">
              <?php if($disableform != 1) { ?>
              <tr>
                <td class="button-left-side"></td>
                <td class="middle">
                  <input type="submit" class="proceedbutton" name="gosend" value="Proceed" />
                </td>
                <td class="button-right-side-arrow"></td>
              </tr>
              <?php } else { ?>
              <tr>
                <td class="button-left-side"></td>
                <td class="middle">
                  <input type="button" class="proceedbutton" onclick="javascript:window.close()" value="Close" />
                </td>
                <td class="button-right-side-arrow"></td>
              </tr>
              <?php } ?>
            </table>
          </div>
        </form>
      </div>
    </div>
    <div class="portlet-bottom-process"></div>
  </div>
  </div>
  <?php require_once(dirname(__FILE__) . '/footer.php'); ?>