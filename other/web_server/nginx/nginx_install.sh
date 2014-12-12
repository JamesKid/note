#  install
	# method 1
		in baidu cloud
	# method 2 
		# web 
			http://www.jb51.net/article/23782.htm
		# 一键安装包
			wget http://catlnmp.googlecode.com/files/lnmp1.1.zip 
			unzip lnmp1.1.zip	
				# yum install unzip 
			cd lnmp 
			chmod +x install.sh apc.sh eaccelerator.sh 
			./install.sh 
			# mysql username root password root

			# path 
				/usr/local/mysql
				/usr/local/php
				/usr/local/nginx
				/home/www

			# vsftpd
				yum -y install vsftpd 
				/etc/init.d/vsftpd start
				conkconfig --level 345 vsftpd on
				
