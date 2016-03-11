<?php
/* 
 * title:		 蒙特卡罗法( Monte Carlo method )
 * description:  蒙特卡罗法,也称统计模拟法,(个人理解)是在指定的规则下,用随机函数
 *				 随机生成随机样本，通过统计学原理样本落在规则下的概率是一定的，
 *			 	 就可以通过比例去计算结果.(可估算出结果的大致范围，抽样越多，越精确)
 * 优点:		 不需要复杂的数学推导计算，具有学习能力
 * 缺点:         数据不精确,需要更大的抽样样本才能有更高精确度
 * 算法评价:     简单粗暴，无招胜有招
 * web:          
 * slove:       1. 计算周率
 *				2. 计算定积分
 *				3. 计算立体空间复杂公式立体体积
 */

/* 　1. 计算圆周率 
 *   
 *   算法分析： 设一个半径为R的圆在边长为2R的正方形内，
 *				那么圆形面积为 πR^2 ,正方形面积为2R*2R = 4R^2
 *				圆形面积/正方形面积 = πR^2/4R^2 = π/4
 *				则 π = 圆形面积/正方形面积*4
 *				由统计学概率论可得:	π = 落在圆形上的点/落在正方形上的点*4
 *				又知圆的标准方程为 (x-a)^2+(y-b)^2 = R^2
 *				设圆心在0,0坐标，要点落在圆上，则需要: 	x^2+y^2<=R^2
 *
 *	 $times 抽样次数,越大精度越大
 */
function getPai ($times){
	$squarePoint = 0; // 落在正方形上的样本个数
	$roundPoint = 0; // 落在圆形上的样本个数
	$radius =10000;  //半径长度
	for($i=0;$i<$times-1;$i++){
		$randNumberX = rand(-$radius,$radius);  //随机抽样x值
		$randNumberY = rand(-$radius,$radius);  //随机抽样y值
		if(($randNumberX*$randNumberX+$randNumberY*$randNumberY)<=$radius*$radius){
			$roundPoint++;   //落在圆形上的样本个数加1
			$squarePoint++;  //落在正方形上的样本个数加1
		}else{
			$squarePoint++;  //如果不落在圆形上，则正方形上的样本个数加１
		}
	}
	$result = ($roundPoint/$squarePoint)*4; // π = 圆形样本个数/正方形样本个数*4
	return $result;
}	
$result = getPai(10000000);
print_r($result);

/* 　2. 计算定积分
 *   
 */
?>

