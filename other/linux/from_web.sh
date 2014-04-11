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

# server build
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
	# samba
	# ssh
	# vpn 
	# vps

# user control
	# show 
		w	# show what user now do and how much cpu they use 
		who # show what user here
	# kick user
		pkill -KILL -t pts/0	# kick the user in pts/0 


# save 
	# iptables
		/etc/init.d/iptables status	# show the iptables status
		/etc/init.d/iptables stop	# stop iptables
		chkconfig --level 35 iptables off # close iptables forever
		-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT  # accept the ftp port 21
		-A INPUT -p icmp -j DROP	# drop icmp package ,then the other host can't									   # ping this host

# black
	# port
		# nc
			yum install nc		# install nc tool
			nc localhost 21		# see what server in localhost port 21
			nc -v -w 1 localhost -z 1-100	# see service from port 1 to 100
			nc -v -w 1 192.168.228.222 -z 1-100 # see 192.168.228.222 from port 1												   # to pott 100
		# nmap
			nmap -sTU localhost	# see what port open in localhost
	# password 

	# package catch 

						



		

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




				








