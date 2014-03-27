#================================================================
# Description:  This is note about freebsd
# Editor:       JamesKid
# Email:        406358964@qq.com 
# Version:      1.0 
# History:      2014_1_27_17_12 add install vim
#               2014_1_27_17_12 add net setting
#================================================================
# install 
	# get 
		# get it from web 
	# network setting
		# path 
			
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
# path 
	/etc/rc.conf		# set ip and route and host name
	/etc/resolve.conf	# dns 
# soft
	
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
			# method3
				ftp ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2	# logs as anonymous
				tar xvfz vim-7.4.tar.bz2		# unzip the file
				cd /vim74
				./configure
				make
				makeinstall
				# tips
					# the path of vim74 is /usr/local/share/vim when installed
				
