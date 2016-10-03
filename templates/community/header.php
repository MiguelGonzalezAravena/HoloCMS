<?php
/*===================================================+
|| # HoloCMS - Website and Content Management System
|+===================================================+
|| # Copyright © 2016 Miguel González Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+===================================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+===================================================*/
(!defined('IN_HOLOCMS')) ? header('Location: index.php') : '';
require_once(dirname(__FILE__) . '/../../locale/' . $language . '/maintenance.php');

$body_id = isset($body_id) ? $body_id : 'home';
?>
  <body id="<?php echo $body_id; ?>" class="<?php echo (!$logged_in ? 'anonymous' : ''); ?>">
    <div id="overlay"></div>
    <div id="header-container">
      <div id="header" class="clearfix">
        <h1><a href="index.php"></a></h1>
        <div id="subnavi">
          <div id="subnavi-user">
            <?php if($logged_in) { ?>
            <ul>
              <li id="myfriends"><a href="#"><span>My Friends</span></a><span class="r"></span></li>
              <li id="mygroups"><a href="#"><span>My Groups</span></a><span class="r"></span></li>
              <li id="myrooms"><a href="#"><span>My Rooms</span></a><span class="r"></span></li>
            </ul>
            <?php } elseif(!$logged_in) { ?>
            <div class="clearfix">&nbsp;</div>
            <p>
              <a href="<?php echo $path; ?>client.php" id="enter-hotel-open-medium-link" target="client" onclick="openOrFocusHabbo(this); return false;">Enter <?php echo $sitename; ?></a>
            </p>
            <?php } ?>
            <?php if($online == 'online' && $logged_in) { ?>
            <a href="<?php echo $path; ?>client.php" id="enter-hotel-open-medium-link" target="client" onclick="openOrFocusHabbo('client.php'); return false;">Enter <?php echo $sitename; ?></a>
            <?php } else if($logged_in) { ?>
            <div id="hotel-closed-medium"><?php echo $sitename; ?> is offline</div>
            <?php } ?>
          </div>
          <?php if(!$logged_in) { ?>
          <div id="subnavi-login">
            <form action="<?php echo $path; ?>index.php?anonymousLogin" method="post" id="login-form">
              <input type="hidden" name="page" value="<?php echo $pageid; ?>" />
              <ul>
                <li>
                  <label for="login-username" class="login-text"><b>Username</b></label>
                  <input tabindex="1" type="text" class="login-field" name="username" id="login-username" />
                  <a href="#" id="login-submit-new-button" class="new-button" style="float: left; display:none"><b>Sign in</b><i></i></a>
                  <input type="submit" id="login-submit-button" value="Sign in" class="submit" />
                </li>
                <li>
                  <label for="login-password" class="login-text"><b>Password</b></label>
                  <input tabindex="2" type="password" class="login-field" name="password" id="login-password" />
                  <input tabindex="3" type="checkbox" name="_login_remember_me" value="true" id="login-remember-me" />
                  <label for="login-remember-me" class="left">Remember me</label>
                </li>
              </ul>
            </form>
            <div id="subnavi-login-help" class="clearfix">
              <ul>
                <li class="register"><a href="forgot.php" id="forgot-password"><span>I forgot my password/username</span></a></li>
                <li><a href="register.php"><span>Register for free</span></a></li>
              </ul>
            </div>
            <div id="remember-me-notification" class="bottom-bubble" style="display:none;">
              <div class="bottom-bubble-t">
                <div></div>
              </div>
              <div class="bottom-bubble-c">
                By selecting 'remember me' you will stay signed in on this computer until you click 'Sign Out'. If this is a public computer please do not use this feature.
              </div>
              <div class="bottom-bubble-b">
                <div></div>
              </div>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          LoginFormUI.init();
          RememberMeUI.init('right');
        </script>
        <?php } else { ?>
        <div id="subnavi-search">
          <div id="subnavi-search-upper">
            <ul id="subnavi-search-links">
              <li><a href="<?php echo $path; ?>help.php" target="habbohelp" onclick="openOrFocusHelp(this); return false">Help</a></li>
              <li><a href="<?php echo $path; ?>logout.php?reason=site" class="userlink">Sign Out</a></li>
            </ul>
          </div>
          <form name="tag_search_form" action="user_profile.php" class="search-box clearfix">
            <a id="search-button" class="new-button search-icon" href="#" onclick="$('search-button').up('form').submit(); return false;"><b><span></span></b><i></i></a>
            <input type="text" name="tag" id="search_query" value="User Profile.." class="search-box-query search-box-onfocus" style="float: right" />
          </form>
          <script type="text/javascript">
            SearchBoxHelper.init();
          </script>
        </div>
      </div>
      <script type="text/javascript">
        L10N.put('purchase.group.title', 'Create a group');
      </script>
      <?php } ?>
        <ul id="navi">
          <?php if($pageid > 0 && $pageid < 4 || $pageid == 'myprofile' && $logged_in) { ?>
          <li class="selected"><strong><?php echo $name; ?></strong><span></span></li>
          <?php } elseif($logged_in) { ?>
          <li class=""><a href="<?php echo $path; ?>index.php"><?php echo $name; ?></a><span></span></li>
          <?php } elseif(!$logged_in) { ?>
          <li id="tab-register-now"><a href="<?php echo $path; ?>register.php" target="_self">Register now!</a><span></span></li>
          <?php
            }

            if($pageid == 4 || $pageid > 3  && $pageid < 6 || $pageid == 'profile' || $pageid == 'com' || $pageid == 8 || $pageid == 'forum') {
          ?>
          <li class="selected"><strong>Community</strong><span></span></li>
          <?php } else { ?>
          <li class=""><a href="<?php echo $path; ?>community.php">Community</a><span></span></li>
          <?php
            }

            if($pageid == 6 || $pageid > 5  && $pageid < 8 || $pageid == 'collectables') {
          ?>
          <li class="selected"><strong>Credits</strong><span></span></li>
          <?php } else { ?>
          <li class=""><a href="<?php echo $path; ?>credits.php">Credits</a><span></span></li>
          <?php
            }

            if($user_rank > 5 && $logged_in == true) {
          ?>
          <li id="tab-register-now"><a href="<?php echo $path; ?>housekeeping/" target="_blank"><b>Housekeeping</b></a><span></span></li>
          <?php } ?>
        </ul>
        <div id="habbos-online">
          <div class="rounded"><span><?php echo $online_count; ?> <?php echo $shortname; ?>s online now</span></div>
        </div>
    </div>
    </div>
    <div id="content-container">
      <div id="navi2-container" class="pngbg">
        <div id="navi2" class="pngbg clearfix">
          <ul>
            <?php
              if($pageid > 0 && $pageid < 4 || $pageid == 'myprofile') {
            ?>
            <li class="<?php echo ($pageid == 1 ? 'selected' : ''); ?>">
              <?php echo ($pageid == 1 ? 'Homepage' : '<a href="' . $path . 'index.php">Homepage</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 'myprofile' ? 'selected' : ''); ?>">
              <?php echo ($pageid == 'myprofile' ? 'My Page' : '<a href="' . $path . 'user_profile.php?name=' . $rawname . '">My Page</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 2 && $logged_in ? 'selected' : ''); ?>">
              <?php echo ($pageid == 2 && $logged_in ? 'Account Settings' : '<a href="' . $path . 'account.php">Account Settings</a>'); ?>
            </li>
            <li class="last">
              <a href="<?php echo $path; ?>club.php"><?php echo $shortname; ?> Club</a>
            </li>
            <?php } else if($pageid == 4 || $pageid > 3  && $pageid < 6 || $pageid == 'profile' || $pageid == 'com' || $pageid == 8 || $pageid == 'forum') { ?>
            <li class="<?php echo ($pageid == 'com' ? 'selected' : ''); ?>">
              <?php echo ($pageid == 'com' ? 'Community' : '<a href="' . $path . 'community.php">Community</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 4 ? 'selected' : ''); ?>">
              <?php echo ($pageid == 4 ? 'News' : '<a href="' . $path . 'news.php">News</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 8 ? 'selected' : ''); ?>">
              <?php echo ($pageid == 8 ? 'Staff' : '<a href="' . $path . 'staff.php">Staff</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 'forum' ? 'selected' : ''); ?>">
              <?php echo ($pageid == 'forum' ? 'Discussion Board' : '<a href="' . $path . 'forum.php">Discussion Board</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 5 ? 'selected ' : ''); ?>last">
              <?php echo ($pageid == 5 ? 'Tags' : '<a href="' . $path . 'tags.php">Tags</a>'); ?>
            </li>
            <?php
            /*
            <li class="<?php echo ($pageid == 'applications' ? 'selected ' : ''); ?>last">
              <?php echo ($pageid == 'applications' ? 'Applications' : '<a href="' . $path . 'applications.php">Applications</a>'); ?>
            </li>
            */
            ?>
            <?php } else if($pageid == 6 || $pageid > 5 && $pageid < 8 || $pageid == '6b' || $pageid = 'collectables') { ?>
            <li class="<?php echo ($pageid == 6 ? 'selected' : ''); ?>">
              <?php echo ($pageid == 6 ? 'Credits' : '<a href="' . $path . 'credits.php">Credits</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 7 ? 'selected' : ''); ?>">
              <?php echo ($pageid == 7 ? $shortname . ' Club' : '<a href="' . $path . 'club.php">' . $shortname . ' Club</a>'); ?>
            </li>
            <li class="<?php echo ($pageid == 'collectables' ? 'selected ' : ''); ?>last">
              <?php echo ($pageid == 'collectables' ? 'Collectables' : '<a href="' . $path . 'collectables.php">Collectables</a>'); ?>
            </li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php if($notify_maintenance) { ?>
      <div id="container">
        <div id="content">
          <div id="column1" class="column">
            <div class="cb">
              <div id="left_col">
                <!-- bubble -->
                <div class="bubble">
                  <div class="bubble-body">
                    <img src="<?php echo $web_gallery; ?>maintenance/alert_triangle.gif" width="30" height="29" alt="" border="0" align="left" class="triangle" />
                    <b><?php echo $locale['maintenance_frank']; ?></b>
                    <div class="clear"></div>
                  </div>
                </div>
                <div class="bubble-bottom">
                  <div class="bubble-bottom-body">
                    <img src="<?php echo $web_gallery; ?>maintenance/bubble_tail_left.gif" alt="" width="22" height="31" />
                  </div>
                  <!--center><b>Alert:</b> The site is currently turned off!</center -->
                </div>
                <!-- \bubble -->
                <img src="<?php echo $web_gallery; ?>maintenance/frank_habbo_down.gif" width="57" height="87" alt="" border="0" />
              </div>
            </div>
          </div>
          <div id="column2" class="column">
            <div class="cb">
              <div id="right_col">
                <!-- bubble -->
                <div class="bubble">
                  <div class="bubble-body">
                    <?php echo $locale['maintenance_greggers']; ?>
                    <div class="clear"></div>
                  </div>
                </div>
                <div class="bubble-bottom">
                  <div class="bubble-bottom-body">
                    <img src="<?php echo $web_gallery; ?>maintenance/bubble_tail_left.gif" alt="" width="22" height="31" />
                  </div>
                </div>
                <!-- \bubble -->
                <img src="<?php echo $web_gallery; ?>maintenance/workman_habbo_down.gif" width="125" height="118" alt="" border="0" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>