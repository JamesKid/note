# History   2014_1_6_14_52  add command and fail
# 
# command 
	# install in centos
		yum -y install mysql-server
		yum -y install php-mysql

	# start stop restart 
		service mysqld start
		/etc/init.d/mysql restart

	# set a new user and password
		/usr/bin/mysqladmin -u root password '123456'
	# login 
		msyql -u root -p
	# distribute authority
		mysql GRANT SELECT,INSERT,UPDATE,DELETE ON *.* TO root@xxx.xxx.xxx.xx identified by '123456';
		# xx.xxx.xx.xx means your ip
	# set default charset 
		cp my-medium.cnf /etc/my.cnf
		# add the under line in the [client]
			default-character-set=utf8
		# add the unter line in the [mysqld]
			default-character-set=utf8
	# let it run in power on 
			vim /etc/rc.local
		# add the underline 
			/usr/share/mysql/mysql.server start
			
# fail
	# fail: mysql daemon already running with the same unix socket. 
			mv /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock.bak
			iservice mysqld start
	# fail: mysql deamon failed to start
			gentenforce
			# if the resoult is 'Enforcing' means that selinux is open,you need to close it 
			setenforce 0  # (0 means open 1 means close)

