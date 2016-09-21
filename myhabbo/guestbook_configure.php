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
require_once(dirname(__FILE__) . '/../includes/session.php');

$id = isset($_POST['widgetId']) ? (int) $_POST['widgetId'] : 0;

$sql = mysqli_query($connection, "SELECT * FROM cms_homes_stickers WHERE id = '{$id}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);
$var = ($row['var'] == 0) ? 1 : 0;
mysqli_query($connection, "UPDATE cms_homes_stickers SET var = '{$var}' WHERE id = '{$id}' LIMIT 1");
?>
var el = $('guestbook-type');
if(el) {
  if(el.hasClassName('public')) {
    el.className = 'private';
    new Effect.Pulsate(el, {
      duration: 1.0,
      afterFinish: function() {
        Element.setOpacity(el, 1);
      }
    });
  } else {
    new Effect.Pulsate(el, {
      duration: 1.0,
      afterFinish: function() {
        Element.setOpacity(el, 0);
        el.className = 'public';
      }
    });
  }
}