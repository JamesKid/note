<?php
function insertToDataBase($arr){
	$con = mysql_connect("192.168.1.77:99","username","8877");
	if (!$con) {
		die('Could not connect: ' . mysql_error());
	}
	mysql_select_db("moco_infos", $con);
	mysql_query("set names utf8");
	foreach( $arr as $info ){  //遍历数组写入数据库
		$control="insert into infos_out_news (
			`content`,
			`update_time`,
			`from`,
			`author`,
			`title`,
			`view`,
			`url`,
			`type`,
			`sub_category`,
			`web_name`,
			`img`
		) values (
			'$info[content]',
			'$info[update_time]',
			'$info[from]',
			'$info[author]',
			'$info[title]',
			'$info[view]',
			'$info[url]',
			'$info[type]',
			'$info[sub_category]',
			'$info[web_name]',
			'$info[img]'
		) on duplicate key update 
			`content`='$info[content]',
			`update_time`='$info[update_time]',
			`from`='$info[from]',
			`author`='$info[author]',
			`title`='$info[title]',
			`view`='$info[view]',
			`url`='$info[url]',
			`type`='$info[type]',
			`sub_category`='$info[sub_category]',
			`web_name`='$info[web_name]',
			`img`='$info[img]'
		";
		mysql_query($control,$con);
	}
	mysql_close($con);
}
?>
