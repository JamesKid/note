<?php
$filename = '1_9999999.txt';
$beginTime=microtime(true);
for($i=0;$i<10000000;$i++){
	$word = $i." ".md5($i)."\n";
	$fh = fopen($filename, "a");
	fwrite($fh, $word);
	fclose($fh);
}
$endTime=microtime(true);
$useTime=$endTime-$beginTime;
echo $useTime;

?>
