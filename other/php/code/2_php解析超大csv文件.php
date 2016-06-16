<?php
/**
*  * csv_get_lines 读取CSV文件中的某几行数据
*   * @param $csvfile csv文件路径
*    * @param $lines 读取行数
*     * @param $offset 起始行数
*      * @return array
*       * */
function csv_get_lines($csvfile, $lines, $offset = 0) {
	    if(!$fp = fopen($csvfile, 'r')) {
			     return false;
				     }
		    $i = $j = 0;
		 while (false !== ($line = fgets($fp))) {
			   if($i++ < $offset) {
				      continue;
					    }
			     break;
			    }
		 $data = array();
		 while(($j++ < $lines) && !feof($fp)) {
			   $data[] = fgetcsv($fp);
			    }
		  fclose($fp);
		     return $data;
}
#$data = csv_get_lines('/root/zsj/soft/data/dbip-city-2016-06.csv', 100, 8150900);
$data = csv_get_lines('/root/zsj/soft/data/dbip-city-2016-06.csv', 1000, 0);
print_r($data);
?>
