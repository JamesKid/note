# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is note about linux use method
# @change		: add free memory 
# ======================================================================

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

