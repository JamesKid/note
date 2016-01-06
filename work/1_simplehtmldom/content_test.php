<?php
	include_once("/simplehtmldom_1_5/simple_html_dom.php");
	require_once("function.php");  //加载函数文件
	require_once("database.php");  //加载函数文件
	header("Content-Type: text/html; charset=utf-8");
	ini_set('max_execution_time',3000); // 设置允许执行的最大时间为3000秒
	
	$contentPageUrl = "http://www.cqna.com.cn/na_content/2014-07/17/content_3406556.htm";
	$contentHtml = file_get_html($contentPageUrl);

	$resultImg='';
	$imgArray= $contentHtml->find('div[id="content_txt"] img');

	//合并数组图片数据成字符串,以逗号分隔
	foreach($imgArray as $element){
			$resultImg=$resultImg.",".changeRelativeUrl($element->src,$contentPageUrl); 
	}
	$resultImg = substr($resultImg,1);  //去掉第一个逗号

	require('param/nan_an_xin_wen.php');  //参数配置文件

	// 组合出数组
	$arr[] = array(
		'content' => $resultContent,
		'update_time' => $resultTime,
		'from' => $resultFrom,
		'author' => $resultAuthor ,
		'title' => $resultTitle,
		'view' => $resultView,
		'url' => $contentPageUrl,
		'type' =>$resultType,
		'sub_category' => $resultSubCategory,
		'web_name' => $resultWebName,
		'img' => $resultImg,
	);

	insertToDataBase($arr);   //将数组插入数据库


?>
