#=========================JamesKid==================================
#!/bin/bash 
# Description:  this program  is the linux note from internet
# Editor:       zhangshijie 
# Email:		406358964@qq.com 
# Version:      1.0 
# History:      2014_01_16 creat zsj
#               2014_01_16 add path
#               2014_03_04 add mount
#               2014_03_05 add full screen in centos
#               2014_03_05 add path of autorun 
#               2014_03_24 add server build ,user control
#===================================================================
# command
	# chkconfig 
			# des: 
				show what service autostart when poweron 
			# exp:
				chkconfig --add servicename		# add service 
				chkconfig --del servicename		# delete service 
				chkconfig --list servicename	# show detail of servicename
				chkconfig httpd on				# let httpd autorun on 
				chkconfig httpd off				# let httpd autorun on 
				chkconfig --level 35 httpd on	# let level 3 and level 5 httpd 
												# auto run on 
	# du 
		# des:
			show the file size 
		# from : http://www.centoscn.com/CentOS/help/2013/1014/1821.html
		# use 
			du -sh /path  # show the path directory size
			du -c		  # show all the fille size in the directory 
			du --max-depth=1 -h  # show the file size under one level of this 
								 # directory 

		# option 
			-a: 显示目录中个别文件的大小;
			-b: 显示目录或文件大小时，以byte为单位;
			-c: 除了显示个别目录或文件的大小外，同时也显示所有目录或文件的总和;
			-D: 显示指定符号连接的源文件大小;
			-h: 以K，M，G为单位，提高信息的可读性;
			-H: 与-h参数相同，但是K，M，G是以1000为换算单位;
			-k: 以1024 bytes为单位;
			-l: 重复计算硬链接文件;
			-L<符号连接>: 显示选项中所指定符号链接(软链接)的源文件大小;
			-m: 以1MB为单位;
			-s: 显示总计大小;
			-S: 显示个别目录的大小时，并不含其子目录的大小;
			-x: 以一开始处理时的文件系统为准，若遇上其它不同的文件系统目录则略过;
			–exclude=<目录或文件>: 略过指定的目录或文件;
			–max-depth=<目录层数>: 超过指定层数的目录后，予以忽略;

	# eog
		# des
			read photo file ( 图片查看命令)
			eog -f path			# read the jpg,png file 
	# evince	
		# read  pdf file  ( pdf 文件查看命令)
			evince filename.pdf   # read the pdf file 
	# add find
		find path -name filename # search file name
	# free 
			# check the free memory
				free -m
	# grep	
			# grep  line before and after
				grep -5 'pattern' inputfile    # output before and after 5 line
				grep -C 5 'pattern' inputfile  # output before and after 5 line
				grep -A 5 'pattern' inputfile  # output after 5 line 
				grep -B 5 'pattern' inputfile  # output before 5 line
			# simple
				ll | grep 'host'
	# history 
			# exe the history use history code
				history | grep 'cd ' # grep the history about cd command
				history 10			 # show 10 history 
				!n					 # n is the history number
				!!					 # excute last command
				!?String?			 # search the latest match command
	# ls 
			# ls -lh				# show files size with kb,mb
	# lsof 
		lsof abc.txt # show the progress of abc.txt 
	# mount 
			# mount
				# mount windows disk in virtual machine
					1. share your directory in windows and remember the share name 
					2. mount it 
						mount -t cifs -o username=administrator,password=zhangshijie 
						//192.168.1.100/workzhang /mnt/windows/e

			# umount
				umount /mnt/windows/e	# umount the path /mnt/windows/e
	# netstat	

				netstat -atn     # show the connet station in linux
	# ps 
		# show the progress 
			ps -aux | sort -k4nr | head -5  # 查看占有内存最多的前五条进程
	# rpm 
		# 安装(install)
			rpm -ivh xxx.rpm
		# 反安装
			rpm -e xxx
			
		# 升级软件(update)
			#下载更新版本的软件 xxx.rpm
			rpm -Uvh xxx.rpm # 升级
	# sed 
		# commend
			sed -n '5,10p' /etc/passwd  # show the 5 to 10 line 
			sed 's/123/456/g' file.txt > new_file.txt # change 123 from file.txt 
											# to 456 and save it to new_file.txt
			sed -i 's/123/456/g' file.txt # change 123 to 456 in file.txt 

	# ssh 
			# use ssh with port
				ssh name@host -p port
			# fix the ssh port
				# 1 open 
					/etc/ssh/sshd_config
				# 2 remove 
					remove '#' before the 'port 22'
				# 3 restart
					/etc/init.d/ssh restart
			# forbid root to login
				# 1 open 
					/etc/ssh/sshd_config
				# 2 remove
					remove '#' before 'PermitRootLogins yes' and fix 'yes' to 'no'

			# mount ssh file system (挂载shh 远程目录到本地)
				# web 
					http://crazytoon.com/2008/10/07/sshfs-how-do-you-install-sshfs-and-fuse-centoslinuxredhat/
				# install fuse
					wget http://dxdown4.onlinedown.net/down/fuse-2.7.4.tar.zip
					tar -xzvf fuse-2.7.4.tar.zip
					./configure
					cd fuse-2.7.4.tar.zip
					make 
					make install
					
				# install sshfs 
					wget  http://nchc.dl.sourceforge.net/project/fuse/sshfs-fuse/2.4/sshfs-fuse-2.4.tar.gz 
					tar -xzvf sshfs-fuse-2.4.tar.gz
					./configure
					cd sshfs-fuse-2.4.tar.gz
					make 
					make install
				# use 
					sshfs root@192.168.1.100:/tmp/ /tmp/

	# tar 
		# 解压tar
			tar -xzvf filename
		# 解压bz2
			tar jxvf filename 
		# 压缩
			tar zcvf filename.tar.gz filename 

		# 各种压缩
			01-.tar格式
			解包：[＊＊＊＊＊＊＊]$ tar xvf FileName.tar
			打包：[＊＊＊＊＊＊＊]$ tar cvf FileName.tar DirName（注：tar是打包，不是压缩！）

			02-.gz格式
			解压1：[＊＊＊＊＊＊＊]$ gunzip FileName.gz
			解压2：[＊＊＊＊＊＊＊]$ gzip -d FileName.gz
			压 缩：[＊＊＊＊＊＊＊]$ gzip FileName

			03-.tar.gz格式
			解压：[＊＊＊＊＊＊＊]$ tar zxvf FileName.tar.gz
			压缩：[＊＊＊＊＊＊＊]$ tar zcvf FileName.tar.gz DirName

			04-.bz2格式
			解压1：[＊＊＊＊＊＊＊]$ bzip2 -d FileName.bz2
			解压2：[＊＊＊＊＊＊＊]$ bunzip2 FileName.bz2
			压 缩： [＊＊＊＊＊＊＊]$ bzip2 -z FileName

			05-.tar.bz2格式
			解压：[＊＊＊＊＊＊＊]$ tar jxvf FileName.tar.bz2
			压缩：[＊＊＊＊＊＊＊]$ tar jcvf FileName.tar.bz2 DirName

			06-.bz格式
			解压1：[＊＊＊＊＊＊＊]$ bzip2 -d FileName.bz
			解压2：[＊＊＊＊＊＊＊]$ bunzip2 FileName.bz

			07-.tar.bz格式
			解压：[＊＊＊＊＊＊＊]$ tar jxvf FileName.tar.bz

			08-.Z格式
			解压：[＊＊＊＊＊＊＊]$ uncompress FileName.Z
			压缩：[＊＊＊＊＊＊＊]$ compress FileName

			09-.tar.Z格式
			解压：[＊＊＊＊＊＊＊]$ tar Zxvf FileName.tar.Z
			压缩：[＊＊＊＊＊＊＊]$ tar Zcvf FileName.tar.Z DirName

			10-.tgz格式
			解压：[＊＊＊＊＊＊＊]$ tar zxvf FileName.tgz

			11-.tar.tgz格式
			解压：[＊＊＊＊＊＊＊]$ tar zxvf FileName.tar.tgz
			压缩：[＊＊＊＊＊＊＊]$ tar zcvf FileName.tar.tgz FileName

			12-.zip格式
			解压：[＊＊＊＊＊＊＊]$ unzip FileName.zip
			压缩：[＊＊＊＊＊＊＊]$ zip FileName.zip DirName

			13-.lha格式
			解压：[＊＊＊＊＊＊＊]$ lha -e FileName.lha
			压缩：[＊＊＊＊＊＊＊]$ lha -a FileName.lha FileName

			14-.rar格式
			解压：[＊＊＊＊＊＊＊]$ rar a FileName.rar
			压缩：[＊＊＊＊＊＊＊]$ rar e FileName.rar     
			rar请到：http://www.rarsoft.com/download.htm 下载！
			解压后请将rar_static拷贝到/usr/bin目录（其他由$PATH环境变量
			指定的目录也行）：[＊＊＊＊＊＊＊]$ cp rar_static /usr/bin/rar
	# top 
		# use 
			top -d 1 # show the progress info 
			shift + M  # range with memery 
	# tree
			# des:
				this command can show the trees of the directory in the linux, 
				you need to use "yum install tree" to install this in centos.

			# exp:
				tree			# show tree directilly 
				tree --help		# show tree's command help
				tree -N			# show tree's allow chinese language
				tree -L 1		# just show the first level directory
				tree -L 2		# just show two level directory 
	# wall 
		   # des: 
				send message to the other user in same host
		   # exp:
				wall hello    # send a hello 
	# watch 
			# des:
				this command is show other command dynamically(动态显示命令变化)
			# exp:
				watch -n 1 -d ls -al # show ls -al every 1 second(每秒显示一次ls -al 
				watch -n 1 -d 'pstree|grep http' # show http station every one 
												# second (每秒显示http链接数变化)
				watch -d 'ls -l | grep scf '   # 监测当前目录中scf的文件变化
				watch 'netstat -an | grep:21|\grep<模拟攻击客户机的ip> | wc -l '
				watch -n 10 'cat /proc/loadavg' # 10秒输出系统的平均负载
			# param:
				-n    # second 
				-d	  # command    
				-t	  # hide the head time  (隐藏第一行的时间)
			# control
				ctrl+x  # change terminal 
				ctrl+g  # exit wath 

				


	# yum	
			# des:
				this command can manage the soft
			# exp:
				yum install XXX     # install package
				yum search XX	    # search the package
				yum list	  	    # list all the can install package
				yum list updates    # list all the package that can update
				yum list installed  # list all the installed package
				yum list extras     # list all not in yum repository's package
				yum remove XXX      # remove package
				yum list XXX        # list xxx package
				yum info		    # show the package's information
				yum info updates    # show the the update information
				yum info installed  # show installed information
				yum provides        # list at the package include
				yum clean packages  # clean the /var/cache/yum 's package
				yum clean headers   # clean the /var/cache/yum 's headers
				um clean oldheaders # clean the /var/cache/yum 's old headers
				yum update			# update the system
				yum deplist XXX     # check the dependency 
				yum -y install php  # install php with no asking
			# download package only 
				# install yum-downloadonly
				yum install yum-downloadonly 
				# command
				yum install --downloadonly --downloaddir=/tmp vsftpd
	# zip 
			zip -q -r duxcms.zip /var/www/duxcms    # zip the directory
			zip -q -r duxcms.zip *					# zip all in this directory
			unzip duxmcms.zip       # unzip file



