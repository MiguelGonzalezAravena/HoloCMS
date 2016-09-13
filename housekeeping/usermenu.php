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
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> User Management</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=users" style="text-decoration:none;<?php echo ($p == 'users' ? 'font-weight: bold;' : ''); ?>">User Listing</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=edituser&do=getUser" style="text-decoration:none;<?php echo ($p == 'edituser' ? 'font-weight: bold;' : ''); ?>">Edit User</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=ip" style="text-decoration:none;<?php echo ($p == 'ip' ? 'font-weight: bold;' : ''); ?>">Retrive IP Address</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=uid" style="text-decoration:none;<?php echo ($p == 'uid' ? 'font-weight: bold;' : ''); ?>">Retrive User ID</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=clonechecker" style="text-decoration:none;<?php echo ($p == 'clonechecker' ? 'font-weight: bold;' : ''); ?>">Clone Checker</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=ranktool" style="text-decoration:none;<?php echo ($p == 'ranktool' ? 'font-weight: bold;' : ''); ?>">Manage User Ranks</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=badgetool" style="text-decoration:none;<?php echo ($p == 'badgetool' ? 'font-weight: bold;' : ''); ?>">Give User Badge</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=massa_stuff" style="text-decoration:none;<?php echo ($p == 'massa_stuff' ? 'font-weight: bold;' : ''); ?>">Massa stuff</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Editors</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=editor_guestroom" style="text-decoration:none;<?php echo ($p == 'editor_guestroom' ? 'font-weight: bold;' : ''); ?>">Guestroom editor</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=editor_publicrooms" style="text-decoration:none;<?php echo ($p == 'editor_publicrooms' ? 'font-weight: bold;' : ''); ?>">Publicroom editor</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=editor_categoriesh" style="text-decoration:none;<?php echo ($p == 'editor_categoriesh' ? 'font-weight: bold;' : ''); ?>">Category editor - hotel</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=editor_categorieshh" style="text-decoration:none;<?php echo ($p == 'editor_categorieshh' ? 'font-weight: bold;' : ''); ?>">Category editor - homes</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=editor_ads" style="text-decoration:none;<?php echo ($p == 'editor_ads' ? 'font-weight: bold;' : ''); ?>">Public Room ads editor</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=editor_deals" style="text-decoration:none;<?php echo ($p == 'editor_deals' ? 'font-weight: bold;' : ''); ?>">"Deals" editor (catalogue)</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=editor_catalogue" style="text-decoration:none;<?php echo ($p == 'editor_catalogue' ? 'font-weight: bold;' : ''); ?>">Recycler editor</a>
    </div>
  </div>
  <br />
  <?php /* ?>
    <div class="menuouterwrap">
      <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Application management</div>
      <div class="menulinkwrap">&nbsp;
        <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
        <a href="./index.php?p=application_edit" style="text-decoration:none;<?php echo ($p == 'application_edit' ? 'font-weight: bold;' : ''); ?>">Application forms</a>
      </div>
      <div class="menulinkwrap">&nbsp;
        <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
        <a href="./index.php?p=applications" style="text-decoration:none;<?php echo ($p == 'applications' ? 'font-weight: bold;' : ''); ?>">Read and answer to application <b>(2)</b></a>
      </div>
    </div>
    <br />
    <?php */ ?>
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Credits</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=transactions" style="text-decoration:none;<?php echo ($p == 'transactions' ? 'font-weight: bold;' : ''); ?>">Transaction logs</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=vouchers" style="text-decoration:none;<?php echo ($p == 'vouchers' ? 'font-weight: bold;' : ''); ?>">Voucher Management</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=givecredits" style="text-decoration:none;<?php echo ($p == 'givecredits' ? 'font-weight: bold;' : ''); ?>">Give Credits / Refunds</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Moderation</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=ban" style="text-decoration:none;<?php echo ($p == 'ban' ? 'font-weight: bold;' : ''); ?>">Remote Banning</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=unban" style="text-decoration:none;<?php echo ($p == 'unban' ? 'font-weight: bold;' : ''); ?>">Unbanning</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=alert" style="text-decoration:none;<?php echo ($p == 'alert' ? 'font-weight: bold;' : ''); ?>">Site/Remote Alert</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=massalert" style="text-decoration:none;<?php echo ($p == 'massalert' ? 'font-weight: bold;' : ''); ?>">Mass Site/Remote Alert</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=minimail" style="text-decoration:none;<?php echo ($p == 'minimail' ? 'font-weight: bold;' : ''); ?>">Send minimail</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=massmail" style="text-decoration:none;<?php echo ($p == 'massmail' ? 'font-weight: bold;' : ''); ?>">Mass minimail</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Customer Support</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=helper" style="text-decoration:none;<?php echo ($p == 'helper' ? 'font-weight: bold;' : ''); ?>">Help Queries</a>
    </div>
  </div>
  <br />
  <div class="menuouterwrap">
    <div class="menucatwrap"><img src="./images/menu_title_bullet.gif" style="vertical-align:bottom" border="0" /> Logs & Statistics</div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=logs" style="text-decoration:none;<?php echo ($p == 'logs' ? 'font-weight: bold;' : ''); ?>">Staff Logs</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=banlist" style="text-decoration:none;<?php echo ($p == 'banlist' ? 'font-weight: bold;' : ''); ?>">Ban Listing</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=alertlist" style="text-decoration:none;<?php echo ($p == 'alertlist' ? 'font-weight: bold;' : ''); ?>">Alert Listing</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=chatlogs" style="text-decoration:none;<?php echo ($p == 'chatlogs' ? 'font-weight: bold;' : ''); ?>">Chatlogs</a>
    </div>
    <div class="menulinkwrap">&nbsp;
      <img src="./images/item_bullet.gif" border="0" alt="" valign="absmiddle">&nbsp;
      <a href="./index.php?p=onlinelist" style="text-decoration:none;<?php echo ($p == 'onlinelist' ? 'font-weight: bold;' : ''); ?>">Online Users</a>
    </div>
  </div>
  <br />