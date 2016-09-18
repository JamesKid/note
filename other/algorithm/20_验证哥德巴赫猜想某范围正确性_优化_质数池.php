<?php
/************************** VimKid ****************************
 *
 * Author:     VimKid
 * Description:哥德巴赫猜想2－100万 的偶数正确性验证 ,优化后只
 *			   需要38秒计算100万以内数据
 *			   添加质数池优化后
 * Method:     算法思路
 * Email:      1779156598@qq.com
 * qq:         1779156598
 * Time:       2016.6.26
 * Web:        www.vimkid.com
 *
 **************************************************************/
class GDBH {

    public function __construct(){
        $this->queue = array();
        $range = '1000';  /* 范围，认证1000000以内的偶数正确性 */
        $beginTime=microtime(true);
        $this->mainFunction($range,$beginTime);
        //print_r($this->queue);
    }

    function mainFunction($range,$beginTime){
        for($i=2;$i<=$range;$i=$i+2){
            if($i%10000==0){  // 统计每一万次计算耗时
                print_r(microtime(true)-$beginTime);
                print_r(" 秒-----".$i."用时\n");
            }
            // 判断如果在质数池能找到结果,则不执行后面
            $queueResult = $this->checkQueue($i);
            if($queueResult == true){
                continue;  //结束单次循环
            }

            $number1 = $i/2;
            $number2 = $number1;
            if($this->getTwo($number1)){ // 如果为偶数，则变为奇数
                $number1 = $number1-1;
                $number2 = $number2+1;
            }
            while($number1>0){
                if($number1==1 && $i!=2){  
                    // 当所有数字都不符合的时候，说明存在偶数不能表示为两个质数,那么哥德巴赫猜想错误
                    echo '恭喜你！！！，你找到了不符合哥德巴赫猜想的数值!!!,数字为:'.$i; die;
                }
                if($this->checkNumber($number1) || $this->checkNumber($number2)){ //检查是否3,5 是则跳过数字
                    $number1 = $number1-2;
                    $number2 = $number2+2;
                    continue;
                }else{
                    if($this->checkZhiShu($number1) && $this->checkZhiShu($number2)){ //检查是否2,3,5 规则是则跳过数字
                        //echo $i.'='.$number1.'+'.$number2."\n"; // 输出偶数对应的质数
                        $this->putQueue($number1);
                        $this->putQueue($number2);
                        break;
                    }else {
                        $number1 = $number1-2;
                        $number2 = $number2+2;
                        continue;
                    }
                }
            }
        }

    }

    /* 检查是否3,5 规则*/
    function checkNumber($number){
        if($this->getFive($number)){
            return true;
        }else if($this->getThree($number)){
            return true;
        }else {
            return false;
        }
    }
    /* 检查是否是质数 */
    function checkZhiShu($test){
        //$test = 12345; //待检测的数字
        $check = true;
        $i = 7;  // 由于排除了2,3,4,5,6, 所以由７，开始的奇数计算
        $n = floor( sqrt( $test ) );
        while( $i < $n ){
            if( $test % $i == 0 ){
                $check = false;
                $i = $n;
            }else{
                $i = $i+2;
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

    /* 质数池--(存放最接近要求偶数一半的100个数) 用队列 */
    function putQueue($number){
        // 如果已经存在元素则不入队
        if(!in_array($number,$this->queue)){
            // 如果队列大于20 则出队
            //if(count($this->queue) > 50 ){
            if(count($this->queue) > strlen($number)*8 ){
                array_shift($this->queue);
                array_push($this->queue,$number);
            }else{
                array_push($this->queue,$number);
            }
        }
    }  
    /* 检查是否在质数池 */
    function checkQueue($number){
        $result = false;
        foreach($this->queue as $k => $v){
            foreach($this->queue as $x => $y){
                if($v + $y == $number){
                    echo $number.'='.$v.'+'.$y."\n"; // 输出偶数对应的质数
                    $result = true;
                    return $result;
                }
            }
        }
        return $result;
    }
}
$init = new GDBH();

?>

