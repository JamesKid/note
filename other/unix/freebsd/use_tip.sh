#================================================================
# Description:  This is note about freebsd
# Editor:       JamesKid
# Email:        406358964@qq.com 
# Version:      1.0 
# History:      2014_1_27_17_12 add install vim
#               2014_1_27_17_12 add net setting
#               2014_1_27_17_12 add ssh setting
#================================================================
# install 
	# get 
		# get it from web 
	# network setting
		# path 
			
# command
	# mount
		mount_cd9660 /dev/cd0 /mnt	# mount the CD/DVD to /mnt

# systm setting 
	# user
		# add 
			useradd
		# del 
			rmuser+username


	# net
		# command 
			netstat -r    # show the route table
			sh /etc/rc	  # restart thte network
			/etc/netstart # restart thte network
		# /etc/rc.conf
			# ifconfig_em0="DHCP"
			# ifconfig_em0="inet 192.168.72.130 netmask 255.255.255.0"
			# defaultroute="192.168.72.255"
			# route add default 192.168.72.2
	# chinese language support
		locale		# show the support of language
		# use putty
			open putty --> window --> Translation --> Character set --> utf-8
		
	# let the 'll' show color file
		vim /etc/profile
			alias ll='ls-lG'
	# screen
		# support 
			cd /sys/i386/conf
			cp GENERIC graph
			vim graph
				# add this two line
					options VESA			# let the core support VESA
					options SC_PIXEL_MODE	# let the control support graph
			config graph
			cd ../compile/graph
			make cleandepend
			make depend
			make
			make install
			reboot
		# control 
			vidcontrol -i mode|grep G	# check the mode list
			vidcontrol mode_279			# use the mode 279
			# autorun when power on 
				vim /etc/rc.conf
					# add this line
					allscreens_flags="MODE_279"





# path 
	/etc/rc.conf		# set ip and route and host name
	/etc/resolve.conf	# dns 
# soft
	# wget
		/usr/ports/ftp/wget make install	# !!this will use a long long time ...
		/usr/ports/ftp/wget-devel

	# ssh 
		vim /etc/inetd.conf		# fix the ssh configfile 
			# comment  the # before 'ssh'
		vim /etc/rc.conf
			sshd_enable="yes"
		/etc/rc.d/sshd restart	# restart the ssh server
		netstat -an				# check if the ssh port 22 is open 
		vim /etc/ssh/sshd_config
			PermitRootLogin yes	        # let root can login 
			PermitEmptyPasswords no     # password can't be empty 
			PasswordAuthenticaton yes	# 设置是否使用口令验证
		/etc/rc.d/sshd restart	# restart the ssh server

	# vmtools
		# install perl and compat6x
			cd /usr/ports/misc/compat6x
			make install
			cd /usr/ports/lang/perl5.8
			make install
		# install vmtool
			mount_cd9660 /dev/cd0 /mnt
			cp /mnt/vmware-freebsd-tools.tar.gz /tmp	# copy the vmtools file
			tar zxpf /tmp/vmware-freebsd-tools.tar.gz   # unzip it 
			cd /tmp/vmware-tools-distrib		        # go to the directory 
			./vmware-install.pl			                # install it 
		# config vmtool
			vim /usr/local/etc/rc.d/vmware-tools.sh
				# fix the after line's 'yes' to 'xyes'
					VMHGFS_CONFED  
					VMMEMCTL_CONFED
					VMXNET_CONFED
					VMBLOCK_CONFED
			rm /etc/wmare-tools/not_configured	# let the config file can be use 
			/usr/local/etc/rc.d/vmware-tools.sh restart # restart the vmtools
	
	# vim
		# install
			# method1
				pkg_add -r vim
			# method2
				cd /usr/ports/editors/vim
				make install clean
				# wait it download
				cp /usr/local/share/vim/vim73/vimrc_example.vim ~/.vimrc
				# comment the last two line in .vimrc
				vi .cshrc
					alias vi vim
					setenv EDITOR vim
				reboot
			# method3 (good)
				ftp ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2	# logs as anonymous
				tar xvfz vim-7.4.tar.bz2		# unzip the file
				cd /vim74
				./configure
				make
				makeinstall
				# tips
					# the path of vim74 is /usr/local/share/vim when installed
				
#  error 
	# ntpd_initres[978]: host name not found 1.freebsd.poll.ntp.org 错误
		# web 
			http://xu20cn.blog.51cto.com/274020/69689
		# fix 
			# 服务器端配置
				1:置/etc/ntp.conf文件内容为：
					server 127.127.1.0 minpoll 4
					fudge 127.127.1.0 stratum 1
					restrict 127.0.0.1
					restrict 192.168.0.0 mask 255.255.255.0 nomodify notrap
					driftfile /var/lib/ntp/drift

				2: /etc/ntp/ntpservers应置空
				3: /etc/ntp/step-tickers应配置为 127.127.1.0 
				上诉修改完成后，以root用户身份重启ntpd服务:service ntpd restart即可
			# 客户端配置：
				1:置/etc/ntp.conf文件内容为：
					server 192.168.0.1
					fudge 127.127.1.0 stratum 2
					restrict 127.0.0.1
					driftfile /var/lib/ntp/drift
					restrict 192.168.0.1 mask 255.255.255.255
					2. /etc/ntp/ntpservers 文件内容置空
					3. /etc/ntp/step-tickers文件内容置为时钟服务器IP地址 192.168.0.1
					上诉修改完成后，以root用户身份重启ntpd服务:service ntpd restart即可
			# 用户可用以下两个常用命令查看ntpd服务状态：
				1 ntpq -p
				2 ntpstat


