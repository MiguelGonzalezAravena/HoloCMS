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
require_once(dirname(__FILE__) . '/../core.php'); 
require_once(dirname(__FILE__) . '/../includes/session.php');
(getContent('forum-enabled') != 1) ? header('Location: index.php') : '';

$groupid = isset($_POST['groupId']) ? (int) $_POST['groupId'] : 0;

$sql = mysqli_query($connection, "SELECT * FROM groups_details WHERE id = '{$groupid}' LIMIT 1");
$row = mysqli_fetch_assoc($sql);

if($row['topics'] == 0) {
?>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class="group-postlist-list" id="group-postlist-list">
    <tr>
      <td class="post-header-link" valign="top" style="width: 148px;"></td>
      <td class="post-header-name" valign="top"></td>
      <td align="right">
    </tr>
    <tr>
      <td colspan="3" class="post-list-row-container">
        <div id="new-topic-preview"></div>
      </td>
    </tr>
    <tr class="new-topic-entry-label" id="new-topic-entry-label">
      <td class="new-topic-entry-label">Topic:</td>
      <td colspan="2">
        <table border="0" cellpadding="0" cellspacing="0" style="margin: 5px; width: 98%;">
          <tr>
            <td>
              <div class="post-list-content-element">
                <input type="text" size="50" id="new-topic-name" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr class="topic-name-error">
      <td></td>
      <td colspan="2">
        <div id="topic-name-error"></div>
      </td>
    </tr>
    <tr id="new-post-entry-message" style="display:none;">
      <td class="new-post-entry-label">
        <div class="new-post-entry-label" id="new-post-entry-label">Post:</div>
      </td>
      <td colspan="2">
        <table border="0" cellpadding="0" cellspacing="0" style="margin: 5px; width: 98%;">
          <tr>
            <td>
              <input type="hidden" id="edit-type" />
              <input type="hidden" id="post-id" />
              <a href="#" class="preview-post-link" id="topic-form-preview">Preview &raquo;</a>
              <input type="hidden" id="spam-message" value="Spam detected!" />
              <textarea id="post-message" class="new-post-entry-message" rows="5" name="message"></textarea>
              <script type="text/javascript">
                bbcodeToolbar = new Control.TextArea.ToolBar.BBCode('post-message');
                bbcodeToolbar.toolbar.toolbar.id = 'bbcode_toolbar';
                var colors = {
                  'red': ['#d80000', 'Red'],
                  'orange': ['#fe6301', 'Orange'],
                  'yellow': ['#ffce00', 'Yellow'],
                  'green': ['#6cc800', 'Green'],
                  'cyan': ['#00c6c4', 'Cyan'],
                  'blue': ['#0070d7', 'Blue'],
                  'gray': ['#828282', 'Grey'],
                  'black': ['#000000', 'Black']
                };
                bbcodeToolbar.addColorSelect('Colours', colors, false);
              </script>
              <br />
              <br/>
              <a class="new-button red-button cancel-icon" href="forum.php"><b><span></span>Cancel</b><i></i></a>
              <a id="topic-form-save" class="new-button green-button save-icon" href="#"><b><span></span>Save</b><i></i></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div id="new-post-preview" style="display:none;">
  </div>
  <?php
  } elseif($row['topics'] == 1) {
    $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' LIMIT 1");
    if(mysqli_num_rows($check) > 0) {
  ?>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class="group-postlist-list" id="group-postlist-list">
    <tr>
      <td class="post-header-link" valign="top" style="width: 148px;"></td>
      <td class="post-header-name" valign="top"></td>
      <td align="right">
    </tr>
    <tr>
      <td colspan="3" class="post-list-row-container">
        <div id="new-topic-preview"></div>
      </td>
    </tr>
    <tr class="new-topic-entry-label" id="new-topic-entry-label">
      <td class="new-topic-entry-label">Topic:</td>
      <td colspan="2">
        <table border="0" cellpadding="0" cellspacing="0" style="margin: 5px; width: 98%;">
          <tr>
            <td>
              <div class="post-list-content-element">
                <input type="text" size="50" id="new-topic-name" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr class="topic-name-error">
      <td></td>
      <td colspan="2">
        <div id="topic-name-error"></div>
      </td>
    </tr>
    <tr id="new-post-entry-message" style="display:none;">
      <td class="new-post-entry-label">
        <div class="new-post-entry-label" id="new-post-entry-label">Post:</div>
      </td>
      <td colspan="2">
        <table border="0" cellpadding="0" cellspacing="0" style="margin: 5px; width: 98%;">
          <tr>
            <td>
              <input type="hidden" id="edit-type" />
              <input type="hidden" id="post-id" />
              <a href="#" class="preview-post-link" id="topic-form-preview">Preview &raquo;</a>
              <input type="hidden" id="spam-message" value="Spam detected!" />
              <textarea id="post-message" class="new-post-entry-message" rows="5" name="message"></textarea>
              <script type="text/javascript">
                bbcodeToolbar = new Control.TextArea.ToolBar.BBCode('post-message');
                bbcodeToolbar.toolbar.toolbar.id = 'bbcode_toolbar';
                var colors = {
                  'red': ['#d80000', 'Red'],
                  'orange': ['#fe6301', 'Orange'],
                  'yellow': ['#ffce00', 'Yellow'],
                  'green': ['#6cc800', 'Green'],
                  'cyan': ['#00c6c4', 'Cyan'],
                  'blue': ['#0070d7', 'Blue'],
                  'gray': ['#828282', 'Grey'],
                  'black': ['#000000', 'Black']
                };
                bbcodeToolbar.addColorSelect('Colours', colors, false);
              </script>
              <br />
              <br/>
              <a class="new-button red-button cancel-icon" href="forum.php"><b><span></span>Cancel</b><i></i></a>
              <a id="topic-form-save" class="new-button green-button save-icon" href="#"><b><span></span>Save</b><i></i></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div id="new-post-preview" style="display:none;">
  </div>
  <?php
    }
  } elseif($row['topics'] == 2) {
  $check = mysqli_query($connection, "SELECT * FROM groups_memberships WHERE userid = '{$my_id}' AND groupid = '{$groupid}' AND member_rank = '2' LIMIT 1");
    if(mysqli_num_rows($check) > 0) {
  ?>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class="group-postlist-list" id="group-postlist-list">
    <tr>
      <td class="post-header-link" valign="top" style="width: 148px;"></td>
      <td class="post-header-name" valign="top"></td>
      <td align="right">
    </tr>
    <tr>
      <td colspan="3" class="post-list-row-container">
        <div id="new-topic-preview"></div>
      </td>
    </tr>
    <tr class="new-topic-entry-label" id="new-topic-entry-label">
      <td class="new-topic-entry-label">Topic:</td>
      <td colspan="2">
        <table border="0" cellpadding="0" cellspacing="0" style="margin: 5px; width: 98%;">
          <tr>
            <td>
              <div class="post-list-content-element">
                <input type="text" size="50" id="new-topic-name" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr class="topic-name-error">
      <td></td>
      <td colspan="2">
        <div id="topic-name-error"></div>
      </td>
    </tr>
    <tr id="new-post-entry-message" style="display:none;">
      <td class="new-post-entry-label">
        <div class="new-post-entry-label" id="new-post-entry-label">Post:</div>
      </td>
      <td colspan="2">
        <table border="0" cellpadding="0" cellspacing="0" style="margin: 5px; width: 98%;">
          <tr>
            <td>
              <input type="hidden" id="edit-type" />
              <input type="hidden" id="post-id" />
              <a href="#" class="preview-post-link" id="topic-form-preview">Preview &raquo;</a>
              <input type="hidden" id="spam-message" value="Spam detected!" />
              <textarea id="post-message" class="new-post-entry-message" rows="5" name="message"></textarea>
              <script type="text/javascript">
                bbcodeToolbar = new Control.TextArea.ToolBar.BBCode('post-message');
                bbcodeToolbar.toolbar.toolbar.id = 'bbcode_toolbar';
                var colors = {
                  'red': ['#d80000', 'Red'],
                  'orange': ['#fe6301', 'Orange'],
                  'yellow': ['#ffce00', 'Yellow'],
                  'green': ['#6cc800', 'Green'],
                  'cyan': ['#00c6c4', 'Cyan'],
                  'blue': ['#0070d7', 'Blue'],
                  'gray': ['#828282', 'Grey'],
                  'black': ['#000000', 'Black']
                };
                bbcodeToolbar.addColorSelect('Colours', colors, false);
              </script>
              <br />
              <br/>
              <a class="new-button red-button cancel-icon" href="forum.php"><b><span></span>Cancel</b><i></i></a>
              <a id="topic-form-save" class="new-button green-button save-icon" href="#"><b><span></span>Save</b><i></i></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div id="new-post-preview" style="display:none;">
  </div>
  <?php
    }
  }
  ?>