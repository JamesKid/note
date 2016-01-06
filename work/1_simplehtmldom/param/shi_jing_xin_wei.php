<?php
//　市经信委的参数配置

/** 配置参;    
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
$resultContent = $contentHtml->find('articlepagebegin',0)->innertext();  /*　获得id为content_title  的标题　*/
$resultTitle = $contentHtml->find('.t3 tbody tr td table tbody tr td',0)->innertext();  /*　获得id为content_title  的标题　*/
$resultAuthor = $contentHtml->find('.t3 tbody tr td table tbody tr td',1)->innertext();  /*　获得id为content_title  的标题　*/
$resultAuthor = trim(substr($resultAuthor,44,10));  /* 截取作者　*/
$resultTime = $contentHtml->find('.t3 tbody tr td table tbody tr td',1)->innertext();  /*　获得id为content_title  的标题　*/
$resultTime = substr($resultTime,10,4).substr($resultTime,16,2).substr($resultTime,20,2);  /* 截取作者　*/
$resultView = $contentHtml->find('.t3 tbody tr td table tbody tr td span',0)->innertext();  /*　获得id为content_title  的标题　*/

$resultFrom = "市经信委";
$resultType = 3;
$resultSubCategory = "综合资讯";
$resultWebName = "重庆市经济和信息化委员会(http://wjj.cq.gov.cn)";
$resultImg='';

//// 字符转码 成utf8 
$resultTitle = iconv("GBK", "UTF-8", $resultTitle);
$resultTime = iconv("GBK", "UTF-8", $resultTime);
$resultAuthor = iconv("GBK", "UTF-8", $resultAuthor);
//$resultView = iconv("GBK", "UTF-8", $resultView);
?>