# server build
	# server
		# ftp
			# install
				rpm -q vsftpd	        # check if you install vsftpd
				yum -y install vsftpd	# install vsftpd
				service vsftpd restart	# restart vsftpd
				vim /etc/vsftpd/vsftpd.conf
					anonymous_enable=NO	 # forbid anonymous login
					chroot_local_user=YES # let the user only in it's root
				useradd -s /sbin/nologin -d /var/www/html zsj # add a user zsj 
				passwd zsj				# add a password to zsj
				chmod o+w /var/www/html # give the /var/www/html auth
				setenforce 0			# close the selinux
				service vsftpd restart	# restart the vsftpd
				service iptables stop	# stop the firewall
			# login
				# login in windows cmd 
					> ftp
					> open 192.168.72.128 [port]
					> username 
					> password
					
		# sftp		
			# install 

			# login
				sftp gameiboy@192.168.1.99			# login to  default directory 
				sftp gameiboy@192.168.1.99:/var/www	# login to /var/www 
				sftp -oPort=33334 jameskid@192.168.72.129 # login with port
				sftp -oPort=33334 jameskid@192.168.72.129:/tmp # login /tmp

				# vim look sftp
					:Nread scp://jameskid@192.168.72.129:33334//tmp/zsj.txt

			# tips
				sftp帐号基于ssh账号的,只要限制用户的可用目录即可



				
		# samba
		# ssh
		# vpn 
		# vps
		# dhcp
	# tips
		service sshd status			# check the status of ssh
		service dhcpd status		# check the status of dhcp
		#　centos 图形界面启动改成命令行界面启动
			vim /etc/inittab 
			id:5  改成 id:3



