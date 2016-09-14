<?php
/*==================================+
|| # HoloCMS - Website and Content Management System
|+==================================+
|| # Copyright ? 2016 Miguel Gonz?ez Aravena. All rights reserved.
|| # https://github.com/MiguelGonzalezAravena/HoloCMS
|+==================================+
|| # HoloCMS is provided "as is" and comes without
|| # warrenty of any kind. HoloCMS is free software!
|+==================================*/
require_once(dirname(__FILE__) . '/../core.php');
$bypass = true;
$startpage = 0;
$message = '';
$mesid = (isset($_POST['messageId']) ? (int) $_POST['messageId'] : (isset($_GET['messageId']) ? (int) $_GET['messageId'] : 0));
$label = (isset($_POST['label']) ? FilterText($_POST['label']) : (isset($_GET['label']) ? FilterText($_GET['label']) : 'inbox'));
$start = (isset($_POST['start']) ? (int) $_POST['start'] : 0);
$conversationid = (isset($_POST['conversationid']) ? (int) $_POST['conversationid'] : 0);
$unread = (isset($_POST['unreadOnly']) ? FilterText($_POST['unreadOnly']) : '');
$page = 'inbox';

if(!empty($mesid)) {
  $sql = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE id = '{$mesid}'") or die(mysqli_error($connection));
  $row = mysqli_fetch_assoc($sql);
  $sql2 = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['senderid']}'") or die(mysqli_error($connection));
  $senderrow = mysqli_fetch_assoc($sql2);
  $sql3 = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['to_id']}'") or die(mysqli_error($connection));
  $torow = mysqli_fetch_assoc($sql3);
?>
  <ul class="message-headers">
    <li>
      <a href="#" class="report" title="Report as offensive"></a>
    </li>
    <li><b>Subject:</b>
      <?php echo $row['subject']; ?>
    </li>
    <li><b>From:</b>
      <?php echo $senderrow['name']; ?>
    </li>
    <li><b>To:</b>
      <?php echo $torow['name']; ?>
    </li>
  </ul>
  <div class="body-text">
    <?php echo HoloText($row['message']); ?>
      <br>
  </div>
  <div class="reply-controls">
    <div>
      <div class="new-buttons clearfix">
        <?php if($row['conversationid'] != 0) { ?>
        <a href="#" class="related-messages" id="rel-<?php echo $row['conversationid']; ?>" title="Show full conversation"></a>
        <?php } ?>
       <?php if($label == 'trash') { ?>
        <a href="#" class="new-button undelete"><b>Undelete</b><i></i></a>
        <a href="#" class="new-button red-button delete"><b>Delete</b><i></i></a>
        <?php } elseif($label == 'inbox') { ?>
        <a href="#" class="new-button red-button delete"><b>Delete</b><i></i></a>
        <a href="#" class="new-button reply"><b>Reply</b><i></i></a>
        <?php } ?>
      </div>
    </div>
    <div style="display: none;">
      <textarea rows="5" cols="10" class="message-text"></textarea>
      <br />
      <div class="new-buttons clearfix">
        <a href="#" class="new-button cancel-reply"><b>Cancel</b><i></i></a>
        <a href="#" class="new-button preview"><b>Preview</b><i></i></a>
        <a href="#" class="new-button send-reply"><b>Send</b><i></i></a>
      </div>
    </div>
  </div>
<?php
    if($label == 'inbox') {
      mysqli_query($connection, "UPDATE cms_minimail SET read_mail = '1' WHERE id = '{$mesid}'") or die(mysqli_error($connection));
    }
}

