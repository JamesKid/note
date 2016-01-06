<?php

/**
 * Description: transform relative url to absolute url (将相对地址转成绝对地址的函数)
 * Author     : jameskid
 *
 *
 * @param  string $changeUrl   相对地址 
 * @param  string $mainUrl     包含主host地址的url 
 * @return string $absoluteUrl 绝对地址
 *
 */
function changeRelativeUrl($changeUrl,$mainUrl){
	$changeUrl=substr($changeUrl,8); //去除 ../../..
	$urlArray=parse_url($mainUrl);
	$absoluteUrl=$urlArray['scheme']."://".$urlArray['host'].$changeUrl;
	return $absoluteUrl;
}
/** Description: get url's list  (获得指定页面的url)
 *  Author     : jameskid
 *
 *  @param boolean  $relativeAddress 是否为相对地址 (true)
 *  @param string   $listUrl         列表所在的url  (http://www.xxx.com) 
 *  @param string   $listPosition    列表所在位置的html位置 ( .class ul li )
 *  @param int		$count			 列表有多少个文章
 *  @return array   $listUrlArray    
 */
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
?>
