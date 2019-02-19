/*  栏目点击统计  
		use moco_common;
		select screen_buttonname,count(1)
		from comm_screen
		where area_id=5 and screen_time>1416499200
		group by screen_buttonname
*/
/*  每日点击统计   
		use moco_common;
		select DATE_FORMAT(FROM_UNIXTIME(screen_time),'%Y-%m-%d'), count(1) 
		from comm_screen 
		where screen_time >1416499200
		group by DATE_FORMAT(FROM_UNIXTIME(screen_time),'%Y-%m-%d')
*/
/*  设备点击统计   
		use moco_common;
		select screen_device, count(1) 
		from comm_screen 
		where screen_time >1416499200 and screen_type = 1
		group by screen_device
*/
/*  中奖统计  
		use moco_biz;
		select rou_name,count(1)
		from buss_rourecord where rou_allowed=1 and rou_time > 1416499200
		group by rou_name

 */ 