if(!empty($label) || $bypass) {
  if($bypass) {
    // Why is this here?
    //$label = $page;
    $start = $startpage;
  }
?>
  <a href="#" class="new-button compose"><b>Compose</b><i></i></a>
  <div class="clearfix labels nostandard">
    <ul class="box-tabs">
      <?php
        $sql = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND read_mail = '0'") or die(mysqli_error($connection));
        $unreadmail = mysqli_num_rows($sql);
      ?>
      <li <?php echo ($label == 'inbox' ? 'class="selected"' : ''); ?>><a href="#" label="inbox">Inbox<?php echo ($unreadmail != 0 ? ' (' . $unreadmail . ')' : ''); ?></a><span class="tab-spacer"></span></li>
      <li <?php echo ($label == 'sent' ? 'class="selected"' : ''); ?>><a href="#" label="sent">Sent</a><span class="tab-spacer"></span></li>
      <li <?php echo ($label == 'trash' ? 'class="selected"' : ''); ?>><a href="#" label="trash">Trash</a><span class="tab-spacer"></span></li>
    </ul>
  </div>
  <div id="message-list" class="label-<?php echo $label; ?>">
    <div class="new-buttons clearfix">
      <div class="labels inbox-refresh"><a href="#" class="new-button green-button" label="inbox" style="float: left; margin: 0"><b>Refresh</b><i></i></a></div>
    </div>
    <div style="clear: both; height: 1px"></div>
      <?php if($label == 'inbox') { ?>
        <div class="navigation">
          <div class="unread-selector">
            <input type="checkbox" class="unread-only"<?php echo ($unread == 'true' ? ' checked' : ''); ?> /> only unread
          </div>
          <?php
            $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '0'") or die(mysqli_error($connection));
            $allmail = mysqli_num_rows($sql1);
            $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '0' AND read_mail = '0'") or die(mysqli_error($connection));
            $unreadmail = mysqli_num_rows($sql1);
            if($unread == 'true') {
              $allnum = $unreadmail;
            } else {
              $allnum = $allmail;
            }
            if($start != null) {
              $offset = $start;
              $startnum = $start + 1;
              $endnum = $start + 10;
              if($endnum > $allnum) { $endnum = $allnum; }
            } else {
              $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '0' LIMIT 10") or die(mysqli_error($connection));
              $endnum = mysqli_num_rows($sql1);
              $offset = 0;
              $startnum = 1;
            }
            $var1 = ' <a href="#" class="newer">Newer</a> ';
            $var2 = ' ' . $startnum . ' - ' . $endnum . ' of ' . $allnum . ' ';
            $var3 = ' <a href="#" class="older">Older</a> ';
            $var4 = ' <a href="#" class="newest">Newest</a> ';
            $var5 = '<!-- <a href="#" class="oldest">Oldest</a> -->';
            $totalpages = ceil($allnum / 10);
            if($endnum != $allnum && $startnum != 1) {
              $maillist = $var1 . $var2 . $var3;
            } elseif($endnum != $allnum && $startnum == 1) {
              $maillist = $var2 . $var3;
            } elseif($endnum == $allnum && $startnum != 1) {
              $maillist = $var1 . $var2;
            } elseif($endnum == $allnum && $startnum == 1) {
              $maillist = $var2;
            }
            if($startnum + 20 < $allnum && $endnum != $allnum) {
              $maillist = $maillist . $var5;
            }
            if($startnum - 20 > 0) {
              $maillist = $var4 . $maillist;
            }
            $maillist = '<p>' . $maillist . '</p>';
          ?>
          <?php if($allmail == 0) { ?>
          <p class="no-messages">
            No messages
          </p>
          <?php } elseif($unreadmail == 0 && $unread == "true") { ?>
          <p class="no-messages">
            No unread messages
          </p>
          <?php } ?>
          <div class="progress"></div>
          <?php
            if($unread == 'true') {
              if($unreadmail != 0) {
                echo $maillist;
              }
            } else {
              if($allmail != 0) {
                echo $maillist;
              }
            }
          ?>
        </div>
        <?php
          $i = 0;
          if($unread == true) {
            $getem = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '0' AND read_mail = '0' ORDER BY ID DESC LIMIT 10 OFFSET {$offset}") or die(mysqli_error($connection));
          } else {
            $getem = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '0' ORDER BY id DESC LIMIT 10 OFFSET {$offset}") or die(mysqli_error($connection));
          }
          while ($row = mysqli_fetch_assoc($getem)) {
            $i++;

            $read = ($row['read_mail'] == 0) ? 'unread' : 'read';

            $mysql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['senderid']}' LIMIT 1") or die(mysqli_error($connection));
            $senderrow = mysqli_fetch_assoc($mysql);
            $figure = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $senderrow['figure'] . '&size=s&direction=9&head_direction=2&gesture=sml';
        ?>
          <div class="message-item <?php echo $read; ?>" id="msg-<?php echo $row['id']; ?>">
            <div class="message-preview" status="<?php echo $read; ?>">
              <span class="message-tstamp" isotime="<?php echo $row['date']; ?>" title="<?php echo $row['date']; ?>">
                <?php echo $row['date']; ?>
              </span>
              <img src="<?php echo $figure; ?>" />
              <span class="message-sender" title="<?php echo $senderrow['name']; ?>"><?php echo $senderrow['name']; ?></span>
              <span class="message-subject" title="<?php echo $row['subject']; ?>">&ldquo;<?php echo $row['subject']; ?>&rdquo;</span>
            </div>
            <div class="message-body" style="display: none;">
              <div class="contents"></div>
              <div class="message-body-bottom"></div>
            </div>
          </div>
        <?php } ?>
          <div class="navigation">
            <div class="progress"></div>
            <?php
              if($unread == 'true') {
                if($unreadmail != 0) {
                  echo $maillist;
                }
              } else {
                if($allmail != 0) {
                  echo $maillist;
                }
              }
            ?>
          </div>
    </div>
    <?php } elseif($label == 'sent') { ?>
    <div class="navigation">
      <?php
        $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE senderid = '{$my_id}'") or die(mysqli_error($connection));
        $allmail = mysqli_num_rows($sql1);
        $allnum = $allmail;
        if($start != null) {
          $offset = $start;
          $startnum = $start + 1;
          $endnum = $start + 10;
          if($endnum > $allnum) {
            $endnum = $allnum;
          }
        } else {
          $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE senderid = '{$my_id}' AND deleted = '0' LIMIT 10") or die(mysqli_error($connection));
          $endnum = mysqli_num_rows($sql1);
          $offset = 0;
          $startnum = 1;
        }
        $var1 = ' <a href="#" class="newer">Newer</a> ';
        $var2 = ' '.$startnum.' - '.$endnum.' of '.$allnum.' ';
        $var3 = ' <a href="#" class="older">Older</a> ';
        $var4 = ' <a href="#" class="newest">Newest</a> ';
        $var5 = '<!-- <a href="#" class="oldest">Oldest</a> -->';
        $totalpages = ceil($allnum / 10);
        if($endnum != $allnum && $startnum != 1) {
          $maillist = $var1 . $var2 . $var3;
        } elseif($endnum != $allnum && $startnum == 1) {
          $maillist = $var2 . $var3;
        } elseif($endnum == $allnum && $startnum != 1) {
          $maillist = $var1 . $var2;
        } elseif($endnum == $allnum && $startnum == 1) {
          $maillist = $var2;
        }
        if($startnum + 20 < $allnum && $endnum != $allnum) {
          $maillist = $maillist . $var5;
        }
        if($startnum - 20 > 0) {
          $maillist = $var4 . $maillist;
        }
        $maillist = '<p>' . $maillist . '</p>';
      ?>
      <?php if($allmail == 0) { ?>
      <p class="no-messages">
        No sent messages
      </p>
      <?php } ?>
      <div class="progress"></div>
      <?php
        if($allmail != 0) {
          echo $maillist;
        }
      ?>
    </div>
    <?php
      $i = 0;
      $getem = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE senderid = '{$my_id}' ORDER BY id DESC LIMIT 10 OFFSET {$offset}") or die(mysqli_error($connection));
      while ($row = mysqli_fetch_assoc($getem)) {
        $i++;
        $read = ($row['read_mail'] == 0) ? 'unread' : 'read';
        $mysql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['senderid']}' LIMIT 1") or die(mysqli_error($connection));
        $senderrow = mysqli_fetch_assoc($mysql);
        $figure = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $senderrow['figure'] . '&size=s&direction=9&head_direction=2&gesture=sml';
    ?>
    <div class="message-item <?php echo $read; ?>" id="msg-<?php echo $row['id']; ?>">
      <div class="message-preview" status="<?php echo $read; ?>">
        <span class="message-tstamp" isotime="<?php echo $row['date']; ?>" title="<?php echo $row['date']; ?>">
          <?php echo $row['date']; ?>
        </span>
        <img src="<?php echo $figure; ?>" />
        <span class="message-sender" title="To: <?php echo $senderrow['name']; ?>">To: <?php echo $senderrow['name']; ?></span>
        <span class="message-subject" title="<?php echo $row['subject']; ?>">&ldquo;<?php echo $row['subject']; ?>&rdquo;</span>
      </div>
      <div class="message-body" style="display: none;">
        <div class="contents"></div>
        <div class="message-body-bottom"></div>
      </div>
    </div>
    <?php } ?>
    <div class="navigation">
      <div class="progress"></div>
      <?php
        if($allmail != 0) {
          echo $maillist;
        }
      ?>
    </div>
    <?php } elseif($label == 'trash') { ?>
    <div class="trash-controls notice">
      Messages in this folder that are older than 30 days are deleted automatically. <a href="#" class="empty-trash">Empty trash</a>
    </div>
    <div class="navigation">
      <?php
        $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '1'") or die(mysqli_error($connection));
        $allmail = mysqli_num_rows($sql1);
        $allnum = $allmail;
        if($start != null) {
          $offset = $start;
          $startnum = $start + 1;
          $endnum = $start + 10;
          if($endnum > $allnum) {
            $endnum = $allnum;
          }
        } else {
          $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '1' LIMIT 10") or die(mysqli_error($connection));
          $endnum = mysqli_num_rows($sql1);
          $offset = 0;
          $startnum = 1;
        }
        $var1 = ' <a href="#" class="newer">Newer</a> ';
        $var2 = ' ' . $startnum . ' - ' . $endnum . ' of ' . $allnum . ' ';
        $var3 = ' <a href="#" class="older">Older</a> ';
        $var4 = ' <a href="#" class="newest">Newest</a> ';
        $var5 = '<!-- <a href="#" class="oldest">Oldest</a> -->';
        $totalpages = ceil($allnum / 10);
        if($endnum != $allnum && $startnum != 1) {
          $maillist = $var1 . $var2 . $var3;
        } elseif($endnum != $allnum && $startnum == 1) {
          $maillist = $var2 . $var3;
        } elseif($endnum == $allnum && $startnum != 1) {
          $maillist = $var1 . $var2;
        } elseif($endnum == $allnum && $startnum == 1) {
          $maillist = $var2;
        }
        if($startnum + 20 < $allnum && $endnum != $allnum) {
          $maillist = $maillist . $var5;
        }
        if($startnum - 20 > 0) {
          $maillist = $var4 . $maillist;
        }
        $maillist = '<p>' . $maillist . '</p>';
      ?>
      <?php if($allmail == 0) { ?>
      <p class="no-messages">
        No deleted messages
      </p>
      <?php } ?>
      <div class="progress"></div>
      <?php
        if($allmail != 0) {
          echo $maillist;
        }
      ?>
    </div>
    <?php
      $i = 0;
      $getem = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE to_id = '{$my_id}' AND deleted = '1' ORDER BY ID DESC LIMIT 10 OFFSET {$offset}") or die(mysqli_error($connection));

      while ($row = mysqli_fetch_assoc($getem)) {
        $i++;
        $read = ($row['read_mail'] == 0) ? 'unread' : 'read';

        $mysql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['senderid']}' LIMIT 1") or die(mysqli_error($connection));
        $senderrow = mysqli_fetch_assoc($mysql);
        $figure = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $senderrow['figure'] . '&size=s&direction=9&head_direction=2&gesture=sml';
    ?>
    <div class="message-item <?php echo $read; ?>" id="msg-<?php echo $row['id']; ?>">
      <div class="message-preview" status="<?php echo $read; ?>">
        <span class="message-tstamp" isotime="<?php echo $row['date']; ?>" title="<?php echo $row['date']; ?>">
          <?php echo $row['date']; ?>
        </span>
        <img src="<?php echo $figure; ?>" />
        <span class="message-sender" title="<?php echo $senderrow['name']; ?>"><?php echo $senderrow['name']; ?></span>
        <span class="message-subject" title="<?php echo $row['subject']; ?>">&ldquo;<?php echo $row['subject']; ?>&rdquo;</span>
      </div>
      <div class="message-body" style="display: none;">
        <div class="contents"></div>
        <div class="message-body-bottom"></div>
      </div>
    </div>
    <?php } ?>
    <div class="navigation">
      <div class="progress"></div>
      <?php
        if($allmail != 0) {
          echo $maillist;
        }
      ?>
    </div>
  </div>
  <?php } elseif($label == 'conversation') { ?>
  <div class="trash-controls notice">
    You are reading a conversation. Click the tabs above to go back to your folders.
  </div>
  <?php
    $id = $mesid;
    $conid = $conversationId;
  ?>
  <div class="navigation">
    <?php
      $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE conversationid = '{$conid}' AND deleted = '0'") or die(mysqli_error($connection));
      $allmail = mysqli_num_rows($sql1);
      $allnum = $allmail;
      if($start != null) {
        $offset = $start;
        $startnum = $start + 1;
        $endnum = $start + 10;
        if($endnum > $allnum) {
          $endnum = $allnum;
        }
      } else {
        $sql1 = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE conversationid = '{$conid}' AND deleted = '0' LIMIT 10") or die(mysqli_error($connection));
        $endnum = mysqli_num_rows($sql1);
        $offset = 0;
        $startnum = 1;
      }
      $var1 = ' <a href="#" class="newer">Newer</a> ';
      $var2 = ' ' . $startnum . ' - ' . $endnum . ' of ' . $allnum . ' ';
      $var3 = ' <a href="#" class="older">Older</a> ';
      $var4 = ' <a href="#" class="newest">Newest</a> ';
      $var5 = '<!-- <a href="#" class="oldest">Oldest</a> -->';
      $totalpages = ceil($allnum / 10);
      if($endnum != $allnum && $startnum != 1) {
        $maillist = $var1 . $var2 . $var3;
      } elseif($endnum != $allnum && $startnum == 1) {
        $maillist = $var2 . $var3;
      } elseif($endnum == $allnum && $startnum != 1) {
        $maillist = $var1 . $var2;
      } elseif($endnum == $allnum && $startnum == 1) {
        $maillist = $var2;
      }
      if($startnum + 20 < $allnum && $endnum != $allnum) {
        $maillist = $maillist . $var5;
      }
      if($startnum - 20 > 0) {
        $maillist = $var4 . $maillist;
      }
      $maillist = '<p>' . $maillist . '</p>';
    ?>
    <?php if($allmail == 0) { ?>
    <p class="no-messages">
      No conversation messages
    </p>
    <?php } ?>
    <div class="progress"></div>
    <?php
      if($allmail != 0) {
        echo $maillist;
      }
    ?>
  </div>
  <?php
    $i = 0;
    $getem = mysqli_query($connection, "SELECT * FROM cms_minimail WHERE conversationid = '{$conid}' AND deleted = '0' ORDER BY id DESC LIMIT 10 OFFSET ".$offset) or die(mysqli_error($connection));

    while ($row = mysqli_fetch_assoc($getem)) {
      $i++;
      $read = ($row['read_mail'] == 0) ? 'unread' : 'read';

      $mysql = mysqli_query($connection, "SELECT * FROM users WHERE id = '{$row['senderid']}' LIMIT 1") or die(mysqli_error($connection));
      $senderrow = mysqli_fetch_assoc($mysql);
      $figure = 'http://www.habbo.co.uk/habbo-imaging/avatarimage?figure=' . $senderrow['figure'] . '&size=s&direction=9&head_direction=2&gesture=sml';
  ?>
  <div class="message-item <?php echo $read; ?>" id="msg-<?php echo $row['id']; ?>">
    <div class="message-preview" status="<?php echo $read; ?>">
      <span class="message-tstamp" isotime="<?php echo $row['date']; ?>" title="<?php echo $row['date']; ?>">
        <?php echo $row['date']; ?>
      </span>
      <img src="<?php echo $figure; ?>" />
      <span class="message-sender" title="<?php echo $senderrow['name']; ?>"><?php echo $senderrow['name']; ?></span>
      <span class="message-subject" title="<?php echo $row['subject']; ?>">&ldquo;<?php echo $row['subject']; ?>&rdquo;</span>
    </div>
    <div class="message-body" style="display: none;">
      <div class="contents"></div>
      <div class="message-body-bottom"></div>
    </div>
  </div>
  <?php } ?>
  <div class="navigation">
    <div class="progress"></div>
    <?php
      if($allmail != 0) {
        echo $maillist;
      }
    ?>
  </div>
<?php 
  }

  if($bypass == true && !empty($message)) {
?>
  <div style="opacity: 1;" class="notification">
    <?php echo $message; ?>
  </div>
</div>
<?php
  }
}
?>