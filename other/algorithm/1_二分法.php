<?php
/* 
 * title:		 二分法
 * description:  取二分中点迭代
 * web:          
 * slove:       1. 求开根(平方根等)
 *				2. 求复杂方程的值
 *				3. 求圆周率
 *
 */


/* 1. 求开根(平方根等) 
 *
 * 公式:  逼近值=(被开方数/近似数+近似数)/2
 * params:  number  被开方数
 *			times   迭代次数
 *			relate  相似数
 * 
print_r(sqrt(10));
echo "\n";
$number = 10;
$times = 5;
$relate = $number/2.0; //近似数
$result = getSquare($number,$relate,$times);

function getSquare($number,$relate,$times){
	$relate = ($number/$relate+$relate)/2.0;
	$times=$times-1;
	if($times==0){
		print_r($relate);die;
		return $relate;
	}
	getSquare($number,$relate,$times);
}
 * */



/* 2. 求圆周率
 *
 * 公式:  
 * params:  
 *			times   迭代次数
 * 
 * */


/* 其他例子 
$x = 0.410414;
$y = equationValue($x);
print_r($y);

function equationValue($x=0){
	$y = 1/$x*(1-1/pow((1+$x),5))-2;
	return $y;
}
 */

?>
