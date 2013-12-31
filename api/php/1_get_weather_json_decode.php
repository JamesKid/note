/*
 * 1.如果你的主机商把file_get_contents和curl都关闭了，以下的函数会报错的哦。
 * 2.json_decode($fine_contents,true),中的true是将结果转为数组类型，否则为object类型
 *
 */
<?php 
$file_contents=file_get_contents('http://m.weather.com.cn/data/101300602.html');
//echo $file_contents;
$array_json=json_decode($file_contents,true);
//var_dump($array_json);
print_r($array_json);
echo "this is city";
//print $array_json->{'weather1'};
echo "\n";
echo $array_json['weatherinfo']['city'];
?>
