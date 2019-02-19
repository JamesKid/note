<?php
/* ================================VimKid============================== 
* @author       : VimKid  
* @authorInfo   : 如有错漏，欢迎指正 ( 邮箱: 1779156598@qq.com )
* @title        : 冒泡排序(Bubble Sort)
* @description  : 介绍冒泡排序算法原理及代码
*
* @算法原理     : 将一个序列的两个相领元素依次进行两两比较，小的往左移动，
*                 大的往右移动，经过多次比较，就可以得到一个递增的序列
*
* @序列变化     排序原序列: 8 7 3 2 5 9 4 11
*               第一次排序: 7 3 2 5 8 4 11 9  
*               第二次排序: 3 2 5 7 4 8 9 11 
*               第三次排序: 2 3 5 4 7 8 9 11  
*               第四次排序: 2 3 4 5 7 8 9 11 
*
* @算法复杂度   : 时间复杂度 
*                   最优　O(n)
*                   最坏  
*                   平均  O(N^2) 
*
*               : 空间复杂度
*                   平均  O(1)
*
* @计算次数　　　　 : 排序次数: 
*                   最优： 1     (次)
*                   最坏： N-1   (次)
*                   平均： N-1/2 (次)
*
*               : 比较次数:
*                   最优： N-1       (次)
*                   最坏： N*(N-1)   (次)
*                   平均： N*(N-1)/2 (次)
*
* @算法优点  1. 比较稳定
*            2. 算法简单
*
* @算法缺点  1. 由于每次都是比较相领两个元素所以排序比较慢
*
* @可优化点  1. 进行并发计算时，这个算法将相当快 (每个移动单元视为一个cpu, 
*               比如用人排成一队进行冒泡排序，每个人都是一个计算单元)
*
* @具体应用  1. 多人排队游戏
*
* =========================== www.vimkid.com =============================*/


class BubbleSort {
    /* 
     * 1. 原始冒泡排序代码(原始)
     * @params numberList  数字列表
     */
    public function basic(){
        $numberList = array(8,7,3,2,5,9,4,11); // 原始列表
        $numberLength = count($numberList);    //获取数组长度
        for( $i=0 ;$i<count($numberList)-1;$i++){ // 循环N-1次
            for( $j=0; $j<$numberLength-1; $j++){   // 内部两两循环N-1次
                if( $numberList[$j] > $numberList[$j+1]){ // 比较大小
                    $tmp = $numberList[$j];  // 将交换值临时存放
                    $numberList[$j] = $numberList[$j+1];   //交换值
                    $numberList[$j+1] = $tmp;  // 交换值
                } 
            }
            $times = "第".($i+1).'次排序:  ';  
            echo $times;
            foreach($numberList as $k => $v){
                echo $v.' '; // 输出第一次结果序列
            }
            echo "\n"; // 换行
        }
        echo "最终结果:   ";
        foreach($numberList as $k => $v){
            echo $v.' ';  // 输出最终结果
        }
    }
}
$bubble = new BubbleSort(); // 实列化
$bubble->basic();  // 原始冒泡排序

?>
