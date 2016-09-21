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

$pagename = 'Help Centre';

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="22%" valign="top" id="leftblock">
        <div>
          <!-- LEFT CONTEXT SENSITIVE MENU -->
          <?php require_once(dirname(__FILE__) . '/helpmenu.php'); ?>
          <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <div id="acp-update-wrapper">
            <div class="homepage_pane_border" id="acp-update-normal">
              <div class="homepage_section">Help Centre - Main Page</div>
              <div style="font-size:12px;padding:4px; text-align:left">
                <p>
                  Welcome to the <b>Help Centre</b>. On the following pages we will treat several subjects you might require help with. Most of the help topics are frequently asked questions or other topics we thought could be usefull whilst using and setting up HoloCMS and it's housekeeping.
                  <br />
                  <br />Should, however, the Help Centre not supply enough information and/or support, you can always ask your question on <a href="http://forum.ragezone.com/f282" target="_blank">RaGEZONE</a> -- that's where the experts on this subject hang out ... as well as the idiots.
                  <br />
                  <br />What ever the reason your visit to this tab may be, I hope the Help Centre can help you out.
                </p>
              </div>
            </div>
          </div>
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