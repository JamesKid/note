#===================JamesKid===================================
# Description:  this note is about 鸟哥的linux私房菜服务器架设篇
# Editor:       JamesKid 
# Email:		 406358964@qq.com 
# Version:      1.0 
# BookStar:		* * * * * * 	
# History:      2014-03-20 creat JamesKid
#				read to page 313
#==============================================================
# 第一章 架设服务器前的准备工作 (p6)
	# command	
		netstat -tulnp	# check the port
		yum -y update		# update all the system 
		# let the up date in every day 2:15 to update
			vim /etc/crontab
			15 2 * * * root /usr/bin/yum -y update
		rpm -qa | grep -i samba		# check the version of samba
		rpm -qc samba samba-common  # check the samba config file
		# arp 
			arp -n	# show all the arp address in table
			arp -s 192.168.1.200 01:00:2D:23:A1:0E	# add an static arp address 
	
	# path 
		/etc/login.defs		# define the user's max password use 
		/etc/security/limits.conf	# config the user's use auth
		/etc/resolv.conf	# DNS 



	# tips 
		# you can check the samba problem in /var/log/samba

		# backup the important file in contab
			mkdir /root/bin; vim /root/bin/backup.sh
			#!/bin/bash
			backdir="/etc /home /root /var/spool/mail" 
			basedir=/backup
			[ ! -d "$basedir" ] && mkdir $basedir
			backfile=$basedir/backup.tar.gz
			tar -zcvf $backfile $backdir 
			# vim /etc/crontab
			45 2 * * * root sh /root/bin/backup.sh
# 第三章 局域网络架构简介 (p94)
# 第四章 连上internet (p110) 
	# command
		/etc/init.d/network restart		# restart the network
		# wireless
			iwconfig		# config wireless network
			iwlist			# show all the wireless connect
			iwlistscan		# scan the wireless network 
	# path 
		/etc/services		# all the services port ,include http,ftp,ssh...
		/etc/sysconfig/network-scripts/ifcfg-eth0	# ip netmask,dhcp, gateway 
		/etc/sysconfig/network	#主机名
		/etc/protocols			# show protocols 

# 第五章 linux 常用网络指令 
	# command
		# ip
			ifup		# up the ethernet 
			ifdown		# down the ethernet
			ifconfig eth0 up # up the eth0 
			ip link show	# show all the ip link information
			ip -s link show eth0 # show eth0 information
			ip link set eth0 up  # let the eth0 up 
			ip link set eth0 mtu 1000  # let the eth0 mtu to 1000
			ip address show		# show ip address
			ip route add 192.168.10.0/24 via 192.168.5.100 dev eth0
			# fix the networkcard name and mac
				ip link set eth0 name vbird # 因为该装置是启动的,改不了,要这样做
				ip link set eth0 down 
				ip link set eth0 name vbird 
				ip link show
		# dhcp 
			dhclient eth0	# use dhcp get ip 
		# ping 
			ping -c 3 168.92.1.1	# ping this ip three times
		# traceroute 
			traceroute -n www.baidu.com
		# host 
			host www.baidu.com # check the ip of baidu
		# nslookup 
			nslookup www.google.com		# look all the google's ip 


		# route
			route del -net 169.254.0.0 netmask 255.255.0.0 dev eth0 # del route
			route add -net 192.168.100.0 netmask 255.255.255.0 dev eth0 #add route
			route add default gw 192.168.1.250 # add default gateway
		# ftp
			yum install ftp		# install ftp
			ftp ftp.ksu.edu.kw	# go to the ftp.ksu.edu.kw
			Name(ftp.ksu.edu.tw:root): anonymous # 匿名登录
			ftp> help			# find help
			ftp> dir			# open the directory
			ftp> cd /pub		# open the /pub directory
			ftp> get filename	# get fileaname file
			ftp> mget filename* # get multy filename match * 
			ftp> put filename	# pug the file to the ftp pservevr
			ftp> delete file	# delete file
			ftp> mkdir dir		# make a direcory as dir
			ftp> lcd /home		# switch to the home direcory 
			ftp> passive		# close passive mode
			ftp> binary			# set the data transmit mode as binary mode
			ftp> bye			# exit
			# use ftp in different port
				ftp hostname 318
		# lftp
			yum install lftp
			lftp ftp.ksu.edu.tw
			# 定时获得ftp服务器上的文件 
				mkdir lftp
				cd lftp
				vim lftp.ksu.sh
					open ftp.ksu.edu.tw
					cd /pub/CentOS/
					mget -c -d RPM-GPG*
					bye
				lftp -f lftp.ksu.sh
				ls
				vim lftp.ksu.sh
					lftp -c "open ftp.ksu.edu.tw
						cd /pub/CentOS/ 
						mget -c -d RPM-GPG*
						bye"
				sh lftp.ksu.sh
				# let the file run in cron
		# links		(文字接品网页浏览) 速度相对比较快,但会有中文乱码
			yum install links
			links http://www.kernel.org
		# w3m		(文字接口网页浏览) 速度相对比较慢,中文不乱码
			yum install w3m
			w3m www.baidu.com
		# tcpdump
			tcpdump -i eth0 -nn			# -nn means get  ip and port
			tcpdump -i eth0 -nn port 21	# get port 21 package data
			tcpdump -i lo -nn -X 'port 21 ' # get local ftp package in hexadecimal
			tcpdump -i eth1 -nn -X 'port 21' # get the eth1 ftp package data
			tcpdump -i eth1 -nn -X 'port 21' -w /tmp/tcp.txt # put the result 
												# to /tmp/tcp.txt
		# nc
			yum install nc		# install nc tool
			nc localhost 21		# see what server in localhost port 21
			nc -v -w 1 localhost -z 1-100	# see service from port 1 to 100
			nc -v -w 1 192.168.228.222 -z 1-100 # see 192.168.228.222 from port 1												   # to pott 100
	# path
		/etc/wgetrc		# path of wget configfile

# 第六章 linux 网络侦错
# 第七章 网络安全与主机基本防护:限制端口口,网络升级与selinux  (p207)
	# path
		/etc/yum.conf	# path of yum config file
# 第八章 路由观念与路由器设定
	# path
		/etc/sysconfig/network-scripts/route-eth0	# path of route

# 第九章 防火墙与NAT服务器 
	# command
		uname -r	# show the linux core version
	# tips
		# TCP wrappers 透过/etc/host.allow ,/etc/hosts.deny起作用


					


		









