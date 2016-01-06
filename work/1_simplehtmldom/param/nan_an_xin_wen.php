<?php
//　南岸新闻的参数配置

/** 配置参数    
 * resultContent : 主内容位置
 * resultTitle   : 标题位置　
 * resultAuthor  : 文章作者位置
 * resultTime    : 时间位置
 * resultFrom    : 新闻来源
 * resultView    : 新闻浏览量
 * resultType    : 新闻类型
 * resultSubCategory : 子目录
 * resultWebName : 来源网站名称　
 * resultImg     : 图片
 */
$resultContent = $contentHtml->find('div[id="content_txt"]',0)->innertext();  /*　获得id为content_txt  的内容　*/
$resultTitle = trim($contentHtml->find('div[id="content_title"]',0)->innertext());  /*　获得id为content_title  的标题　*/
$resultAuthor = $contentHtml->find('div[id="content_Author"]',0)->text();  /*　获得id为content_title  的标题　*/
$resultAuthor = substr($resultAuthor,-6);  /* 截取作者　*/
$resultTime = $contentHtml->find('div[id="content_Author"]',0)->text();  /*　获得id为content_title  的标题　*/
$resultTime = substr($resultTime,-83,10);  /* 截取时间　*/
$resultFrom = "南岸新闻";
$resultView = "";
$resultType = 1;
$resultSubCategory = "";
$resultWebName = "今日南岸网 ( http://www.cqna.com.cn ) ";

$resultImg='';
$imgArray= $contentHtml->find('div[id="content_txt"] img');

//合并数组图片数据成字符串,以逗号分隔
foreach($imgArray as $element){
		$resultImg=$resultImg.",".changeRelativeUrl($element->src,$contentPageUrl); 
}
$resultImg = substr($resultImg,1);  //去掉第一个逗号
?>
