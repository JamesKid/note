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
	if ($reader->nodeType == XMLReader::TEXT||$reader->nodeType == XMLReader::CDATA) { //判断node类型
		$m = $i%3;
		if($m==1)
			$name=$reader->value;
		if($m==2)
			$sex=$reader->value;
		if($m==0){
			$age=$reader->value;
			$arr[] = array(
				'name' => $name,
				'sex' => $sex,
				'age' => $age
			);
		}
		$i++;
	}
}
print_r($arr);
?>
