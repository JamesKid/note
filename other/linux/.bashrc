#!/bin/bash 
# .bashrc
#===========================================================
# Description:  this is my /root/.bashrc file
# Editor:       JamesKid 
# Email:		406358964@qq.com 
# Version:      1.0 
# History:      2014-01-16 creat file by 
#				2013_12_2  1.add alias myip
#               2014-01-16_14_23 add mongodb alias
#============================================================

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# User specific aliases and functions

	alias rm='rm -i'
	alias cp='cp -i'
	alias mv='mv -i'
	alias ff='/usr/local/firefox/firefox'
	# My alias 
		# description:use 'myip' to show ip ...2013.12.2
			alias myip="ifconfig eth0 |grep inet addr| sed s/^.*inet addr://g|cut -d   -f 1"
			alias down="shutdown -h now"
		# mongodb
			alias mgstart="/usr/local/mongodb/bin/mongod --dbpath=/home/data/mongodb/ --logpath=/temp/dblog/mongodb/monod.log  --journal"
			alias mgcstart="/usr/local/mongodb/bin/mongo"
