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

$pagename = 'Account transactions';
$pageid = '6b';
$body_id = 'home';

require_once(dirname(__FILE__) . '/templates/community/subheader.php');
require_once(dirname(__FILE__) . '/templates/community/header.php');
?>
  <div id="container">
    <div id="content" style="position: relative" class="clearfix">
      <div id="column1" class="column">
        <div class="habblet-container">
          <div class="cbb clearfix brown">
            <h2 class="title">Account transactions</h2>
            <div id="tx-log">
              <div class="box-content">
                This is an overview of your credit transaction history. They are updated as soon as the transaction is made. You can see up to 50 records.
              </div>
              <table class="tx-history">
                <thead>
                  <tr>
                    <th class="tx-date">Date</th>
                    <th class="tx-amount">Activity</th>
                    <th class="tx-description">Description</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                    $tick = 0;
                    $get_em = mysqli_query($connection, "SELECT date, amount, descr FROM cms_transactions WHERE userid = '{$my_id}' ORDER BY id DESC LIMIT 50") or die(mysqli_error($connection));
                    while($row = mysqli_fetch_assoc($get_em)) {
                      $tick++;
                      $even = (IsEven($tick)) ? 'even' : 'odd';
                  ?>
                  <tr class="<?php echo $even; ?>">
                    <td class="tx-date"><?php echo $row['date']; ?></td>
                    <td class="tx-amount"><?php echo $row['amount']; ?></td>
                    <td class="tx-description"><?php echo $row['descr']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
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
          <div class="cbb clearfix brown">
            <h2 class="title">Your purse</h2>
            <div id="purse-habblet">
              <form method="post" action="<?php echo $path; ?>credits.php" id="voucher-form">
                <ul>
                  <li class="even icon-purse">
                    <div>You Currently Have:</div>
                    <span class="purse-balance-amount"><?php echo $myrow['credits']; ?> Credits</span>
                    <div class="purse-tx"><a href="<?php echo $path; ?>transactions.php">Account transactions</a></div>
                  </li>
                  <li class="odd">
                    <div class="box-content">
                      <div>Enter redemption code:</div>
                      <input type="text" name="voucherCode" value="" id="purse-habblet-redeemcode-string" class="redeemcode" />
                      <a href="#" id="purse-redeemcode-button" class="new-button purse-icon" style="float:left"><b><span></span>Submit</b><i></i></a>
                    </div>
                  </li>
                </ul>
                <div id="purse-redeem-result"></div>
              </form>
            </div>
            <script type="text/javascript">
              new PurseHabblet();
            </script>
          </div>
        </div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
        <div class="habblet-container"></div>
        <script type="text/javascript">
          if(!$(document.body).hasClassName('process-template')) {
            Rounder.init();
          }
        </script>
      </div>
<?php require_once(dirname(__FILE__) . '/templates/community/footer.php'); ?>