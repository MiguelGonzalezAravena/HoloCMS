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
              <div class="homepage_section">Help Centre - SVN Releases</div>
              <div style="font-size:12px;padding:4px; text-align:left">
                <p>
                  All full (and mostly stable) releases are provided to the users in downloadable RAR format and are reccommended as primary solution, but we also provide Development Versions on a SVN (Subversion) Repository. They can be downloaded easily with an SVN Client.
                  <br />
                  <br /> Although the SVN releases usually contain more and/or improved features, they are generally also less stable and not fully finished/user-ready yet. Therefore we reccommend the SVN versions to developers and others who are interested only. None of the SVN releases are intended for live usage, and no support is given.
                  <br />
                  <br /> Whilst using SVN releases, keep the following in mind:
                  <br /> - The version number may not increase, do not rely on it when, for example, checking for updates
                  <br /> - Zero support is given for SVN
                  <br /> - SVN Releases are not intended for live usage whatsoever
                  <br /> - We can not guarentee you anything will work properly on SVN releases, although the same goes up for stable releases
                  <br />
                  <br /> Should you still be interested in SVN releases, please refer to RaGEZONE for more information.
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
