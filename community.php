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
$allow_guests = true;

require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');
require_once(dirname(__FILE__) . '/includes/news_headlines.php');

$pagename = 'Community';
$pageid = 'com';

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix green">
            <div class="box-tabs-container clearfix">
              <h2>Rooms</h2>
              <ul class="box-tabs">
                <li id="tab-0-0-1"><a href="#">Top Rated</a><span class="tab-spacer"></span></li>
                <li id="tab-0-0-2" class="selected"><a href="#">Recommended Rooms</a><span class="tab-spacer"></span></li>
              </ul>
            </div>
            <div id="tab-0-0-1-content" style="display: none">
              <div class="progressbar"><img src="<?php echo $web_gallery; ?>images/progress_bubbles.gif" alt="" width="29" height="6" /></div>
              <a href="<?php echo $path; ?>habblet/proxy.php?hid=h120" class="tab-ajax"></a>
            </div>
            <div id="tab-0-0-2-content">
              <div id="rooms-habblet-list-container-h119" class="recommendedrooms-lite-habblet-list-container">
                <ul class="habblet-list">
                  <?php
                    $i = 0;
                    $getem = mysqli_query($connection, "SELECT * FROM rooms WHERE owner IS NOT NULL ORDER BY visitors_now DESC LIMIT 5") or die(mysqli_error($connection));

                    while ($row = mysqli_fetch_assoc($getem)) {
                      // Public Rooms (and possibly bugged rooms) have no owner, thus do not display them
                      if(!empty($row['owner'])) {
                        $i++;
                        $even = (IsEven($i)) ? 'odd' : 'even';

                        // Calculate percentage
                        $row['visitors_now'] = ($row['visitors_now'] == 0) ? 1 : $row['visitors_now'];
                        $data[$i] = ($row['visitors_now'] / $row['visitors_max']) * 100;

                        // Base room icon based on this - percantage levels may not be habbolike
                        if($data[$i] == 99 || $data[$i] > 99) {
                          $room_fill = 5;
                        } elseif($data[$i] > 65) {
                          $room_fill = 4;
                        } elseif($data[$i] > 32) {
                          $room_fill = 3;
                        } elseif($data[$i] > 0) {
                          $room_fill = 2;
                        } elseif($data[$i] < 1) {
                          $room_fill = 1;
                        }

                        $roomname = ($row['showname'] == 1) ? $row['name'] : '';
                  ?>
                  <li class="<?php echo $even; ?>">
                    <span class="clearfix enter-room-link room-occupancy-<?php echo $room_fill; ?>" title="Go to room" roomid="<?php echo $row['id']; ?>">
                      <span class="room-enter">Enter</span>
                      <span class="room-name"><?php echo HoloText($roomname); ?></span>
                      <span class="room-description"><?php echo HoloText($row['description']); ?></span>
                      <span class="room-owner">Owner: <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['owner']; ?>"><?php echo $row['owner']; ?></a></span>
                    </span>
                  </li>
                  <?php
                      }
                    }
                  ?>
                </ul>
                <div id="room-more-data-h119" style="display: none">
                  <ul class="habblet-list room-more-data">
                    <?php
                      $i = 0;
                      $getem = mysqli_query($connection, "SELECT * FROM rooms WHERE owner IS NOT NULL ORDER BY visitors_now DESC LIMIT 15 OFFSET 5") or die(mysqli_error($connection));

                      while ($row = mysqli_fetch_assoc($getem)) {
                        if(!empty($row['owner'])) { // Public Rooms (and possibly bugged rooms) have no owner, thus do not display them
                          $i++;

                          $even = (IsEven($i)) ? 'odd' : 'even';

                          // Calculate percentage
                          $row['visitors_now'] = ($row['visitors_now'] == 0) ? 1 : $row['visitors_now']; 
                          $data[$i] = ($row['visitors_now'] / $row['visitors_max']) * 100;

                          // Base room icon based on this - percantage levels may not be habbolike
                          if($data[$i] == 99 || $data[$i] > 99) {
                            $room_fill = 5;
                          } elseif($data[$i] > 65) {
                            $room_fill = 4;
                          } elseif($data[$i] > 32) {
                            $room_fill = 3;
                          } elseif($data[$i] > 0) {
                            $room_fill = 2;
                          } elseif($data[$i] < 1) {
                            $room_fill = 1;
                          }

                          $roomname = ($row['showname'] == 1) ? $row['name'] : '';
                    ?>
                    <li class="<?php echo $even; ?>">
                      <span class="clearfix enter-room-link room-occupancy-<?php echo $room_fill; ?>" title="Go to room" roomid="<?php echo $row['id']; ?>">
                        <span class="room-enter">Enter</span>
                        <span class="room-name"><?php echo HoloText($roomname); ?></span>
                        <span class="room-description"><?php echo HoloText($row['descr']); ?></span>
                        <span class="room-owner">Owner: <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $row['owner']; ?>"><?php echo $row['owner']; ?></a></span>
                      </span>
                    </li>
                    <?php
                        }
                      }
                    ?>
                  </ul>
                </div>
                <div class="clearfix">
                  <a href="#" class="room-toggle-more-data" id="room-toggle-more-data-h119">Show more rooms</a>
                </div>
              </div>
              <script type="text/javascript">
                L10N.put('show.more', 'Show more rooms');
                L10N.put('show.less', 'Show fewer rooms');
                var roomListHabblet_h119 = new RoomListHabblet('rooms-habblet-list-container-h119', 'room-toggle-more-data-h119', 'room-more-data-h119');
              </script>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
          <div class="cbb clearfix blue">
            <div class="box-tabs-container clearfix">
              <h2>Groups</h2>
              <ul class="box-tabs">
                <li id="tab-0-1-1"><a href="#">Hot Groups</a><span class="tab-spacer"></span></li>
                <li id="tab-0-1-2" class="selected"><a href="#">Recent topics</a><span class="tab-spacer"></span></li>
              </ul>
            </div>
            <div id="tab-0-1-1-content" style="display: none">
              <div class="progressbar"><img src="<?php echo $web_gallery; ?>images/progress_bubbles.gif" alt="" width="29" height="6" /></div>
              <a href="<?php echo $path; ?>habblet/proxy.php?hid=h122" class="tab-ajax"></a>
            </div>
            <div id="tab-0-1-2-content">
              <ul class="active-discussions-toplist">
                <?php
                  $i = 0;
                  $getem = mysqli_query($connection, "SELECT * FROM cms_forum_threads ORDER BY unix DESC LIMIT 10") or die(mysqli_error($connection));

                  while ($row = mysqli_fetch_assoc($getem)) {
                    if(empty($row['owner'])) { // Public Rooms (and possibly bugged rooms) have no owner, thus do not display them
                      $i++;
                      $even = (IsEven($i)) ? 'even' : 'odd';    
                      $posts = mysqli_evaluate("SELECT COUNT(*) FROM cms_forum_posts WHERE threadid = '{$row['id']}'");
                      $pages = ceil($posts / 10);
                      $pagelink = '<a href="' . $path . 'viewthread.php?thread=' . $row['id'] . '" class="topiclist-page-link secondary">1</a>';
                      if($pages > 4) {
                        $pageat = $pages - 2;
                        $pagelink .= ' ...';
                        while($pageat <= $pages) {
                          $pagelink .= ' <a href="' . $path . 'viewthread.php?thread=' . $row['id'] . '&page=' . $pageat . '" class="topiclist-page-link secondary">' . $pageat . '</a>';
                          $pageat++;
                        }
                      } else if($pages != 1) {
                        $pageat = 2;
                        while($pageat <= $pages) {
                          $pagelink .= ' <a href="' . $path . 'viewthread.php?thread=' . $row['id'] . '&page=' . $pageat . '" class="topiclist-page-link secondary">' . $pageat . '</a>';
                          $pageat++;
                        }
                      }
                ?>
                <li class="<?php echo $even; ?>">
                  <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>" class="topic">
                    <span><?php echo HoloText($row['title']); ?></span>
                  </a>
                  <div class="topic-info post-icon">
                    <span class="grey">(</span>
                    <?php echo $pagelink; ?>
                    <span class="grey">)</span>
                  </div>
                </li>
                <?php
                    }
                  }
                ?>
              </ul>
              <div id="active-discussions-toplist-hidden-h121" style="display: none">
                <ul class="active-discussions-toplist">
                  <?php
                    $i = 0;
                    $getem = mysqli_query($connection, "SELECT * FROM cms_forum_threads ORDER BY unix DESC LIMIT 40 OFFSET 10") or die(mysqli_error($connection));

                    while ($row = mysqli_fetch_assoc($getem)) {
                      if(empty($row['owner'])) { // Public Rooms (and possibly bugged rooms) have no owner, thus do not display them
                        $i++;
                        $even = (IsEven($i)) ? 'even' : 'odd';
                        $posts = mysqli_evaluate("SELECT COUNT(*) FROM cms_forum_posts WHERE threadid = '{$row['id']}'");
                        $pages = ceil($posts / 10);
                        $pagelink = '<a href="' . $path . 'viewthread.php?thread=' . $row['id'] . '" class="topiclist-page-link secondary">1</a>';
                        if($pages > 4) {
                          $pageat = $pages - 2;
                          $pagelink .= ' ...';
                          while($pageat <= $pages) {
                            $pagelink .= ' <a href="' . $path . 'viewthread.php?thread=' . $row['id'] . '&page=' . $pageat . '" class="topiclist-page-link secondary">' . $pageat . '</a>';
                            $pageat++;
                          }
                        } else if($pages != 1) {
                          $pageat = 2;
                          while($pageat <= $pages) {
                            $pagelink .= ' <a href="' . $path . 'viewthread.php?thread=' . $row['id'] . '&page=' . $pageat . '" class="topiclist-page-link secondary">' . $pageat . '</a>';
                            $pageat++;
                          }
                        }
                  ?>
                  <li class="<?php echo $even; ?>">
                    <a href="<?php echo $path; ?>viewthread.php?thread=<?php echo $row['id']; ?>" class="topic">
                      <span><?php echo HoloText($row['title']); ?></span>
                    </a>
                    <div class="topic-info post-icon">
                      <span class="grey">(</span>
                      <?php echo $pagelink; ?>
                      <span class="grey">)</span>
                    </div>
                  </li>
                  <?php
                      }
                    }
                  ?>
                </ul>
              </div>
              <div class="clearfix">
                <a href="#" class="discussions-toggle-more-data secondary" id="discussions-toggle-more-data-h121">Show more discussions</a>
              </div>
              <script type="text/javascript">
                L10N.put('show.more.discussions', 'Show more discussions');
                L10N.put('show.less.discussions', 'Show less discussions');
                var discussionMoreDataHelper = new MoreDataHelper('discussions-toggle-more-data-h121', 'active-discussions-toplist-hidden-h121', 'discussions');
              </script>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
          <div class="cbb clearfix activehomes">
            <h2 class="title">Random <?php echo $shortname; ?>s - Click Us!
              </h2>
            <div id="homes-habblet-list-container" class="habblet-list-container">
              <img class="active-habbo-imagemap" src="<?php echo $web_gallery; ?>v2/images/activehomes/transparent_area.gif" width="435px" height="230px" usemap="#habbomap" />
              <?php
                $i = 0;
                $getem = mysqli_query($connection, "SELECT * FROM users ORDER BY RAND() LIMIT 18") or die(mysqli_error($connection));

                while ($row = mysqli_fetch_assoc($getem)) {
                  $i++;
                  $list_id = $i - 1;
                  $status = (IsUserOnline($row['id'])) ? 'online' : 'offline';
              ?>
              <div id="active-habbo-data-<?php echo $list_id; ?>" class="active-habbo-data">
                <div class="active-habbo-data-container">
                  <div class="active-name <?php echo $status; ?>"><?php echo $row['name']; ?></div>
                  Habbo created on: <?php echo $row['hbirth']; ?>
                  <p class="moto"><?php echo HoloText($row['mission']); ?></p>
                </div>
              </div>
              <input type="hidden" id="active-habbo-url-<?php echo $list_id; ?>" value="user_profile.php?name=<?php echo $row['name']; ?>"/>
              <input type="hidden" id="active-habbo-image-<?php echo $list_id; ?>" class="active-habbo-image" value="http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=<?php echo $row['figure']; ?>&size=b&direction=4&head_direction=4&gesture=sml" />
              <?php } ?>
              <div id="placeholder-container">
                <div id="active-habbo-image-placeholder-0" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-1" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-2" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-3" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-4" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-5" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-6" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-7" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-8" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-9" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-10" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-11" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-12" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-13" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-14" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-15" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-16" class="active-habbo-image-placeholder"></div>
                <div id="active-habbo-image-placeholder-17" class="active-habbo-image-placeholder"></div>
              </div>
            </div>
            <map id="habbomap" name="habbomap">
              <area id="imagemap-area-0" shape="rect" coords="55,53,95,103" href="#" alt="" />
              <area id="imagemap-area-1" shape="rect" coords="120,53,160,103" href="#" alt="" />
              <area id="imagemap-area-2" shape="rect" coords="185,53,225,103" href="#" alt="" />
              <area id="imagemap-area-3" shape="rect" coords="250,53,290,103" href="#" alt="" />
              <area id="imagemap-area-4" shape="rect" coords="315,53,355,103" href="#" alt="" />
              <area id="imagemap-area-5" shape="rect" coords="380,53,420,103" href="#" alt="" />
              <area id="imagemap-area-6" shape="rect" coords="28,103,68,153" href="#" alt="" />
              <area id="imagemap-area-7" shape="rect" coords="93,103,133,153" href="#" alt="" />
              <area id="imagemap-area-8" shape="rect" coords="158,103,198,153" href="#" alt="" />
              <area id="imagemap-area-9" shape="rect" coords="223,103,263,153" href="#" alt="" />
              <area id="imagemap-area-10" shape="rect" coords="288,103,328,153" href="#" alt="" />
              <area id="imagemap-area-11" shape="rect" coords="353,103,393,153" href="#" alt="" />
              <area id="imagemap-area-12" shape="rect" coords="55,153,95,203" href="#" alt="" />
              <area id="imagemap-area-13" shape="rect" coords="120,153,160,203" href="#" alt="" />
              <area id="imagemap-area-14" shape="rect" coords="185,153,225,203" href="#" alt="" />
              <area id="imagemap-area-15" shape="rect" coords="250,153,290,203" href="#" alt="" />
              <area id="imagemap-area-16" shape="rect" coords="315,153,355,203" href="#" alt="" />
              <area id="imagemap-area-17" shape="rect" coords="380,153,420,203" href="#" alt="" />
            </map>
            <script type="text/javascript">
              var activeHabbosHabblet = new ActiveHabbosHabblet();
              document.observe('dom:loaded', function() {
                activeHabbosHabblet.generateRandomImages();
              });
            </script>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <div id="column2" class="column">
        <div class="habblet-container">
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container news-promo">
          <div class="cbb clearfix notitle">
            <div id="newspromo">
              <div id="topstories">
                <div class="topstory" style="background-image: url(<?php echo $news_1_topstory; ?>)">
                  <h4>Latest news</h4>
                  <h3><a href="<?php echo $path; ?>news.php?id=<?php echo $news_1_id; ?>"><?php echo $news_1_title; ?></a></h3>
                  <p class="summary">
                    <?php echo $news_1_snippet; ?>
                  </p>
                  <p>
                    <a href="<?php echo $path; ?>news.php?id=<?php echo $news_1_id; ?>">Read more &raquo;</a>
                  </p>
                </div>
                <div class="topstory" style="background-image: url(<?php echo $news_2_topstory; ?>); display: none">
                  <h4>Latest news</h4>
                  <h3><a href="<?php echo $path; ?>news.php?id=<?php echo $news_2_id; ?>"><?php echo $news_2_title; ?></a></h3>
                  <p class="summary">
                    <?php echo $news_2_snippet; ?>
                  </p>
                  <p>
                    <a href="news.php?id=<?php echo $news_2_id; ?>">Read more &raquo;</a>
                  </p>
                </div>
              </div>
              <ul class="widelist">
                <li class="even">
                  <a href="news.php?id=<?php echo $news_3_id; ?>">
                    <?php echo $news_3_title; ?>
                  </a>
                  <div class="newsitem-date">
                    <?php echo $news_3_date; ?>
                  </div>
                </li>
                <li class="odd">
                  <a href="news.php?id=<?php echo $news_4_id; ?>">
                    <?php echo $news_4_title; ?>
                  </a>
                  <div class="newsitem-date">
                    <?php echo $news_4_date; ?>
                  </div>
                </li>
                <li class="last"><a href="news.php">More news &raquo;</a></li>
              </ul>
            </div>
            <script type="text/javascript">
              document.observe('dom:loaded', function() {
                NewsPromo.init();
              });
            </script>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container">
          <div class="cbb clearfix green">
            <h2 class="title">Tags</h2>
            <div class="habblet box-content">
              <?php require_once(dirname(__FILE__) . '/tagcloud.php'); ?>
              <div class="tag-search-form">
                <form name="tag_search_form" action="<?php echo $path; ?>tags.php" class="search-box">
                  <input type="text" name="tag" id="search_query" value="" class="search-box-query" style="float: left" />
                  <a onclick="$(this).up('form').submit(); return false;" href="#" class="new-button search-icon" style="float: left"><b><span></span></b><i></i></a>
                </form>
              </div>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <script type="text/javascript">
        HabboView.add(LoginFormUI.init);
      </script>
      <div id="column3" class="column"></div>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>