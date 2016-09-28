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

$body_id = 'news';
$pageid = 4;
$news_id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
$cat = isset($_GET['category']) ? FilterText($_GET['category']) : '';

// Rather simple. If there's a news ID, check of a article with that ID exists,
// if it does, simply show the article data, otherwise show the news archive.

if(!empty($news_id)) {
  $main_sql = mysqli_query($connection, "SELECT * FROM cms_news WHERE num = '{$news_id}'") or die(mysqli_error($connection));
  $article_exists = mysqli_num_rows($main_sql);
  if($article_exists == 1) {
    $news = mysqli_fetch_assoc($main_sql);
    $pagename = 'News - ' . HoloText($news['title']);
    $archive = 0;
  } else {
    $pagename = 'News Archive';
    $archive = 1;
  }
} elseif(!empty($category)) {
  $pagename = 'Category Listing';
  $archive = 2;
} else {
  $pagename = 'News Archive';
  $archive = 1;
}

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix default">
            <h2 class="title">News</h2>
            <div id="article-archive">
              <h2>News Headlines</h2>
              <ul>
                <?php
                  $get_sub_archive = mysqli_query($connection, "SELECT num, title, date FROM cms_news ORDER BY num DESC LIMIT 10");
                  $count = mysqli_num_rows($get_sub_archive);

                  if($count > 0) {
                    while($row = mysqli_fetch_assoc($get_sub_archive)) {
                ?>
                <li>
                  <a href="<?php echo $path; ?>news.php?id=<?php echo $row['num']; ?>"><?php echo HoloText($row['title']); ?></a> &raquo;
                </li>
                <?php
                    }
                  } else {
                ?>
                <br />No headlines to display yet.
                <?php } ?>
              </ul>
              <h2>More news?</h2>
              <ul>
                <li>
                  <a href="<?php echo $path; ?>news.php" class="article">View our news archive</a> &raquo;
                </li>
              </ul>
            </div>
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
          <div class="cbb clearfix notitle">
            <?php if($archive < 1) { ?>
            <div id="article-wrapper">
              <h2><?php echo HoloText($news['title']); ?></h2>
              <div class="article-meta">
                Posted
                <?php echo $news['date']; ?>
                <a href="<?php echo $path; ?>news.php?category=<?php echo $news['category']; ?>">
                  <?php echo $news['category']; ?>
                </a>
              </div>
              <p class="summary">
                <?php echo HoloText($news['short_story'], true); ?>
              </p>
              <div class="article-body">
                <p>
                  <?php echo HoloText($news['story'], true); ?>
                </p>
                <div class="article-body">
                  <a href="<?php echo $path; ?>user_profile.php?name=<?php echo $news['author']; ?>" target="_self"><img src="<?php echo $web_gallery; ?>album1/users_online.png" alt="User Profile" border="0"></a><b><?php echo $news['author']; ?></b>
                </div>
              </div>
            </div>
            <?php } else if($archive == 1) { ?>
            <div id="article-wrapper">
              <h2><?php echo $shortname . ' News Archive'; ?></h2>
              <div class="article-meta">This is an overview of all articles ever posted on the website, ordered by post date.</div>
              <div class="article-body">
                <p>
                  <ul>
                    <?php
                      $get_archive = mysqli_query($connection, "SELECT num, title, date FROM cms_news ORDER BY num DESC");
                      $count = mysqli_num_rows($get_archive);
                      if($count > 0) {
                        while ($row = mysqli_fetch_assoc($get_archive)) {
                    ?>
                    <li>
                      <?php echo $row['date']; ?> - <a href="<?php echo $path; ?>news.php?id=<?php echo $row['num']; ?>"><?php echo $row['title']; ?></a>
                    </li>
                    <?php
                        }
                      } else {
                        echo 'No news to display yet.';
                      }
                    ?>
                  </ul>
                </p>
              </div>
            </div>
            <?php } elseif($archive > 1) { ?>
            <div id="article-wrapper">
              <h2><?php echo "Category Listing"; ?></h2>
              <div class="article-meta">This is an overview of the last 25 articles posted in the category <b><?php echo $cat; ?></b>.</div>
              <div class="article-body">
                <p>
                  <ul>
                    <?php
                      $get_archive = mysqli_query($connection, "SELECT num, title, date FROM cms_news WHERE category = '{$cat}' ORDER BY num DESC LIMIT 25");
                      while ($row = mysqli_fetch_assoc($get_archive)) {
                    ?>
                    <li>
                      <?php echo $row['date']; ?> - <a href="<?php echo $path; ?>news.php?id=<?php echo $row['num']; ?>"><?php echo $row['title']; ?></a>
                    </li>
                    <?php } ?>
                  </ul>
                </p>
              </div>
            </div>
            <?php } ?>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
      <div id="column3" class="column"></div>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>