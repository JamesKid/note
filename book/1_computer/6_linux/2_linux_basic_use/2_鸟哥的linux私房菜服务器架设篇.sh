#===================JamesKid===================================
# Description:  this note is about 鸟哥的linux私房菜服务器架设篇
# Editor:       JamesKid 
# Email:		 406358964@qq.com 
# Version:      1.0 
# BookStar:		* * * * * * 	
# History:      2014-03-20 creat JamesKid
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
