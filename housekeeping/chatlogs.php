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

$pagename = 'Chat Log Viewer';
$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
$results = '';
if(!empty($query)) {
  $get_logs = mysqli_query($connection, "SELECT * FROM system_chatlog WHERE roomid = '{$query}' OR username = '{$query}' ORDER BY mtime DESC") or die(mysqli_error($connection));
  $results = mysqli_num_rows($get_logs);

  if($results > 0) {
    $msg = 'Now showing chat logs..';
  } else {
    $msg = 'Nothing found.';
  }
}

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
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
          <?php if(!empty($msg)){ ?>
            <p><strong><?php echo $msg; ?></p></strong>
              <?php } ?>
                <form action="index.php?p=chatlogs&do=search" method="post" name="theAdminForm" id="theAdminForm">
                  <div class="tableborder">
                    <div class="tableheaderalt">Chat Log Search</div>
                    <table width="100%" cellspacing="0" cellpadding="5" align="center" border="0">
                      <tr>
                        <td class="tablerow1" width="40%" valign="middle"><strong>Room ID</strong> OR <strong>Username</strong>
                          <div class="graytext">Search string for the chat log viewer</a>.</div>
                        </td>
                        <td class="tablerow2" width="60%" valign="middle">
                          <input type="text" name="query" value="<?php echo $query; ?>" size="30" class="textinput">
                        </td>
                      </tr>
                      <tr>
                        <tr>
                          <td align="center" class="tablesubheader" colspan="2">
                            <input type="submit" value="Retrive logs" class="realbutton" accesskey="s">
                          </td>
                        </tr>
                </form>
                </table>
                </div>
                <br />
                <?php if($results > 0) { ?>
                  <div class="tableborder">
                    <div class="tableheaderalt">Search Results</div>
                    <table cellpadding="4" cellspacing="0" width="100%">
                      <tr>
                        <td class="tablesubheader" width="25%" align="center">Username</td>
                        <td class="tablesubheader" width="10%" align="center">Room ID</td>
                        <td class="tablesubheader" width="15%" align="center">Time</td>
                        <td class="tablesubheader" width="50%" align="center">Message</td>
                      </tr>
                      <?php
                        while($row = mysqli_fetch_assoc($get_logs)) {
                          printf("<tr>
                          <td class='tablerow1' align='center'>%s</td>
                          <td class='tablerow2' align='center'>%s</td>
                          <td class='tablerow2' align='center'>%s</td>
                          <td class='tablerow2' align='center'>%s</td>
                          </tr>", $row['username'], $row['roomid'], $row['mtime'], HoloText($row['message']));
                        }
                      ?>
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
  <div align="center">
    <br />
    <?php
      $mtime = explode(' ', microtime());
      $totaltime = $mtime[0] + $mtime[1] - $starttime;
      printf('Time: %.3f', $totaltime);
    ?>
  </div>