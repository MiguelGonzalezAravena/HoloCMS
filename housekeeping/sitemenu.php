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
$category = isset($_GET['category']) ? (int) $_GET['category'] : 0;
?>
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Configuration & Setup</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=site" style="text-decoration:none;<?php echo ($p == 'site' ? 'font-weight: bold;' : ''); ?>">General Configuration</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=maintenance" style="text-decoration:none;<?php echo ($p == 'maintenance' ? 'font-weight: bold;' : ''); ?>">Turn your site on/off</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=loader" style="text-decoration:none;<?php echo ($p == 'loader' ? 'font-weight: bold;' : ''); ?>">Loader Configuration</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Collectables</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=collectables" style="text-decoration:none;<?php echo ($p == 'collectables' ? 'font-weight: bold;' : ''); ?>">Collectables over-view</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=collectables_edit&a=add" style="text-decoration:none;<?php echo ($p == 'collectables_edit' ? 'font-weight: bold;' : ''); ?>">Add collectables</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Recommended Items</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=recommendedm" style="text-decoration:none;<?php echo ($p == 'recommendedm' ? 'font-weight: bold;' : ''); ?>">Manage Recommended Items</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=recommendede" style="text-decoration:none;<?php echo ($p == 'recommendede' ? 'font-weight: bold;' : ''); ?>">Add Recommended Items</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Content Management</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=content" style="text-decoration:none;<?php echo ($p == 'content' && empty($category) ? 'font-weight: bold;' : ''); ?>">Manage Site Content</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=banners" style="text-decoration:none;<?php echo ($p == 'banners' ? 'font-weight: bold;' : ''); ?>">Manage Site Banners</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=add_homes" style="text-decoration:none;<?php echo ($p == 'add_homes' ? 'font-weight: bold;' : ''); ?>">Add stickers, backgrounds to homes catalogue</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=faq" style="text-decoration:none;<?php echo ($p == 'faq' ? 'font-weight: bold;' : ''); ?>">Manage FAQ Items</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=newsletter" style="text-decoration:none;<?php echo ($p == 'newsletter' ? 'font-weight: bold;' : ''); ?>">Compose Newsletter</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=content&category=5&do=jumpCategory" style="text-decoration:none;<?php echo ($p == 'content' && $category == 5 ? 'font-weight: bold;' : ''); ?>">Newsletter settings</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=news_compose" style="text-decoration:none;<?php echo ($p == 'news_compose' ? 'font-weight: bold;' : ''); ?>">Compose News Item</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=news_manage" style="text-decoration:none;<?php echo ($p == 'news_manage' ? 'font-weight: bold;' : ''); ?>">Manage Existing News Items</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Database Tools</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=dboptimize" style="text-decoration:none;<?php echo ($p == 'dboptimize' ? 'font-weight: bold;' : ''); ?>">Optimize Tables</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=dbrepair" style="text-decoration:none;<?php echo ($p == 'dbrepair' ? 'font-weight: bold;' : ''); ?>">Check/Repair Tables</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=dbquery" style="text-decoration:none;<?php echo ($p == 'dbquery' ? 'font-weight: bold;' : ''); ?>">Database Query</a>
    </div>
  </div>
  <br />