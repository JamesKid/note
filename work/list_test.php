<?php
/* ==================================================================================
 *　tips   : 注意这个脚本占用内存很大，记得清除对象 <?php $html->clear();?> 
 *  description:  这个是自动抓取网页列表内容的脚本程序 详细请看 read_me.txt　这个文件
 *  author : jameskid 
 *  time   : 2014.7.14
 *  version: 1.0
 *  email  : 406358964@qq.com
 * ==================================================================================
 */
// 导入simple_html_dom包
	$beginTime=microtime(true);  //记录开始时间 
	$beginMemory = memory_get_usage(); //记录内存


	include_once("/simplehtmldom_1_5/simple_html_dom.php");
	header("Content-Type: text/html; charset=utf-8");
	ini_set('max_execution_time',3000); // 设置允许执行的最大时间为3000秒

/* 配置参数    
 * listUrl       : (string) 列表指向地址 
 * count         : (int)    列表数量 
 * listPosition  : (string) 列位置
 * relativeAddress:(boolean)列链接是否为相对地址
 */
	$listUrl ='http://wsy.cq.gov.cn/news/newslistcontent.jsp?tid=&eid=SMYW0101&currId=1405395804687';
	$count = 25;
	$listPosition = 'body table tbody tr td table tbody tr td table tbody tr td a';
	$relativeAddress=false;

// 抓取列url
	
	//$html = str_get_html('<html><body>Hello!</body></html>');
	//解析主站地址函数
	function getListUrl($relativeAddress,$listUrl,$listPosition,$count){
		if($relativeAddress){
			$webUrlArray = explode('/',$listUrl);
			$webUrl = $webUrlArray[0]."//".$webUrlArray[2];
			$html = file_get_html($listUrl);
			//解析列的每个链接到数组
			for($i = 0; $i<$count; $i++){
				//解析 dom 文档获得每个列的列链接 (将这一个写成函数,接收find 的位置和列的数量)
				//$listOneUrl = $html->find('.content_list_r ul li a',$i)->href;
				$listOneUrl = $html->find($listPosition,$i)->href;
				//$resultUrl=htmlentities($listOneUrl);
				$resultUrl = substr($listOneUrl,2);
				$targetUrl = $webUrl.$resultUrl;
				$listUrlArray[$i] = $targetUrl;
			}
		} else {
			$html = file_get_html($listUrl);
			//解析列的每个链接到数组
			for($i = 0; $i<$count; $i++){
				//解析 dom 文档获得每个列的列链接 (将这一个写成函数,接收find 的位置和列的数量)
				//$listOneUrl = $html->find('.content_list_r ul li a',$i)->href;
				$targetUrl = $html->find($listPosition,$i)->href;
				$listUrlArray[$i] = $targetUrl;
			}
		}
		$html->clear();  /*　清除内存占用 */
		return $listUrlArray;
	}

	$listUrlArray=getListUrl($relativeAddress,$listUrl,$listPosition,$count);
	print_r($listUrlArray);
?>