# user control
	# add 
		adduser tommy 
		useradd -G blog zh   #add  user zh to group blog 
		useradd -d /var/ftp/pub -M ftp admin  #创建一个新用刻，指定目录/var/ftp/pub

		passwd  tommy

	# change password
		passwd  tommy
	# give a user root auth 
		vim /etc/sudoers
			# 方法一
				# 找到下面这行,在root下面添加一行,如下所示:
					## Allow root to run any commands anywhere
						root ALL=(ALL) ALL
						tommy ALL=(ALL) ALL
				# tommy 账号登录后用su -获得root 操作权限


		
	# show 
		w	# show what user now do and how much cpu they use 
		who # show what user here
	# kick user
		pkill -KILL -t pts/0	# kick the user in pts/0 
	# delete
		userdel username # delete user but not delete home directory 
		userdel -r username  # delete user and users home
# group control 
	groupadd blog   # add a blog group 
	usermod -G blog zh888  # add user zh888 to group blog
	groupdel blog    # delete blog group 


# save 
	# iptables
		/etc/init.d/iptables status	# show the iptables status
		/etc/init.d/iptables stop	# stop iptables
		chkconfig --level 35 iptables off # close iptables forever
		# path of iptables
		/etc/sysconfig/iptables
		-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT  # accept the ftp port 21
		-A INPUT -p icmp -j DROP	# drop icmp package ,then the other host can't									   # ping this host
		# some time's vim /etc/sysconfig/iptables is not used you need to 
			/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
			/sbin/iptables -I INPUT -p tcp --dport 22 -j ACCEPT
			/etc/rc.d/init.d/iptables save

	# ssh
		# 1.fix the port 22 ,let the port bigger than 10000
		# 2.deny the root to login 
		# 3.limit ip
			vim /etc/hosts/allow
				sshd:123.45.78.89	# allow only 123.45.78.89 to login 
		# 4.drop ping package
		# 5.fix the iptables ,let it allow the ssh port you set 








