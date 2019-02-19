<?php
/*================================JamesKid============================== 
* @author         : JamesKid  
* @description    :
* @change         :
 *@Useful Website :http://www.mersenne.org/download/     #  GIMP project
* ======================================================================
*/


/* 
 *
 * Des:  计算2 的n次方字符串(防止整型溢出)方法 ,如2的100次方
 *       如 2 4 8 16 32 64  128
 *       计算2的10万次方只需要 分钟
 *       该算法复杂度为O(n),属于线性复杂度
 *
 * 注意 php需要设置php.ini ,否则php只能嵌套不能超过256层
 *      解决: vim php.ini  # 添加以下一句,将嵌套层数放大到10万
 *              xdebug.max_nesting_level=100000
 *          
 */

class TWO {
    public function __construct(){
        $first = '2';
        $n = 10000;
        $beginMemery = memory_get_usage()."内存\n"; 

        $longNumber = $this->countNumer($n,$first);
        echo $longNumber."\n";
        echo memory_get_usage()-$beginMemery."KB内存使用"; 
    }

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
            return $this->countNumer($n,$result);
        }else{
            return $number;
        }
    }
}
$init = new TWO();



?>
