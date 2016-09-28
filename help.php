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
$allow_guests = true;
require_once(dirname(__FILE__) . '/core.php');

$pagename = 'FAQ';
$body_id = 'faq';
$pageid = $body_id;
require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/fheader.php');

$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
$query = isset($_POST['query']) ? FilterText($_POST['query']) : '';
?>
  <div id="faq-category-content" class="clearfix">
    <?php
      if(!empty($id)) {
        $sql = mysqli_query($connection, "SELECT * FROM cms_faq WHERE id = '{$id}' LIMIT 1");
        $row = mysqli_fetch_assoc($sql);
        if(!empty($row['content'])) {
    ?>
      <p class="faq-category-description">
        <?php echo $row['content']; ?>
      </p>
      <?php
        $sql = mysqli_query($connection, "SELECT * FROM cms_faq WHERE catid = '{$id}'");
        $i = 0;
        $faqitem = '';
          while($itemrow = mysqli_fetch_assoc($sql)) {
            $i++;
            $selected = ($i == 1) ? 'selected' : '';
            $faqitem = ($i != 4) ? '$("faq-item-content-' . $itemrow['id'] . '").hide();' : '';
      ?>
      <h4 id="faq-item-header-<?php echo $itemrow['id']; ?>" class="faq-item-header faq-toggle ">
        <span class="faq-toggle <?php echo $selected; ?>" id="faq-header-text-<?php echo $itemrow['id']; ?>"><?php echo $itemrow['title']; ?></span>
      </h4>
      <div id="faq-item-content-<?php echo $itemrow['id']; ?>" class="faq-item-content clearfix">
        <div class="faq-item-content clearfix">
          <?php echo $itemrow['content']; ?>
        </div>
        <div class="faq-close-container">
          <div id="faq-close-button-<?php echo $itemrow['id']; ?>" class="faq-close-button clearfix faq-toggle" style="display:none">
            Close FAQ
            <img id="faq-close-image-<?php echo $itemrow['id']; ?>" class="faq-toggle" src="<?php echo $web_gallery; ?>v2/images/faq/close_btn.png" />
          </div>
        </div>
      </div>
      <script type="text/javascript">
        <?php echo $faqitem; ?>
        $("faq-close-button-<?php echo $itemrow['id']; ?>").show();
      </script>
      <?php
            }
          }
        } else if(!empty($query)) {
          $sql = mysqli_query($connection, "SELECT * FROM cms_faq WHERE type = 'item' AND title LIKE '%{$query}%' OR content LIKE '%{$query}%'");
          $count = mysqli_num_rows($sql);
          if($count == 0) {;
            echo 'No matching FAQ found. Please search again.';
          } else {
            while($itemrow = mysqli_fetch_assoc($sql)) {
              $sql2 = mysqli_query($connection, "SELECT * FROM cms_faq WHERE id = '{$itemrow['catid']}' LIMIT 1");
              $catrow = mysqli_fetch_assoc($sql2);
              $cat = $catrow['title'];
      ?>
      <h4 id="faq-item-header-<?php echo $itemrow['id']; ?>" class="faq-item-header faq-toggle">
        <span class="faq-toggle" id="faq-header-text-<?php echo $itemrow['id']; ?>"><?php echo $itemrow['title']; ?></span>
        <span class="item-category"> - <?php echo $cat; ?></span>
      </h4>
      <div id="faq-item-content-<?php echo $itemrow['id']; ?>" class="faq-item-content clearfix">
        <div class="faq-item-content clearfix">
          <?php echo HoloText($itemrow['content'], true); ?>
        </div>
        <div class="faq-close-container">
          <div id="faq-close-button-<?php echo $itemrow['id']; ?>" class="faq-close-button clearfix faq-toggle" style="display:none">
            Close FAQ
            <img id="faq-close-image-<?php echo $itemrow['id']; ?>" class="faq-toggle" src="<?php echo $web_gallery; ?>v2/images/faq/close_btn.png" />
          </div>
        </div>
      </div>
      <script type="text/javascript">
      $('faq-item-content-<?php echo $itemrow['id']; ?>').hide();
      $('faq-close-button-<?php echo $itemrow['id']; ?>').show();
      </script>
      <?php
            }
          }
        }
      ?>
      <script type="text/javascript">
        FaqItems.init();
        SearchBoxHelper.init();
      </script>
    </div>
  </div>
<?php require_once(dirname(__FILE__) . '/templates/community/ffooter.php'); ?>