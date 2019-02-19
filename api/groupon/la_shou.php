<?php
header("Content-type:text/html; Charset=utf-8");   //设定为utf8 编码方式　
ini_set('max_execution_time','3000');    //修改php.ini文件将最大处理时间定为3000秒
//$xml=simplexml_load_file("mei_tuan_xml.xml");
$xml=simplexml_load_file("xml/la_shou/la_shou_today.xml");  //加载xml文件
$time=time();        //获得今天时间戳
$from="la_shou_wang";        //接口数据的来源
$arr=array();       //数据数组
echo "begin,please wait...";
foreach($xml->url as $data){
	//$deal_more_img = $data->deal->deal_more_img;
	//echo $data->deal->deal_more_img;
	if(strstr($data->data->shops->shop->area,"番禺")||strstr($data->data->shops->shop->area,"番禺")){
		$arr[] = array(
			'deal_catch_id' => $data->data->display->identifier,
			'deal_more_img' =>'',
			'deal_title' => $data->data->display->title,
			'deal_img' => $data->data->display->image,
			'deal_cate' => $data->data->display->class,
			'deal_desc' => $data->data->display->detail,
			'deal_price' => $data->data->display->price,
			'deal_start_time' => $data->data->display->startTime,
			'deal_end_time' => $data->data->display->endTime,
			'deal_tips' => $data->data->display->tip,
			'deal_area' => $data->data->shops->shop->area,
			'deal_address' => $data->data->shops->shop->addr,
			'deal_lng' => $data->data->shops->shop->longitude,
			'deal_lat' => $data->data->shops->shop->latitude,
			'deal_name' => $data->data->shops->shop->name,
			'deal_seller' => $data->data->shops->shop->name,
			'deal_phones' => $data->data->shops->shop->tel,
			'deal_time' => $time,
			'deal_from' => $from,
			'deal_value' => $data->data->display->value,
		);
	}
}
//var_dump($arr);

// conect database 
$con = mysql_connect("192.168.1.99","gameiboy","8863166");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("moco_biz", $con);
mysql_query("set names utf8");
foreach( $arr as $info ){  //遍历数组写入数据库
	$control="insert into buss_groupbuy (
		buss_catch_id,
		buss_more_img,
		buss_title,
		buss_img,
		buss_cate,
		buss_desc,
		buss_price,
		buss_start_time,
		buss_end_time,
		buss_tips,
		buss_area,
		buss_address,
		buss_lng,
		buss_lat,
		buss_name,
		buss_seller,
		buss_time,
		buss_from,
		buss_value,
		buss_phones
	) values (
		'$info[deal_catch_id]',
		'$info[deal_more_img]',
		'$info[deal_title]',
		'$info[deal_img]',
		'$info[deal_cate]',
		'$info[deal_desc]',
		'$info[deal_price]',
		'$info[deal_start_time]',
		'$info[deal_end_time]',
		'$info[deal_tips]',
		'$info[deal_area]',
		'$info[deal_address]',
		'$info[deal_lng]',
		'$info[deal_lat]',
		'$info[deal_name]',
		'$info[deal_seller]',
		'$info[deal_time]',
		'$info[deal_from]',
		'$info[deal_value]',
		'$info[deal_phones]'
	) 
	";
	mysql_query($control,$con);
}
mysql_close($con);
echo "complete in (".date("Y-m-d",time()).")";
?>
