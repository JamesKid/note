<?php
$x = 0.410414;
$y = equationValue($x);
print_r($y);

function equationValue($x=0){
	$y = 1/$x*(1-1/pow((1+$x),5))-2;
	return $y;
}

?>
