<?php
/* description: this is a swoole test file 
 * use		  : php server.php 
 *				telnet 127.0.0.1 9501
 * install swoole: 参见other/php/php_note.sh
 * 
 *
 * */

$serv = new swoole_server("127.0.0.1", 9501);  
$serv->on('connect', function ($serv, $fd){  
	echo "Client:Connect.\n";  
});  
$serv->on('receive', function ($serv, $fd, $from_id, $data) {  
	$serv->send($fd, 'Swoole: '.$data);  
});  
$serv->on('close', function ($serv, $fd) {  
	echo "Client: Close.\n";  
});  
$serv->start();  
?>
