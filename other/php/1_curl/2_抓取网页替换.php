<?php
$curlobj=curl_init();
curl_setopt($curlobj,CURLOPT_URL,"http://www.baidu.com");
curl_setopt($curlobj,CURLOPT_RETRUNTRANSFER,ture);//执行后不直接打印
$output=curl_exec($curlobj);
curl_close($curlobj);
echo str_replace("百度","屌丝",$output);
?>
