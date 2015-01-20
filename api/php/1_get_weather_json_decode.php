/*
 * 1.如果你的主机商把file_get_contents和curl都关闭了，以下的函数会报错的哦。
 * 2.json_decode($fine_contents,true),中的true是将结果转为数组类型，否则为object类型
 * 3.详细接口地址 
 * 4. 重庆 101040100 藤县101300602  璧山101042900
 * 5. url www.weather.com.cn/data/cityinfo/101040100.html  # 天气信息
 *		  www.weather.com.cn/data/sk/101040100.html        # 城市信息
 *		  www.weather.com.cn/data/zs/101040100.html        # 城市天气详细
 *
 */
<?php 
$file_contents=file_get_contents('http://www.weather.com.cn/data/cityinfo/101040100.html');
//echo $file_contents;
$array_json=json_decode($file_contents,true);
//var_dump($array_json);
print_r($array_json);
echo "this is city";
//print $array_json->{'weather1'};
echo "\n";
echo $array_json['weatherinfo']['city'];
?>
