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
		echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
			# 仅有ping broadcast 地址时才取消ping 的回应
		echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
			# 全部的ping 都不回应
		# NAT服务器会修改IP表头数据
	# path 
		# ignore ping
			/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts # ping broadcast地址
			/proc/sys/net/ipv4/icmp_echo_ignore_all		   # ping 全部
			/proc/sys/net/ipv4/conf/网络接口			   # 每个接品独立的ping 
														   # 设定
			/etc/sysctl.conf					# 防火墙规则设定
	# shortcut
		NAT:	Network Address Translation
# 第十章 申请合法的主机名
	# web 
		www.no-ip.com	# 国外免费dns 网站 
# 第十一章 远程联机服务器 SSH / XDMCP /VNC /RDP
	# command
		# ssh
			/etc/init.d/sshd restart	# 重启sshd
		# sftp
			sftp student@localhost		# 登入sftp
			sftp>lls /etc/hosts			# 查看本机有没有/etc/hosts
			sftp>lcd /root				# 切换到本地/root
			sftp>ls						# 显示远程目录
			sftp>ls -a					# 显示隐藏文件 
		# scp 
			scp -l 800 /root/jk.txt root@192.xx.xx.xx:/tmp # 限制上传速度为100k
	# path 
		/etc/ssh/ssh_host*		# ssh 公匙私匙位置
# 第十二章 网络参数控管者:DHCP服务器
	# command
		rpm -ql dhcp	# check if dhcp is install
		/etc/init.d/dhcpd start	# start dhcp server
		vim /etc/sysconfig/network-scripts/ifcfg-eth0
			BOOTPROTO=dhcp		# let the netcard support dhcp 
		ether-wake -i ech1 11:22:33:44:55:66	# remote wake up
	# path 
		/etc/dhcp/dhcpd.conf	# dhcp 配置文件位置
	
	# port
		dhcp	67
# 第十三章 文件服务器之一:NFS服务器
# 第十四章 账号控管 NIS 服务器
# 第十五章 时间服务器:NTP服务器
# 第十六章 文件服务器之二 SAMBA服务器
	# path 
		/etc/samba/smb.conf		# smb server config file
# 第十七章  区网控制者 Proxy 服务器
# 第十八章 网络驱动器装置 iscsi服务器
# 第十九章 主机名控制者:DNS服务器
# 第二十章 www服务器
	# path
		# apache
			/etc/httpd/conf/httpd.conf	# main config file
			/etc/httpd/conf.d/*.conf	# other config file
			/usr/lib64/httpd/modules/   # other modules
			/etc/httpd/modules/			# other modules
			/var/www/error/				# error path
			/var/www/icons/				# path of icon 
			/var/www/cgi-bin			# cgi
			/var/logs/httpd				# logs of httpd
			/usr/sbin/apachectl			# apache shell script
			/usr/sbin/httpd				# apache binary system execte file
			/usr/bin/htpasswd			# apache password protect
		# mysql
			/etc/my.cnf					# mysql config file
			/etc/lib/mysql				# mysql data file
		# php 
			/etc/httpd/conf.d/php.conf	# 
			/etc/php.ini
			/usr/lit64/httpd/modules/libphp5.so
			/etc/php.d/mysql.ini
			/usr/lib64/php/modules/mysql.so	
			/usr/bin/phpize				# php加速器
			/usr/inclue/php


					





