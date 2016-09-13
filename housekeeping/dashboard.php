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
require_once(dirname(__FILE__) . '/../core.php');
($hkzone != true ? header('Location: index.php?throwBack=true') : '');
(!isset($_SESSION['acp']) ? header('Location: index.php?p=login') : '');

$pagename = 'Dashboard';
$notes = isset($_POST['notes']) ? FilterText($_POST['notes']) : '';

if(!empty($notes)) {
  mysqli_query($connection, "UPDATE cms_system SET value = '{$notes}' WHERE systemVar = 'admin_notes'") or die(mysqli_error($connection));
}

$tmp = mysqli_query($connection, "SELECT * FROM cms_system LIMIT 1") or die(mysqli_error($connection));
$system = mysqli_fetch_assoc($tmp);

$onlineCutOff = (time() - 601);
$onlineUsers = mysqli_evaluate("SELECT COUNT(*) FROM users WHERE online > {$onlineCutOff}");

require_once(dirname(__FILE__) . '/subheader.php');
require_once(dirname(__FILE__) . '/header.php');
?>
  <table cellpadding="0" cellspacing="8" width="100%" id="tablewrap">
    <tr>
      <td width="100%" valign="top" id="rightblock">
        <div>
          <!-- RIGHT CONTENT BLOCK -->
          <div style="font-size:30px; padding-left:7px; letter-spacing:-2px; border-bottom:1px solid #EDEDED">
            HoloCMS Housekeeping
          </div>
          <br />
          <div id="ipb-get-members" style="border:1px solid #000; background:#FFF; padding:2px;position:absolute;width:120px;display:none;z-index:100"></div>
          <!--in_dev_notes-->
          <!--in_dev_check-->
          <table border="0" width="100%" cellpadding="0" cellspacing="4">
            <tr>
              <td valign="top" width="75%">
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                      <div class="homepage_pane_border">
                        <div class="homepage_section">Tasks and Statistics</div>
                        <table width="100%" cellspacing="0" cellpadding="4">
                          <tr>
                            <td width="50%" valign="top">
                              <div class="homepage_border">
                                <div class="homepage_sub_header">System Overview</div>
                                <table width="100%" cellpadding="4" cellspacing="0">
                                  <tr>
                                    <td class="homepage_sub_row" width="60%"><strong>HoloCMS Version</strong> &nbsp;(<a href="http://trac2.assembla.com/HoloCMS">History</a>)</td>
                                    <td class="homepage_sub_row" width="40%"><strong>v<?php echo $holocms['version'];?></strong>&nbsp;
                                      <?php echo $holocms['stable']; ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Members</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo mysqli_evaluate("SELECT COUNT(*) FROM users"); ?> (
                                        <a href="index.php?p=onlinelist">
                                          <?php echo $onlineUsers; ?>
                                        </a> online)
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Rooms</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo mysqli_evaluate("SELECT COUNT(*) FROM rooms"); ?>
                                        (of which
                                        <?php echo mysqli_evaluate("SELECT COUNT(*) FROM rooms WHERE owner IS NULL"); ?> public rooms)
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Furniture</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo mysqli_evaluate("SELECT COUNT(*) FROM furniture"); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Groups</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo mysqli_evaluate("SELECT COUNT(*) FROM groups_details"); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Stafflog Entries</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo mysqli_evaluate("SELECT COUNT(*) FROM system_stafflog"); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Active Bans</strong></td>
                                    <td class="homepage_sub_row">
                                      <a href="index.php?p=banlist">
                                        <?php echo mysqli_evaluate("SELECT COUNT(*) FROM users_bans"); ?>
                                      </a>
                                    </td>
                                  </tr>
                                </table>
                              </div>
                            </td>
                            <td width="50%" valign="top">
                              <div class="homepage_border">
                                <div class="homepage_sub_header">Server Setup</div>
                                <table width="100%" cellpadding="4" cellspacing="0">
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Game Port</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo FetchServerSetting('server_game_port'); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>&nbsp;&nbsp;&nbsp;&nbsp;- MUS Port</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo FetchServerSetting('server_mus_port'); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Maximum Game Connections</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo FetchServerSetting('server_game_maxconnections'); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Trading Enabled</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo FetchServerSetting('trading_enable', true); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Recycler Enabled</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo FetchServerSetting('recycler_enable', true); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="homepage_sub_row"><strong>Wordfilter Enabled</strong></td>
                                    <td class="homepage_sub_row">
                                      <?php echo FetchServerSetting('wordfilter_enable', true); ?> (
                                        <?php echo FetchServerSetting('wordfilter_censor'); ?>)
                                    </td>
                                  </tr>
                                </table>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>
                      <div class="homepage_pane_border">
                        <div class="homepage_section">Communication</div>
                        <table width="100%" cellspacing="0" cellpadding="4">
                          <tr>
                            <td valign="top" width="50%">
                              <div class="homepage_border">
                                <div class="homepage_sub_header">Housekeeping Notes</div>
                                <br />
                                <div align="center">
                                  <form action="index.php?p=dashboard&do=save" method="post">
                                    <textarea name="notes" style="background-color:#F9FFA2;border:1px solid #CCC;width:95%;font-family:verdana;font-size:10px" rows="8" cols="25"><?php echo config('admin_notes'); ?></textarea>
                                    <div>
                                      <br />
                                      <input type="submit" value="Save Admin Notes" class="realbutton" />
                                    </div>
                                  </form>
                                </div>
                                <br />
                              </div>
                            </td>
                            <td width="50%" valign="top">
                              <div class="homepage_border">
                                <div class="homepage_sub_header">
                                  <?php echo $sitename; ?> Administrators</div>
                                <table width="100%" cellpadding="4" cellspacing="0">
                                  <?php
                                    $get_em = mysqli_query($connection, "SELECT id, name, email FROM users WHERE rank > 6 ORDER BY name ASC LIMIT 20") or die(mysqli_error($connection));
                                    while($row = mysqli_fetch_assoc($get_em)) {
                                  ?>
                                  <tr>
                                    <td class="tablerow1" align="center">
                                      <div style="font-size:12px">
                                        <a href="../user_profile.php?name=<?php echo $row['name']; ?>" target="_blank">
                                          <strong><?php echo $row['name']; ?></strong>
                                        </a> (ID:
                                        <?php echo $row['id']; ?>)
                                    </td>
                                    <td class="tablerow2">
                                      <div style="margin-top:6px">
                                        <a href="mailto:<?php echo $row['email']; ?>">
                                          <?php echo $row['email']; ?>
                                        </a>
                                      </div>
                                    </td>
                                  </tr>
                                  <?php
                                    }
                                  ?>
                                </table>
                                </div>
                            </td>
                          </tr>
                        </table>
                        </div>
                    </td>
                  </tr>
                </table>
              </td>
              <td valign="top" width="25%">
                <div id="acp-update-wrapper">
                  <div class="homepage_pane_border" id="acp-update-normal">
                    <div class="homepage_section">HoloCMS Updater</div>
                    <div style="font-size:12px;padding:4px; text-align:center">
                      <p>v<?php echo $holocms['version']; ?> <?php echo $holocms['stable']; ?> [<?php echo $holocms['title']; ?>]<br />
                      Check out the <a href="http://forum.ragezone.com/showthread.php?t=418018">HoloCMS topic</a> for the latest updates.
                      </p>
                    </div>
                  </div>
                  <br />
                </div>
                <div id="acp-update-wrapper">
                  <div class="homepage_pane_border" id="acp-update-normal">
                    <div class="homepage_section">Support HoloCMS</div>
                    <div style="font-size:12px;padding:4px; text-align:center">
                      <p>
                        HoloCMS is, always has been, and always will be, free software. To help keep the developer happy and allow him to buy a pizza <sup>every now and then</sup>, you can make a donation. This is completely optional, and if you decide not to donate, you won't miss out on any advantages, besides the developer's gratitude. All donations are processed by PayPal. Donate to the current developer to encourage development and get faster releases (results may vary).
                        <br />
                        <br /> Donate to Miguel González Aravena (the current HoloCMS developer):
                        <br />
                        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                          <input type="hidden" name="cmd" value="_s-xclick">
                          <input type="hidden" name="hosted_button_id" value="SMY3KKLWK73QY">
                          <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                          <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
                        </form>
                        <br />
                        <br /> Donate to Meth0d (the orginal HoloCMS developer):
                        <br />
                        <br />
                        <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                          <input type="hidden" name="cmd" value="_donations">
                          <input type="hidden" name="business" value="meth0d@meth0d.org">
                          <input type="hidden" name="item_name" value="HoloCMS Donation">
                          <input type="hidden" name="no_shipping" value="0">
                          <input type="hidden" name="no_note" value="1">
                          <input type="hidden" name="currency_code" value="USD">
                          <input type="hidden" name="tax" value="0">
                          <input type="hidden" name="lc" value="GB">
                          <input type="hidden" name="bn" value="PP-DonationsBF">
                          <input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but21.gif" border="0" name="submit" alt="Donate to HoloCMS using PayPal - The safer, easier way to pay online.">
                          <img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
                        </form>
                        <br />
                      </p>
                    </div>
                  </div>
                  <br />
                </div>
                <div id="acp-update-wrapper">
                  <div class="homepage_pane_border" id="acp-update-normal">
                    <div class="homepage_section">Need assistance?</div>
                    <div style="font-size:12px;padding:4px; text-align:center">
                      <p>
                        If you need Help with your copy of HoloCMS, your first stop should be the 'Help' tab in Housekeeping. If you still have problems, feel free to ask for support on <a href="http://forum.ragezone.com/f282" target="_BLANK">RaGEZONE</a> or <a href="http://www.meth0d.org" target="_BLANK">Meth0d dot org</a>.
                      </p>
                    </div>
                  </div>
                  <br />
                </div>
                </div>
                <!-- / RIGHT CONTENT BLOCK -->
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
<!-- / OUTERDIV -->
<div align="center">
  <br />
  <?php
    $mtime = explode(' ', microtime());
    $totaltime = $mtime[0] + $mtime[1] - $starttime;
    printf('Time: %.3f', $totaltime);
  ?>
</div>
