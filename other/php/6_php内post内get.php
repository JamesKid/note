<?php
	public function getXianChang($touser , $fromuser,$url) {
		  $url='newwx.qucbd.com/third/saveimg?touser='.$touser.'&fromuser='.$fromuser.'&url='.$url.'&upphoto_type=0';
		  $ch = curl_init();
		  curl_setopt($ch, CURLOPT_URL,"http://$url");
		  curl_setopt($ch, CURLOPT_POST, 1);
		  curl_setopt($ch, CURLOPT_POSTFIELDS, "Data1=blah&Data2=blah");
		  curl_exec ($ch);
		  curl_close ($ch);
	}
?>
<?php
	public function getImg($touser , $fromuser,$url, $filename)
	{
		  $hander = curl_init();
		  $fp = fopen($filename,'w');
		  curl_setopt($hander,CURLOPT_URL,$url);
		  curl_setopt($hander,CURLOPT_FILE,$fp);
		  curl_setopt($hander,CURLOPT_HEADER,0);
		  curl_setopt($hander,CURLOPT_FOLLOWLOCATION,1);
		  curl_setopt($hander,CURLOPT_TIMEOUT,60);
		  curl_exec($hander);
		  curl_close($hander);
		  fclose($fp);
		  
	}
?>
