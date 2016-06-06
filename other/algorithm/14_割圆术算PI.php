<?php
/*
 * 圆标准方程:(X-a)^2+(Y-b)^2=R^2
 * 圆原点方程: X^2+Y^2=R^2
 * 切线方程:
 *		X1*X+Y1*Y=1
 *		x1*x=1-Y1*Y
 *		x=(1-Y1*Y)/X1
 * 点P(m,n)切线方程:   y=(x-m)(a-m)/(n-b)+n
 *					   y=(x-m)(-m)/2n
 *					   y=-xm+m^2/2n
 *					   y*2n=-xm+m^2
 *					   y*2n-m^2=-xm
 *					   -xm=y*2n-m^2
 *					   -x = y*2n-m^2/m
 *					    x = y*2n-m^2/m
 *
 *
 * 算法原理:  
 *		基本原理和设定:
 *			设圆半径为1
 *			设圆贴在在六边形内
 *			则:六边形顶边的方程为:y=1
 *			设最上的边L1为顶点PD到Y轴的距离
 *			则最上的顶点PD到Y坐标轴的距离(即X值)为边长的一半
 *			周长＝L1*2*边数
 *			由于一开始是六边形开始分割，所以每分割一次边数的变化为12,24,48,96,...即2倍增量
 *				
 *		迭代具体操作:
 *			第一步: 求出顶点PD的X坐标值X1
 *			第二步: 构造原点到X1的直线方程LE,
 *			第三步: 直线方程LE与圆的交点则为切点PQ，求出切点PQ
 *			第四步: 求出点PQ在圆上的切线LQ
 *			第五步: 切线LQ与y=1 的交点则为新的顶点
 *			第六步: 定义结束精度 
 *			第七步: 第六步不成立，返回第一步迭代下一个精度
 *
 */
/* 定义初始值 */
$PD = sqrt(1/3);  # 定义第一个项点
geYuanShu($PD);
function geYuanShu($PD){
	$x='';
	$y='';
	//$LE = $x/$PD;
	//($x/$PD)^2+$x^2=1;
	$PDP = pow($PD,2);
	$PQ_x=sqrt($PDP/(1+$PDP));   //转换以上公式得得x的值
	$PQ_y= $PQ_x/$PD;
	/* x=(1-Y1*Y)/X1 */
	$newPD = (1-$PQ_y*sqrt(1/3))/$PQ_x;
	print_r($newPD);die;
	geYuanShu($newPD);

}
/* 
 * 3.141 5926 5358 9793 2384 6264 3383 2795 0238 4197 1693 9937 5105 8209 7494 4592 3078 1640 6286 2089 9862 8034 8753 4211 7067 9321 4808 6513 2823 0664 7093 8446 0955 0582 2317 2535 9408 1284 8113 7450 2841 0270 1938 5211 0595 9644 6229 4895 4930 3819 6442 8810 9756 6503 3446 1284 7564 8233 7867 8316 5271 2019 0914 5648 5669 2346 0348 6104 5432 6618 2133 9360 7260 2491 4127 3724 5870 0660 6315 5881 7488 1520 9209 6282 9754 0917 1536 4367 8925 9036 0011 3305 3054 8820 4665 2138 4145 9519 4151 1509 4330 5727 0365 7595 9195 3092 1861 1738 1932 6117 9310 5118 5480 7445 2379 9627 4956 7351 8857 5272 4891 2279 3818 3011 9491 2983 3671 3624 4055 6643 0860 2139 4946 3952 2473 7190 7021 7986 0943 7027 7055 9217 1762 9317 6752 3846 7481 8467 6691 0513 3000 5681 2714 5263 5808 2778 5771 3427 5278 9609 1736 3717 8721 4684 4090 1224 5534 3014 6549 5853 3105 0792 2796 8925 8723 5420 1994 6112 1290 2196 0864 0344 1815 9813 6297 3477 1309 9605 1870 7211 3499 9999 8372 9280 4995 1059 7117 3281 6096 3185 9502 4159 4553 4690 8302 6425 2230 8253 3846 8503 5261 9311 8817 1010 0031 3783 8865 8753 3208 3814 2061 2177 6691 4730 3598 2534 9018 8755 4687 3115 9562 8538 8239 3783 5937 5195 7781 8577 8053 2171 2268 0661 3001 9278 7661 1195 9092 1642 9198 9180 9525 7301 0654 8586 3278 3615 3381 8279 6823 0301 9520 3530 1852 0649 9577 3622 9724 1189 7217 7528 3479 1315 1557 1557 4857 2424 5415 0695 9506 2953 5116 8612 2785 5889 0750 9818 1754 6374 6493 9339 2550 6040 0927 7016 7113 9009 8488 2401 2889
 */
?>

