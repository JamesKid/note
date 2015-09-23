<?php
$data = 'theCityName=北京';
$curlobj=curl_init();
curl_setopt($curlobj,CURLOPT_URL,"http://www.baidu.com");
curl_setopt($curlobj,CURLOPT_HEADER,0);
curl_setopt($curlobj,CURLOPT_RETRUNTRANSFER,ture);//执行后不直接打印
curl_setopt($curlobj,CURLOPT_POST,1);
curl_setopt($curlobj,CURLOPT_POSTFIELDS,$data);
curl_setopt($curlobj,CURLOPT_HTTPHEADER,
	array(
		"application/x-www-from-urlencoded; charset=utf-8",
		"Content-length:".strlen($data);
	)
);
$rtn = curl_exec($curlobj);
if(!curl_errno($curlobj)){
	echo $rtn;
}
else{
	echo 'Curl error: '.curl_error($curlojb);
}
curl_close($curlobj);
?>
