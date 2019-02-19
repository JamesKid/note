<?php
	/* 计算五边形包五角星的三角形数量 */
	$beginTime=microtime(true);
	$string = array();
	$string['a'] = array('ab','ac','ad','ae','af','ag','ai','aj');
	$string['b'] = array('ba','bc','bd','be','bf','bh','bj','bi');
	$string['c'] = array('ca','cb','cd','ce','cf','ci');
	$string['d'] = array('da','db','dc','de','dg','dj');
	$string['e'] = array('ea','eb','ec','ed','eg','eh','ei','ej');
	$string['f'] = array('fa','fb','fc','fh','fi','fj');
	$string['g'] = array('ga','gd','ge','gh','gi','gj');
	$string['h'] = array('hb','he','hf','hg','hi','hj');
	$string['i'] = array('ia','ib','ic','ie','if','ig','ih','ij');
	$string['j'] = array('ja','jb','jd','je','jf','jh','jg','ji');
	$order=array('a','b','c','d','e','f','g','h','i','j');
	$result = array();
	foreach($order as $h=>$i){
		foreach ($string[$i] as $k=>$v ){
			foreach($string[$i] as $a=>$b){
				if($b>$i){
					foreach ($string[substr($b,1)] as $bk=>$bv ){
						if(substr($bv,1)!=substr($v,0)){
							if(substr($bv,1)==substr($v,1)){
								if(substr($b,1)>$i&&substr($v,1)>substr($b,1)){
									$result[]=$i.substr($b,1).substr($v,1);
								}
							}
						}
					}
				}
			}
		}
	}
	$third = array('acf','aci','afi','adg','adj','agj','bcd','bce','bde','bfh','bfj','bhj','cde','cfi','dgj','egh','egi','ehi','fhj','ghi');//排除在同一直线上的三个点
	$result = array_diff($result,$third);
	print_r($result);
	print_r('总数'.count($result));
	echo "\n";
	$endTime=microtime(true);
	$useTime=$endTime-$beginTime;
	echo '用时'.$useTime;

?>