# black
	# port
		# nc
			yum install nc		# install nc tool
			nc localhost 21		# see what server in localhost port 21
			nc -v -w 1 localhost -z 1-100	# see service from port 1 to 100
			nc -v -w 1 192.168.228.222 -z 1-100 # see 192.168.228.222 from port 1												   # to pott 100
		# nmap
			nmap -sTU localhost	# see what port open in localhost
			nmap -sL 192.168.1-250 # search the lan ip from 1 to 250
			nmap -v -sP 192.168.1.0/24  # ping ip from 1 to 255
			namp -sT ip     # search tcp protecal (from 1 to 1000)
			namp -sU ip     # search tcp protecal (from 1 to 1000)
			namp -sS ip     # 隐蔽扫描(扫描所有tcp udp )
			namp -sO ip     # 查看主机开放哪些协议
	# password 

	# package catch 

						



# key short cut 	
	ctrl + shift + +   # let the font bigger in the terminal 
	ctrl + a		   # 
	ctrl + alt +d      # go to the destop 
	ctrl + alt +f2     # go to the terminal in one user  mode
	printscreen        # copy screen 
	alt + printscreen        # copy screen in windows
	alt + mouseleft    # drag window
	ctrl + alt +delete  # reboot
	ctrl + a           # go the the head in the terminal 
	ctrl + l		   # clear the terminal 
	ctrl + e		   # go go the end in the terminal 
	ctrl + =		   # clear current line

# use tips
	
	# rewrite root password
			# 1. when system power on ,press esc
			# 2. chose "kernel xxxxx" and then press "e" in keybord
			# 3. then you will see quiet ,and put " 1" after it ,then press enter
			# 4. press "b" button to reboot
			# 5. then input "passwd root" to reset you password
			# 6l. input "init 5 " to go back to the X window
	# full screen in terminal
		press F11 
		menu->views->showmenubar
	# install chinese language package
		
		locale -a	# show what language the system support
					# LANG=zh_CN.gb2312  means chinese
		yum groupinstall chinese-support # install chinese language support

		

# system setting
	# close selinux
		vim /etc/selinux/config # set SELINUX=enforcing to disabled

# path
	# bashrc
		/root/.bashrc
	# iptables 
		/etc/sysconfig/iptables
	# enviroment
		/etc/profile	# all profile
		~/.bash_profile # user's profile
		# tips
			# you can write the under two line to add envirement
				PATH=/usr/local/firefox:$PATH
				PATH=/usr/local/xxx/xxx:$PATH
				export PATH
				# then use 'source /etc/profile' to reload this file
			# show env
				env
				echo $PATH

	# autorun 
		/etc/rc.d/rc.local
	# selinux
		vi /etc/selinux/config
		# close selinux
			#SELINUX=enforcing #注释掉
			#SELINUXTYPE=targeted #注释掉
			SELINUX=disabled #增加
			#reboot
	# /proc  (系统的运行状态)
		cat /proc/loadavg		#  查看系统负载 (前三个数字是１,５,１５分钟内的
							　　#　的平均进程数,第四个分子是正在运行的进程,第五个
								#　是最近运行的进程id号




				








