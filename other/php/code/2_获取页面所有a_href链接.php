<?php
/* 获取页面所有的href链接 */
$preg='/<a .*?href="(.*?)".*?>/is';
$str =file_get_contents('index.html');
preg_match_all($preg,$str,$match);//在$str中搜索匹配所有符合$preg加入$match中
for($i=0;$i<count($match[1]);$i++)//逐个输出超链接地址
{
	  echo $match[1][$i]."\n";
}
?>
