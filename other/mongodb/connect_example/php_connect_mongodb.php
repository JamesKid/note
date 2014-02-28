<?php
$m = new Mongo("127.0.0.1");       //connect to mongs
$db = $m->admin;                     //选择一个数据库(user001)
$collection = $db->collection1;           //选择一个collection(user_001)
$result = $collection->find();
foreach($result as $val){
   print_r($val);
}
echo "<br><br>";
foreach($result as $val){
	echo "用户ID:".$val["uid"]."<br>";
	echo "用户姓名:".$val["username"]."<br>";
	echo "用户性别:".$val["sex"]."<br>";
	echo "用户年龄:".$val["age"]."<br>";
}
// disconnect
$m->close();
?>



