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
$sql = mysqli_query($connection, "SELECT * FROM cms_faq WHERE type = 'cat' ORDER BY id ASC") or die(mysqli_error($connection));
?>
  <body id="faq" class="plain-template">
    <script src="<?php echo $web_gallery; ?>static/js/faq.js" type="text/javascript"></script>
    <div id="faq" class="clearfix">
      <div id="faq-header" class="clearfix"><img src="<?php echo $web_gallery; ?>v2/images/faq/faq_header.png" />
        <form method="post" action="<?php echo $path; ?>help.php" class="search-box">
          <input type="text" id="faq-search" name="query" class="search-box-query search-box-onfocus" size="50" value="Search..." />
          <input type="submit" value="" title="Search" class="search" />
        </form>
      </div>
      <div id="faq-container" class="clearfix">
        <div id="faq-category-list">
          <ul class="faq">
            <?php while($row = mysqli_fetch_assoc($sql)) { ?>
            <li>
              <a href="<?php echo $path; ?>help.php?id=<?php echo $row['id']; ?>"><span class="faq-link"><?php echo $row['title']; ?></span></a>
            </li>
            <?php } ?>
          </ul>
        </div>
