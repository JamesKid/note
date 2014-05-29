<?php
header("Content-type:text/html; Charset=utf-8");
//$xml=simplexml_load_file("mei_tuan_xml.xml");
$xml=simplexml_load_file("testxml/mei_tuan/v2/deals.xml");
$arr=array();
foreach($xml->deals->data as $data){
	//$deal_more_img = $data->deal->deal_more_img;
	//echo $data->deal->deal_more_img;
	if(strstr($data->deal->deal_district_name,"南岸")){
		$arr[] = array(
			'deal_id' => $data->deal->deal_id,
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
		);
	}
}
var_dump($arr);
// conect database
$con = mysql_connect("192.168.1.99","gameiboy","8863166");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("moco_biz", $con);
mysql_query("set names utf8");
foreach( $arr as $info ){
	$control="insert into buss_groupon (
		buss_id,
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
		buss_phones
	) values (
		'$info[deal_id]',
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
		'$info[deal_phones]'
	) on duplicate key update 
		buss_more_img='$info[deal_more_img]',
		buss_title='$info[deal_title]',
		buss_img='$info[deal_img]',
		buss_cate='$info[deal_cate]',
		buss_desc='$info[deal_desc]',
		buss_price='$info[deal_price]',
		buss_start_time='$info[deal_start_time]',
		buss_end_time='$info[deal_end_time]',
		buss_tips='$info[deal_tips]',
		buss_area='$info[deal_area]',
		buss_address='$info[deal_address]',
		buss_lng='$info[deal_lng]',
		buss_lat='$info[deal_lat]',
		buss_name='$info[deal_name]',
		buss_seller='$info[deal_seller]',
		buss_phones='$info[deal_phones]' 
	";
	mysql_query($control,$con);
}
mysql_close($con);
echo "complete ";
?>
