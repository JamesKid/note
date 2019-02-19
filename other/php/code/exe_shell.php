<?php
	$last = exec('ls -al', $output, $return);
	print_r($output);
	echo "Return [$return]";
?>
