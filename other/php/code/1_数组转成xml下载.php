<?php
//excel输出
header("Content-type:application/vnd.ms-excel");
header('Content-type: charset=GBK');
header('Pragma: no-cache');
HEADER('Expires: 0');
header("Content-Disposition:filename=".date("Ymd",time()).".xls");
echo "考生号\t";
echo "姓名\t";
echo "投档成绩\t";
echo "录取方式\t";
echo "录取志愿\t";
echo "计划性质\t";
echo "录取时间\t\r\n"; 

foreach($data as $k=>$rs){
	echo $rs["考生号"]."\t";
	echo $rs["姓名"]."\t";
	echo $rs["投档成绩"]."\t";
	echo $rs["录取方式"]."\t";
	echo $rs["录取志愿"]."\t";
	echo $rs["计划性质"]."\t";
	echo $rs["录取时间"]."\t\r\n";
}
?>
