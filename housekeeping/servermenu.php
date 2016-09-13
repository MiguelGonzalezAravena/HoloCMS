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
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
?>
 <div class="menuouterwrap">
  <div class="menucatwrap"><img src="<?php echo $housekeeping; ?>images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Server Configuration</div>

<div class="menulinkwrap">&nbsp;
<img src="<?php echo $housekeeping; ?>images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
<a href="./index.php?p=server" style="text-decoration:none;<?php echo ($p == 'server' ? 'font-weight: bold;' : ''); ?>">General Configuration</a>
</div>

<div class="menulinkwrap">&nbsp;
<img src="<?php echo $housekeeping; ?>images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
<a href="./index.php?p=recycler" style="text-decoration:none;<?php echo ($p == 'recycler' ? 'font-weight: bold;' : ''); ?>">Recycler Options</a>
</div>

<div class="menulinkwrap">&nbsp;
<img src="<?php echo $housekeeping; ?>images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
<a href="./index.php?p=wordfilter" style="text-decoration:none;<?php echo ($p == 'wordfilter' ? 'font-weight: bold;' : ''); ?>">Wordfilter Options</a>
</div>

<div class="menulinkwrap">&nbsp;
<img src="<?php echo $housekeeping; ?>images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
<a href="./index.php?p=welcomemsg" style="text-decoration:none;<?php echo ($p == 'welcomemsg' ? 'font-weight: bold;' : ''); ?>">Welcome Message Options</a>
</div>

</div>
<br />