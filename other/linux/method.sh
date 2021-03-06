# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is note about linux use method
# @change		: add free memory 
# ======================================================================


# virtualbox  添加硬盘,添加磁盘,centos扩大容量

  1.  设置-> storage -> sata控制器 -> 右击-> 添加虚拟硬盘
  2.  fdisk -l    # 查看
  3.  fdisk /dev/sdb   
  4.  command (m for help):m    # 键入m,可看到帮助信息 
  5.  command (m for help):n    # 添加新分区
  6.  Partition number(1-4):1  # 建立一个分区
  7.  First cylinder (1-15908,default 1):Enter 
  8.  command (m for help):w    # 写入并退出
  9.  sudo mkdir /work      # 创建挂载点
  10. sudo mount -t ext4 /dev/sdb1 /work   # 将新磁盘分区挂载到/work目录下 
  11. df -h   # 查看挂载
  12. vim  sudo vim /etc/fstab   # 后面加入下面行
           /dev/sdb1 /work ext4 errors=remount-ro 0 1   # 开机自动挂载


# let the file can be ecute (让bin文件可执行) 
		 # 拷贝/dir/usr/bin/ 执行文件到/usr/bin/下即可
				cp /opt/ab/usr/bin/ab /usr/bin/
				
# crontab every second execute (crontab 每秒执行shell实现方法)
	#!/bin/bash  
	step=2 #间隔的秒数，不能大于60  
	for (( i = 0; i < 60; i=(i+step) )); do  
		$(php '/home/fdipzone/php/crontab/tolog.php')  
		sleep $step  
	done  
	exit 0  
	# * * * * * /home/fdipzone/php/crontab/crontab.sh  
	.

# test network speed (网速测试)
	 wget https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py --no-check-certificate
	 chmod a+rx speedtest_cli.py
	 sudo mv speedtest_cli.py /usr/local/bin/speedtest-cli
	 sudo chown root:root /usr/local/bin/speedtest-cli
	 speedtest-cli
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

