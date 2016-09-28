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
require_once(dirname(__FILE__) . '/core.php');
require_once(dirname(__FILE__) . '/includes/session.php');

$lefts = 0;
$rights = 0;
?>
  <div id="groups-habblet-list-container" class="habblet-list-container groups-list">
    <?php
      $get_em = mysqli_query($connection, "SELECT * FROM groups_details ORDER BY rand() LIMIT 12") or die(mysqli_error($connection));
      $groups = mysqli_num_rows($get_em);
    ?>
    <ul class="habblet-list two-cols clearfix">
      <?php
        $num = 0;
        while($row = mysqli_fetch_assoc($get_em)) {
        $num++;
        if(IsEven($num)) {
          $pos = 'right';
          $rights++;
        } else {
          $pos = 'left';
          $lefts++;
        }

        $oddeven = (IsEven($lefts)) ? 'odd' : 'even';
        $group_id = $row['id'];
        $groupdata = $row;
      ?>
      <li class="<?php echo $oddeven; ?> <?php echo $pos; ?>" style="background-image: url(<?php echo $path; ?>habbo-imaging/badge.php?badge=<?php echo $groupdata['badge']; ?>)">
        <a class="item" href="<?php echo $path; ?>group_profile.php?id=<?php echo $group_id; ?>"><?php echo HoloText($groupdata['name']); ?></a>
      </li>
      <?php
        }

        $rights_should_be = $lefts;
        echo ($rights != $rights_should_be ? '<li class="' . $oddeven . ' right"><div class="item">&nbsp;</div></li>' : '');
      ?>
    </ul>
    <div class="habblet-button-row clearfix"><a class="new-button" id="purchase-group-button" href="#"><b>Create/buy a Group</b><i></i></a></div>
  </div>
  <div id="groups-habblet-group-purchase-button" class="habblet-list-container"></div>
  <script type="text/javascript">
    $('purchase-group-button').observe('click', function(e) {
      Event.stop(e);
      GroupPurchase.open();
    });
  </script>
</div>