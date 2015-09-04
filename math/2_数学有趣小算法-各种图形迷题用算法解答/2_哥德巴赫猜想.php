<?php
$beginTime=microtime(true);
$jingdu = 1000;  //精度100以内的数
$zhiShu = getZhiShu($jingdu);
$add = getResult($jingdu,$zhiShu);
print_r($add);
echo "\n";
print_r(count($add));
$endTime=microtime(true);
$useTime=$endTime-$beginTime;
echo "\n";
echo $useTime;
die;
/* 获得质数 */
function getResult($jingdu,array $zhiShu){
	$add = array();
	$add[2]="1+1";
	for($i=2;$i<=$jingdu;$i++){
		if($i%2==0){
			foreach($zhiShu as $k=>$v){
				if($v>$i){break;}
				if($v>=$i/2){
					foreach($zhiShu as $a=>$b){
						if($i>1000&&$v<$i-250){break;}
						if($b>350){break;}
						if($b>$i||($b+$v)>$i){break;}
						if(($v+$b)==$i){
							$add[$i]=$v.'+'.$b;
						}
					}
				}
			}
		}
	}
	return $add;
}
function getZhiShu($jingdu){
	$result = array();
	for($i=1;$i<$jingdu;$i++){
		$k=0;
		for($j=1;$j<$i;$j++){
			if($i%$j==0){
				$k++;
			}
		}
		if($k==1) {
			$result[]=$i;
		}
	}
	return $result;
}
?>
