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
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
?>
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="<?php echo $housekeeping; ?>images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Help Topics</div>
    <div class="menulinkwrap">&nbsp;
      <img src="<?php echo $housekeeping; ?>images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="index.php?p=help" style="text-decoration: none; font-weight: <?php echo ($p == 'help' ? 'bold' : 'normal'); ?>">Main Page</a>
    </div>
    <div class="menulinkwrap ">&nbsp;
      <img src="<?php echo $housekeeping; ?>images/item_bullet.gif " border="0 " alt="" valign="absmiddle">&nbsp;
      <a href="index.php?p=help_bugs" style="text-decoration: none; font-weight: <?php echo ($p == 'help_bugs' ? 'bold' : 'normal'); ?>">Found a bug?</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="<?php echo $housekeeping; ?>images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="index.php?p=help_svn" style="text-decoration: none; font-weight: <?php echo ($p == 'help_svn' ? 'bold' : 'normal'); ?>">SVN Releases</a>
    </div>
  </div>
  <br />
