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

$pagename = 'HoloCMS';

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="100%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <div id="acp-update-wrapper">
            <div class="homepage_pane_border" id="acp-update-normal">
              <div class="homepage_section">HoloCMS</div>
              <div style="font-size:12px;padding:4px; text-align:left">
                <p>
                  <div align="center">
                    <img src="./images/holocms-logo.png" border="0" alt="HoloCMS"><br />
                    v<?php echo $holocms['version']; ?> <?php echo $holocms['stable']; ?> <br />
                    Codename '<?php echo $holocms['title']; ?>'<br />
                    <br />
                  </div>
                  <br />
                  <br /> HoloCMS is web interface for Holograph Emulator, or, to promote it a little: HoloCMS a free, advanced and complete website and content management solution for Holograph Emulator, published under the <a href="http://creativecommons.org/licenses/by-nc-nd/3.0/" target="_blank">Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 Unported license</a>. Current development is handled by Miguel González Aravena.
                  <br />
                  <br />Should you be interested in contributing to HoloCMS in any way whatsoever, please contact us.
                  <br />
                  <br /><b>If you paid for this, go get your money back.</b>
                </p>
                <p>
                  <strong>HoloCMS Version:</strong> <?php echo $holocms['version']; ?> <?php echo $holocms['stable']; ?> [<?php echo $holocms['title']; ?>]<br />
                  <strong>HoloCMS Build Date:</strong> <?php echo $holocms['date']; ?><br />
                  <strong>Holograph Emulator Compatability:</strong> Build for <a href="http://trac2.assembla.com/holograph/changeset/<?php echo $holograph['revision']; ?>" target="_blank">Revision <?php echo $holograph['revision']; ?></a> (<?php echo $holograph['type']; ?>)
                </p>
                <p>
                  <strong><a href="index.php?p=credits">Development Credits</a></strong>
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