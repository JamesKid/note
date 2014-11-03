# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is note about linux use method
# @change		: add free memory 
# ======================================================================

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

		vim /etc/yum.repos.d/epel.repo

		#baseurl
		mirrorlist

		改成

		baseurl
		#mirrorlist

