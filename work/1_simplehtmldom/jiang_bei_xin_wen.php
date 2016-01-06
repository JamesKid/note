<?php
/* ==================================================================================
 *　tips   : 注意这个脚本占用内存很大，记得清除对象 <?php $html->clear();?> 
 *  description:  这个是自动抓取网页列表内容的脚本程序 详细请看 read_me.txt　这个文件
 *  author : jameskid 
 *  time   : 2014.7.14
 *  version: 1.0  原始版本
 *			 1.1  发现simple_html_dom.php 文件790行有iconv的bug,改成
 *				  simple_html_dom_no_iconv.php　文件
 *  email  : 406358964@qq.com
 * ==================================================================================
 */
// 导入simple_html_dom包
	header("Content-Type: text/html; charset=gb2312");
	$beginTime=microtime(true);  //记录开始时间 
	$beginMemory = memory_get_usage(); //记录内存

	include_once("/var/local/moco_replicator/shell/9_out_news/simplehtmldom_1_5/simple_html_dom_no_iconv.php");
	require_once("/var/local/moco_replicator/shell/9_out_news/function.php");  //加载函数文件
	require_once('/var/local/moco_replicator/shell/9_out_news/database.php');  //加载数据库处理函数　
	header("Content-Type: text/html; charset=utf-8");
	ini_set('max_execution_time',3000); // 设置允许执行的最大时间为3000秒

/* 配置参数    
 * listUrl       : 列表指向地址
 * count         : 列表数量 
 * listPosition  : 列位置
 */
	$listUrl ='http://jb.cq.gov.cn/zfdt/';
	$count = 20;
	$listPosition = 'body form table tbody tr td table tbody a';
	$relativeAddress = false;



// 抓取列url
	
	//$html = str_get_html('<html><body>Hello!</body></html>');
	//解析主站地址
	$listUrlArray=getListUrl($relativeAddress,$listUrl,$listPosition,$count);


//解析每个url内容
	
	//param location ='div[id="content_txt"]';
	
	for($i = 0; $i<$count; $i++){
		$contentPageUrl = $listUrlArray[$i];
		$contentHtml = file_get_html($contentPageUrl);

		$resultContent = $contentHtml->find('articlepagebegin',0)->innertext();  /*　获得id为content_txt  的内容　*/
		$resultTitle = $contentHtml->find('body form table span',0)->innertext();  /*　获得id为content_title  的标题　*/
		//$resultAuthor = $contentHtml->find('body form table ',1)->innertext();  /*　获得id为content_title  的标题　*/
		$resultAuthor = "重庆市江北区政府网";  /*　获得id为content_title  的标题　*/
		$resultTime = $contentHtml->find('body form table tbody tr td table tbody tr',2)->innertext();  /*　获得id为content_title  的标题　*/
		$resultTime = substr($resultTime,95,14);  /* 截取时间　*/
		$resultFrom = "江北人民政府网";
		$resultView = "";
		$resultType = 5;
		$resultSubCategory = "政务动态";
		$resultWebName = "江北人民政府网";
		$resultImg = "";

		 
		//require('param/jiang_bei_xin_wen.php');  //参数配置文件
		$resultContent = iconv('GB2312', 'UTF-8', $resultContent);
		$resultContent = addslashes($resultContent);  //将单引号转义,若字符串中有单引号则插入不了数据库
		$resultTitle = iconv('GB2312', 'UTF-8', $resultTitle);
		$resultTime = iconv('GB2312', 'UTF-8', $resultTime);
		$resultTime = str_replace("年","-",$resultTime);
		$resultTime = str_replace("月","-",$resultTime);
		$resultTime = str_replace("日","",$resultTime);


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
			'img' => $resultImg
		);
	}

//数据库加入处理函数　(判断数据库是否已经有了数据有了则不插入)
	insertToDataBase($arr);   //将数组插入数据库
//结束统计时间,及内存
	$endTime=microtime(true);
	$useTime=$endTime-$beginTime;
	$endMemory = memory_get_usage();
	$useMemory = $endMemory - $beginMemory;
//结果输出
	$contentHtml->clear();  /*　清除内存占用 */
	ini_set('date.timezone','PRC'); //设置时区
	echo "complete in (".date("Y-m-d H:i:s ",time()).")"."time use: ".$useTime." second, memory use: ".$useMemory/1024.0."kb"; //打印完成时间

?>
