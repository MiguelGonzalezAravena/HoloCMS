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

$pagename = 'Help Centre';

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="22%" valign="top" id="leftblock">
        <div>
          <!-- LEFT CONTEXT SENSITIVE MENU -->
          <?php @require_once(dirname(__FILE__) . '/helpmenu.php'); ?>
          <!-- / LEFT CONTEXT SENSITIVE MENU -->
        </div>
      </td>
      <td width="78%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <div id="acp-update-wrapper">
            <div class="homepage_pane_border" id="acp-update-normal">
              <div class="homepage_section">Help Centre - Bugs</div>
              <div style="font-size:12px;padding:4px; text-align:left">
                <p>
                  If you found a bug within HoloCMS, the first thing to do is to verify if it's actually an bug; is it not a mistake you could've made? Are you the only one expiriencing the problem?
                  <br />
                  <br /> Once you have verified that it is actually an bug you're dealing with, hop over to <a href="http://forum.ragezone.com/f282" target="_blank">RaGEZONE</a>, and locate the <a href="http://forum.ragezone.com/f353/rel-dev-holocms-revolution-new-holograph-emulator-net-374981/" target="_blank">HoloCMS Development thread</a>. First thing to do, is make sure that the bug has not yet been reported. If it is an known bug, there is no need to report it AGAIN. If you are sure that it's an geniune bug and that it has not been reported before, simply reply in the thread clearly stating the bug.
                  <br />
                  <br /> Obviously the bug will be solved as soon as possible once we are aware of it. Also, thanks in advance, if you report an bug!
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