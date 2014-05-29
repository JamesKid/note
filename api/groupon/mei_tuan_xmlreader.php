<?php
header("Content-type:text/html; Charset=utf-8");
$url = "mei_tuan_xml.xml";
$reader = new XMLReader(); //实例化XMLReader
$reader->open($url);//获取xml
$name="";
$sex="";
$age="";
$i=1;
while ($reader->read()) {
	if (($reader->nodeType == XMLReader::TEXT||$reader->nodeType == XMLReader::CDATA )&&$reader->depth== '0') { //判断node类型
		$m = $i%56;
		if($m==2)
			$deal_more_img=$reader->value;
		if($m==8)
			$deal_id=$reader->value;
		if($m==9)
			$deal_title=$reader->value;
		if($m==13)
			$deal_img=$reader->value;
		if($m==15)
			$deal_cate=$reader->value;
		if($m==0){
			$age=$reader->value;
			$arr[] = array(
				'deal_more_img' => $deal_more_img,
				'deal_id' => $deal_id,
				'deal_title' => $deal_title,
				'deal_img' => $deal_img,
				'deal_cate' => $deal_cate,
			);
		}
		$i++;
	}
}
print_r($arr);
?>
