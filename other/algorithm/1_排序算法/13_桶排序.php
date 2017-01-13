<?php
/* =============================== VimKid ============================= 
* @author       : VimKid  
* @authorInfo   : 如有错漏，欢迎指正 ( 邮箱: 1779156598@qq.com )
* @title        : 桶排序(Bucket Sort)
* @description  : 介绍桶排序算法原理及代码
*
* @算法原理     : 先初始化下个桶(数组),桶大小根据数据范围定,桶的每个
*
* @序列变化     排序原序列:  8 7 3 2 5 9 5 4
*               桶序列    :  a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10
*               桶元素数量:  0  0  0  0  0  0  0  0  0  0  0 
*               入桶后数量:  0  0  1  1  1  2  0  1  1  1  0 
*
*               打印桶得到排序序列    :  2 3 4 5 5 7 8 9 
*
*
* @算法复杂度   : 时间复杂度 
*                   最优　
*                   最坏  
*                   平均  O(M+N)
*
*               : 空间复杂度
*                   最优
*                   最坏
*                   平均  
*
* @计算次数　　　　 : 排序次数: 
*                   最优： 1 (次)
*                   最坏： 1 (次)
*                   平均： 1 (次)
*
* @算法优点  1. 算法时间复杂度很小
*            2. 算法简单
*            3. 算法速度快
*
* @算法缺点  1. 如果数据范围大,但是数据量很小,就不适合
*            2. 占用内存
*
* @可优化点  1. 同样的值可以标记相应的key
*
* @具体应用  1. 考试分数排序
*
* =========================== www.vimkid.com =============================*/


class BucketSort {
    /* 
     * 1. 最简单的桶排序代码
     * @params numberList  数字列表
     */
    public function basic(){
        // 打印排序前序列
        $numberList = array(8,7,3,2,5,9,5,4); // 原始列表
        $before = '';
        foreach($numberList as $k => $v){
            $before = $before.$v.' ';
        }
        echo "排序前: ".$before."\n";

        // 定义一个桶
        for($i=0 ;$i<=10; $i++){
            $bucket[$i] = 0;
        }
        // 将序列入桶
        foreach($numberList as $k => $v){
            $bucket[$v] = $bucket[$v]+1;
        }
        // 打印桶
        $result = '';
        foreach($bucket as $k => $v){
            for($i=0; $i<$v; $i++){
                $result = $result.$k.' ';
            }
        }
        echo '排序后: '.$result;
    }
}
$bubble = new BucketSort(); // 实列化
$bubble->basic();  // 原始桶排序

?>
