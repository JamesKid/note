<?php
//　市商委新闻的参数配置

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
//$resultContent = $contentHtml->find('.content div',3)->innertext();  /*　获得id为content_txt  的内容　*/

$resultContent = $contentHtml->find('.content div',2)->innertext();  /*　获得id为content_title  的标题　*/
$resultTitle = trim($contentHtml->find('.title h1',0)->innertext());  /*　获得id为content_title  的标题　*/
$resultAuthor = $contentHtml->find('.title span table tbody tr td',1)->innertext();  /*　获得id为content_title  的标题　*/
$resultAuthor = substr($resultAuthor,10);  /* 截取作者　*/
$resultTime = $contentHtml->find('.title span table tbody tr td',2)->innertext();  /*　获得id为content_title  的标题　*/
$resultTime = substr($resultTime,10);  /* 截取作者　*/
$resultView = $contentHtml->find('.title span table tbody tr td',3)->innertext();  /*　获得id为content_title  的标题　*/
$resultView = substr($resultView,10);  /* 截取作者　*/
$resultFrom = "市商委";
$resultType = 2;
$resultSubCategory = "商贸要闻";
$resultWebName = "重庆市商业委员会 ( http://wsy.cq.gov.cn ) ";

$resultImg='';
$imgArray= $contentHtml->find('.content div img');

//合并数组图片数据成字符串,以逗号分隔
foreach($imgArray as $element){
	$resultImg=$resultImg.",".changeRelativeUrl($element->src,$contentPageUrl); 
}
$resultImg = substr($resultImg,1);  //去掉第一个逗号

// 字符转码 成utf8 
$resultTitle = iconv("GBK", "UTF-8", $resultTitle);
$resultAuthor = iconv("GBK", "UTF-8", $resultAuthor);
$resultTime = iconv("GBK", "UTF-8", $resultTime);
$resultView = iconv("GBK", "UTF-8", $resultView);
?>
