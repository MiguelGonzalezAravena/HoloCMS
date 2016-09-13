<?php
require_once(dirname(__FILE__) . '/../core.php');
(!function_exists('SendMUSData') ? require_once(dirname(__FILE__) . '/../includes/mus.php') : '');
@SendMUSData('SVEX' . 1 . chr(2) . 'hi');
?>