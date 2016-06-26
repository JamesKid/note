<?php
$number ='23449999999999995';// 用字符串要加引号

$range = '10000';  /* 范围，认证1000以内的偶数正确性 */
mainFunction($range);

function mainFunction($range){
	for($i=2;$i<=$range;$i=$i+2){
		$number1 = $i/2;
		$number2 = $number1;
		while($number1>0){
			if($number1==1 && $i!=2){  // 当所有数字都不符合的时候，说明哥德巴赫，不能表示为两个质数
				echo '恭喜你！！！，你找到了不符合哥德巴赫猜想的数据!!!,数字为:'.$i;
				die;
			}
			if(checkNumber($number1) || checkNumber($number2)){ //检查是否2,3,5 规则是则跳过数字
				$number1 = $number1-1;
				$number2 = $number2+1;
				continue;
			}else{
				if(checkZhiShu($number1) && checkZhiShu($number2)){ //检查是否2,3,5 规则是则跳过数字
					echo $i.'='.$number1.'+'.$number2."\n";
					break;
				}else {
					$number1 = $number1-1;
					$number2 = $number2+1;
					continue;
				}
			}
		}
	}

}
/* 检查是否2,3,5 规则*/
function checkNumber($number){
	if(getTwo($number)){
		return true;
	}else if(getFive($number)){
		return true;
	}else if(getThree($number)){
		return true;
	}else {
		return false;
	}
}
/* 检查是否是质数 */
function checkZhiShu($test){
	//$test = 12345; //待检测的数字
	$check = true;
	$i = 2;
	$n = floor( sqrt( $test ) );
	while( $i < $n ){
		if( $test % $i == 0 ){
			$check = false;
			$i = $n;
		}else{
			$i += 1;
		}
	}
	if( $check ){
		return true;
	}else{
		return false;
	}
}

/* 获取数字和是否2倍数,是返回true */
function getTwo($number){
	$last = substr($number,-1);
	if(($last == 0 || $last ==2 || $last == 4 || $last ==6 || $last == 8 ) && $number!=2){
		return true;
	}else{
		return false;
	}
}

/* 获取数字和是否3倍数,是返回true */
function getThree($number){
	$length = strlen($number);
	$sum = 0;
	for($i=0;$i<$length;$i++){
		$sum=$sum + substr($number,$i,1);
	}
	if($sum%3==0 && $length!=1){
		return true;
	}else{
		return false;
	}
}

/* 获取数字和是否5倍数,是返回true */
function getFive($number){
	$last = substr($number,-1);
	$length = strlen($number);
	if($last == 5 && $length!=1){  // 排除数字5,因为5是质数
		return true;
	}else {
		return false;
	}
}
?>
