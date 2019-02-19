<?
$url = "ftp://61.54.28.3/".mt_rand(99,999).".txt"; 
$file = "20090829.txt"; 
$fp = fopen ($file, "r"); 
$ch = curl_init(); 
curl_setopt($ch, CURLOPT_VERBOSE, 1); //有意外发生则报道 
curl_setopt($ch, CURLOPT_USERPWD, 'ffff:****'); //FTP登陆账号密码，模拟登陆 
curl_setopt($ch, CURLOPT_URL, $url); 
curl_setopt($ch, CURLOPT_PUT, 1); //用HTTP上传一个文件 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //不输出 
curl_setopt($ch, CURLOPT_INFILE, $fp); //要上传的文件 
curl_setopt($ch, CURLOPT_INFILESIZE,filesize($localfile)); //上传文件大小 
$http_result = curl_exec($ch); //执行 
$error = curl_error($ch); 
curl_close($ch); 
fclose($fp); 
if (!$error) 
{ 
print "成功"; 
} 
?>  
