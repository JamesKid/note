<?php
/* 计算2 的n次方字符串(防止整型溢出)方法 
 * 2 4 8 16 32 64  128
 */
$first = '2';
$n = 100;
$beginMemery = memory_get_usage()."内存\n"; 

/* 递归计算每一个值 */
function countNumer($n,$number){
    if($n > 1){
        $result = '';
        $numberLength = strlen($number);
        for( $i=0; $i<$numberLength; $i++){
            $nowNumber = substr($number,$i,1); 
            $afterNumber = $nowNumber*2;  // 字符运算
            if( $afterNumber > 9 ){
                $afterNumber = substr($afterNumber,1,1); // 超过10，只取后一位数字
                $beforeNumber = substr($result,-1,1); // 取得进位数字(最后一个数字)
                $result = substr_replace($result,$beforeNumber+1,-1);
            }
            $result = $result.$afterNumber;
            //print_r($result."\n");  调试语句
        }
        $n = $n-1;
        return countNumer($n,$result);
    }else{
        return $number;
    }
}

if($n > 250){
    $longNumber = countNumer(250,$first);
    $longNumber = countNumer($n-250,$longNumber);
}else{
    $longNumber = countNumer($n,$first);
}

echo $longNumber."\n";
echo memory_get_usage()-$beginMemery."MB内存使用"; 


?>
