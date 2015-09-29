# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is note about linux use method
# @change		: add free memory 
# ======================================================================

# crontab every second execute (crontab 每秒执行shell实现方法)
	#!/bin/bash  
	step=2 #间隔的秒数，不能大于60  
	for (( i = 0; i < 60; i=(i+step) )); do  
		$(php '/home/fdipzone/php/crontab/tolog.php')  
		sleep $step  
	done  
	exit 0  
	# * * * * * /home/fdipzone/php/crontab/crontab.sh  

# search the yum soft path 
	rpm -ql package-name
# free memery in centos 
	# free in one time 
		sync 
		echo 3 > /proc/sys/vm/drop_caches    # free memory 
	# free always 
		vim /root/shTools/freemem.sh

			#!/bin/bash
			used=`free -m | awk 'NR==2' | awk '{print $3}'`
			free=`free -m | awk 'NR==2' | awk '{print $4}'`

			echo "===========================" >> /var/log/mem.log
			date >> /var/log/mem.log
			echo "Memory usage | [Use：${used}MB][Free：${free}MB]" >> /var/log/mem.log

			if [ $free -le 100 ] ; then
				sync && echo 1 > /proc/sys/vm/drop_caches
				sync && echo 2 > /proc/sys/vm/drop_caches
				sync && echo 3 > /proc/sys/vm/drop_caches
				echo "OK" >> /var/log/mem.log
			else
				echo "Not required" >> /var/log/mem.log

		echo "*/30 * * * * root /root/shTools/freemem.sh" >> /etc/crondtab

# cannnot install soft with yum 
	# Error: Cannot retrieve metalink for repository: epel. Please verify its path and try again
	   # method1
			vim /etc/yum.repos.d/epel.repo

			#baseurl
			mirrorlist

			改成

			baseurl
			#mirrorlist
		# method2
			vim /etc/reslove.conf
				nameserver 173.252.246.102
				nameserver 8.8.8.8
			yum clean all  # 清除缓存
			
# 5. 服务器经常断线
			yum install screen  # 如果安装中服务器会断线的话 可装screen
			screen -S lnmp 

			screen -r lnmp  # 重新链接
# 6. 去掉centos 的边和标题大小

	vim
		/usr/share/themes/Slider/metacity-1/metacity-theme-1.xml
	# fix 
		 has_title="false"
		 <distance name="title_vertical_pad" value="0"/> 
	   　<border name="title_border" left="10" right="10" top="0" bottom="0"/>
		 <border name="button_border" left="0" right="0" top="0" bottom="0"/>
# 7 恢复误删文件
	# 查看所在硬盘
	df
	>debugfs /dev/md0
	>debugfs
		debugfs: lsdel    # 显示删除文件
	>debugfs 
		debugfs: dump<块代号> /tmp/file.sav  # 恢复删除文件

