<?php
header("Content-type:text/html; Charset=utf-8");   //设定为utf8 编码方式　
ini_set('max_execution_time','3000');    //修改php.ini文件将最大处理时间定为3000秒
//$xml=simplexml_load_file("mei_tuan_xml.xml");
$xml=simplexml_load_file("xml/mei_tuan/mei_tuan_today.xml");  //加载xml文件
$time=time();        //获得今天时间戳
$from="mei_tuan_wang";        //接口数据的来源
$arr=array();       //数据数组
echo "begin,please wait...";
foreach($xml->deals->data as $data){
	//$deal_more_img = $data->deal->deal_more_img;
	//echo $data->deal->deal_more_img;
	if(strstr($data->deal->deal_district_name,"番禺")||strstr($data->deal->deal_district_name,"番禺")){
		$arr[] = array(
			'deal_catch_id' => $data->deal->deal_id,
			'deal_more_img' =>$data->deal->deal_more_img,
			'deal_title' => $data->deal->deal_title,
			'deal_img' => $data->deal->deal_img,
			'deal_cate' => $data->deal->deal_cate,
			'deal_desc' => $data->deal->deal_desc,
			'deal_price' => $data->deal->price,
			'deal_start_time' => $data->deal->start_time,
			'deal_end_time' => $data->deal->end_time,
			'deal_tips' => $data->deal->deal_tips,
			'deal_area' => $data->deal->deal_district_name,
			'deal_address' => $data->deal->deal_address,
			'deal_lng' => $data->deal->deal_lng,
			'deal_lat' => $data->deal->deal_lat,
			'deal_name' => $data->deal->deal_name,
			'deal_seller' => $data->deal->deal_seller,
			'deal_phones' => $data->deal->deal_phones,
			'deal_time' => $time,
			'deal_from' => $from,
			'deal_value' => $data->deal->value,
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
echo "complete in  (".date("Y-m-d",time()).")";
?>
