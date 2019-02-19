<?php
/* client.php 
 * 客户端代码 
 *  
 *  @author guisu.huang 
 *  @since 2012-04-11 
 * */  
fwrite(STDOUT,"Please input a argument:");
$arg = trim(fgets(STDIN));
while($arg!="exit"){
	set_time_limit(0);  
	$host = "127.0.0.1";  
	$port = 2046;  
	$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)or die("Could not create  socket\n"); // 创建一个Socket  
	$connection = socket_connect($socket, $host, $port) or die("Could not connet server\n");    //  连接  
	socket_write($socket,$arg) or die("Write failed\n"); // 数据传送 向服务器发送消息  
	//while ($buff = socket_read($socket, 1024, PHP_NORMAL_READ)) {  
		//echo("Response was:" . $buff . "\n");  
	//}  
	$arg = trim(fgets(STDIN));
}
socket_close($socket);  
?>
