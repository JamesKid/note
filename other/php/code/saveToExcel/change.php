<?php
include('exportExcel.class.php');
$file = file_get_contents('file.txt');
$title = substr($file,0,strrpos($file,'：'));   
$fileFix = str_replace($title.'：','',$file);
$contentArray = explode('、',$fileFix); 
foreach($contentArray as $k => $v){
    $eData[$k]['接通部门'] = $v;
}

$excel = new exportExcel();
$excel->excelTitle = $title;
$excel->file_name = $title;
$excel->export($eData);


?>
