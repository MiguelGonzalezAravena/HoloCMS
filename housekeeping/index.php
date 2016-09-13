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
$is_maintenance = true; // Tell the core to buzz off with it's maintenance

require_once(dirname(__FILE__) . '/../config.php');
require_once(dirname(__FILE__) . '/../core.php');

$hkzone = true;
$p = (isset($_GET['p']) ? FilterText($_GET['p']) : '');
$do = (isset($_GET['do']) ? FilterText($_GET['do']) : '');
$key = (isset($_GET['key']) ? (int) $_GET['key'] : '');

$starttime = explode(' ', microtime());
$starttime = $starttime[1] + $starttime[0];

if(isset($_SESSION['acp'])) {
  $session = $_SESSION['acp'];
  $admin_username = $_SESSION['hkusername'];
  $admin_password = $_SESSION['hkpassword'];

  $check = mysqli_query($connection, "SELECT id, rank FROM users WHERE name = '{$admin_username}' AND password = '{$admin_password}' AND rank > 5 LIMIT 1") or die(mysqli_error($connection));
  $valid = mysqli_num_rows($check);

  if($valid > 0) {
    $tmp = mysqli_fetch_assoc($check);
    $user_rank = $tmp['rank'];

    if($user_rank < 6) {
      exit;
    } // something went horribly wrong here

    if($p == 'content' || $p == 'server' || $p == 'badgetool' || $p == 'recycler' || $p == 'wordfilter' || $p == 'welcomemsg' || $p == 'maintenance' || $p == 'loader' || $p == 'news_manage' || $p == 'news_compose' || $p == 'ranktool' || $p == 'site' || $p == 'logs' || $p == 'edituser') {
      if($user_rank < 7) {
        $p = 'access_denied';
      }
    }

    switch ($p) {
      case 'logout':
        session_destroy();
        $notify_logout = true;
        require_once(dirname(__FILE__) . '/login.php');
        break;
      case 'recommendedm':
        $tab = 1;
        require_once(dirname(__FILE__) . '/recommendedm.php');
        break;
      case 'recommendede':
        $tab = 1;
        require_once(dirname(__FILE__) . '/recommendede.php');
        break;
      case 'dashboard':
        $tab = 1;
        require_once(dirname(__FILE__) . '/dashboard.php');
        break;
      case 'server':
        $tab = 2;
        require_once(dirname(__FILE__) . '/server.php');
        break;
      case 'massa_stuff':
        $tab = 5;
        require_once(dirname(__FILE__) . '/massa.php');
        break;
      case 'recycler':
        $tab = 2;
        require_once(dirname(__FILE__) . '/recycler.php');
        break;
      case 'wordfilter':
        $tab = 2;
        require_once(dirname(__FILE__) . '/wordfilter.php');
        break;
      case 'welcomemsg':
        $tab = 2;
        require_once(dirname(__FILE__) . '/welcomemsg.php');
        break;
      case 'holocms':
        $tab = 4;
        require_once(dirname(__FILE__) . '/holocms.php');
        break;
      case 'help':
        $tab = 6;
        require_once(dirname(__FILE__) . '/help_main.php');
        break;
      case 'help_bugs':
        $tab = 6;
        require_once(dirname(__FILE__) . '/help_bugs.php');
        break;
      case 'help_svn':
        $tab = 6;
        require_once(dirname(__FILE__) . '/help_svn.php');
        break;
      case 'site':
        $tab = 3;
        require_once(dirname(__FILE__) . '/cms_config.php');
        break;
      case 'maintenance':
        $tab = 3;       
        require_once(dirname(__FILE__) . '/maintenance.php');
        break;
      case 'loader':
        $tab = 3;
        require_once(dirname(__FILE__) . '/loader.php');
        break;
      case 'editor_guestroom':
        $tab = 5;
        require_once(dirname(__FILE__) . '/guestrooms.php');
        break;
      case 'editguestroom':
        $tab = 5;
        require_once(dirname(__FILE__) . '/edit_guestroom.php');
        break;
      case 'editor_publicrooms':
        $tab = 5;
        require_once(dirname(__FILE__) . '/publicrooms.php');
        break;
      case 'application_edit':
        $tab = 5;
        require_once(dirname(__FILE__) . '/appforms.php');
        break;
      case 'news_compose':
        $tab = 3;
        require_once(dirname(__FILE__) . '/news_compose.php');
        break;
      case 'collectables_edit':
        $tab = 3;
        require_once(dirname(__FILE__) . '/edit_collectables.php');
        break;
      case 'news_manage':
        $tab = 3;
        require_once(dirname(__FILE__) . '/news_manage.php');
        break;
      case 'users':
        $tab = 5;
        require_once(dirname(__FILE__) . '/users.php');
        break;
      case 'ip':
        $tab = 5;
        require_once(dirname(__FILE__) . '/ip.php');
        break;
      case 'clonechecker':
        $tab = 5;
        require_once(dirname(__FILE__) . '/cloner.php');
        break;
      case 'transactions':
        $tab = 5;
        require_once(dirname(__FILE__) . '/transactions.php');
        break;
      case 'collectables':
        $tab = 3;
        require_once(dirname(__FILE__) . '/collectables.php');
        break;
      case 'faq':
        $tab = 3;
        require_once(dirname(__FILE__) . '/faq.php');
        break;
      case 'newsletter':
        $tab = 3;
        require_once(dirname(__FILE__) . '/newsletter.php');
        break;
      case 'vouchers':
        $tab = 5;
        require_once(dirname(__FILE__) . '/vouchers.php');
        break;
      case 'givecredits':
        $tab = 5;
        require_once(dirname(__FILE__) . '/givecredits.php');
        break;
      case 'helper':
        $tab = 5;
        require_once(dirname(__FILE__) . '/helper.php');
        break;
      case 'ranktool':
        $tab = 5;
        require_once(dirname(__FILE__) . '/ranktool.php');
        break;
      case 'badgetool':
        $tab = 5;
        require_once(dirname(__FILE__) . '/badgetool.php');
        break;
      case 'logs':
        $tab = 5;
        require_once(dirname(__FILE__) . '/logs.php');
        break;
      case 'credits':
        $tab = 4;
        require_once(dirname(__FILE__) . '/credits.php');
        break;
      case 'banners':
        $tab = 3;
        require_once(dirname(__FILE__) . '/banners.php');
        break;
      case 'ban':
        $tab = 5;
        require_once(dirname(__FILE__) . '/bantool.php');
        break;
      case 'uid':
        $tab = 5;
        require_once(dirname(__FILE__) . '/uid.php');
        break;
      case 'access_denied':
        $tab = 0;
        require_once(dirname(__FILE__) . '/access_denied.php');
        break;
      case 'content':
        $tab = 3;
        require_once(dirname(__FILE__) . '/content_tool.php');
        break;
      case 'add_homes':
        $tab = 3;
        require_once(dirname(__FILE__) . '/add_homes_stuff.php');
        break;
      case 'banlist':
        $tab = 5;
        require_once(dirname(__FILE__) . '/banlist.php');
        break;
      case 'unban':
        $tab = 5;
        require_once(dirname(__FILE__) . '/unbantool.php');
        break;
      case 'alert':
        $tab = 5;
        require_once(dirname(__FILE__) . '/alert.php');
        break;
      case 'massalert':
        $tab = 5;
        require_once(dirname(__FILE__) . '/massalert.php');
        break;
      case 'alertlist':
        $tab = 5;
        require_once(dirname(__FILE__) . '/alertlist.php');
        break;
      case 'massmail':
        $tab = 5;
        require_once(dirname(__FILE__) . '/massmail.php');
        break;
      case 'minimail':
        $tab = 5;
        require_once(dirname(__FILE__) . '/minimail.php');
        break;
      case 'onlinelist':
        $tab = 5;
        require_once(dirname(__FILE__) . '/onlinelist.php');
        break;
      case 'chatlogs':
        $tab = 5;
        require_once(dirname(__FILE__) . '/chatlogs.php');
        break;
      case 'dboptimize':
        if($sysadmin == $my_id) {
          $tab = 3;
          require_once(dirname(__FILE__) . '/dboptimize.php');
        } else {
          $tab = 0;
          require_once(dirname(__FILE__) . '/access_denied.php');
        }
        break;
      case 'dbrepair':
        if($sysadmin == $my_id) {
          $tab = 3;
          require_once(dirname(__FILE__) . '/dbrepair.php');
        } else {
          $tab = 0;
          require_once(dirname(__FILE__) . '/access_denied.php');
        }
        break;
      case 'dbquery':
        if($sysadmin == $my_id) {
          $tab = 3;
          require_once(dirname(__FILE__) . '/dbquery.php');
        } else {
          $tab = 0;
          require_once(dirname(__FILE__) . '/access_denied.php');
        }
        break;
      case 'edituser':
        $tab = 5;
        require_once(dirname(__FILE__) . '/edituser.php');
        break;      
      default:
        $tab = 0;
        header('Location: index.php?p=dashboard');
        break;
    }
  } else {
    session_destroy();
    header('Location: index.php');
  }
} else {
  require_once(dirname(__FILE__) . '/login.php');
}

require_once(dirname(__FILE__) . '/footer.php');
?>