#============================================================================
# Author :	JamesKid
# Descriptin: This is note about mysql
# History:	2014_01_06_14_52 add command and fail
#			2014_01_09_11_12 add 'databases','tables','user',control command
#			2014_03_05_15_00 add error 2002
#============================================================================
# command 
	# install 
		# install in centos
			yum -y install mysql-server
			yum -y install php-mysql
		# start stop restart 
			service mysqld start
			/etc/init.d/mysql restart
		# login 
			msyql -u username -p
		# set default charset 
			cp my-medium.cnf /etc/my.cnf
			# add the under line in the [client]
				default-character-set=utf8
			# add the unter line in the [mysqld]
				default-character-set=utf8
		# run in power on 
				vim /etc/rc.local
			# add the underline 
				/usr/share/mysql/mysql.server start

	# databases 
		# show databases
			mysql>show databases;
		# drop database
			mysql>drop databasename;
		# import database 
			mysql -u root -p databasename<importdatabase.sql;
			# or 
			mysql>use databasename;
			mysql>source importdatabasename.sql;
		# use database 
			mysql>use databasename;
		# dump databases
			mysqldump -u username -p databasename > path/filename.sql

	# tables 
		# create table
			
		# show table
			mysql>show tables;
		# describe table
			mysql>describe tablename;
		# delete 
			delete from table where name=''; 
		# insert
			mysql> insert into mysql.user(Host,User,Password) values ('localhost','zsj',password('123456'));
		# update
			update table set filed='value' where xxx;
		# alter table
			alter table 'User' add primary key('id');

	# remote
		# set remote 
			# you need to set the user's host from 'localhost' to '%' in the mysql.user table
			mysql>use mysql;
			mysql>update user set host='%' where user='username';
			mysql>flush privileges;

		# login in remote
			mysql -h ip -u username -p -P 3306
		

	# user
		# show user 
			select user,host,password from mysql.user;
		# create user 
			/usr/bin/mysqladmin -u root password '123456'
			# or
			mysql> insert into mysql.user(Host,User,Password) values ('localhost','zsj',password('123456'));
			mysql> flush privileges;
		# delete user
			drop user 'username'@'host';
			# or 
			mysql>delete from user where user="username" and host="localhost";
			msyql>flush privileges;

		# change user password
			mysql>set password for 'username'@'localhost'=password('1234');
			msyql>set passowrd for 'username'@'%'=password('1234');
			# change now user's passowrd
			mysql>set password =passowrd('1234');

		# grant 
			# grant a db to user zsj
				mysql>grant all privileges on dbname.* to zsj@localhost identified by '123456';
				mysql>flush privileges;
			# grant all db to user zsj
				mysql>grant all privileges on *.* to zsj@localhost identified by '123456';
				mysql>flush privileges;
			# grant assign authority to user zsj
				grant select,insert,update,delete,create,drop on database.table to zsj@ip identified 
				by '123456';
			# revoke grant 
				revoke privilege on databasename.tablename from 'username'@'host';
				# example
				revoke select on *.* from 'zsj'@'localhost';
			# authority
				alter			# allows use of alter table
				alter routine   # alters or drops stored routines
				create			# allows use of create table
				create routine	# creates stored routines
				create temporary table	# allows use of create temporary table
				create user		# allows use of create user,drop user,rename user,and revoke all privileges
				create view		# allows use of create view
				delete			# allow use of delete
				drop			# allow use of drop table
				execute			# allow the user to run stored routines.
				file			# allows use of select ...into outfile and load data infile
				index			# allows use of create index and drop index
				insert			# allows use of insert
				lock tables     # allows use of lock talbes on tables for which the user also has select 
								# privileges
				process			# allows use of show full processlist
				reload			# allows use of flush
				replication		# allows the user to ask where slave or master
				client			# servers are
				replication		# needed for replication slaves
				select			# allows use of select
				show databases	# allows use of show databases
				show view		# allows use of show create view
				shutdown		# allows use of mysqladmin shutdown
				super			# allows use of change master,kill,purge master logs,and set global sql 
								# statements. allows mysqladmin debug command. allows one extra connection
								# to be made if maximum connections are reached.
				update			# allows use of update
				usage			# allows connecton without any specific privileges

# path 
	# path of config
		/etc/my.cnf
			
# fail
	# fail: mysql daemon already running with the same unix socket. 
			mv /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock.bak
			iservice mysqld start
	# fail: mysql deamon failed to start
			gentenforce
			# if the resoult is 'Enforcing' means that selinux is open,you need to close it 
			setenforce 0  # (0 means open 1 means close)
# error

	# 1130 
		# error 1130 <HY000>: Host 'ip' is not allowed to connect to this MySql server
			1.see the remote option, you need to set host 'localhost' to '%' in mysql.user to the user
			2.you need to open the 3306 port
	# 2002
		# error  ERROR 2002 (HY000): Can’t connecho "ok";die; to local MySQL server through socket ‘/var/lib/mysql/mysql.sock
			1. find the mysql.sock
			2. ln the mysql.sock to /var/lib/mysql/mysql.sock like follow line
			ln -s /tmp/mysql.sock /var/lib/mysql/mysql.sock


	# 2003
		# mysql_connect(): Connection using old (pre-4.1.1) authentication protocol refused 
			1.服务器端升级启用secure_auth选项；
			2.客户端连接时off掉secure_auth，即连接时加上--secure_auth=off，
			  如：mysql -p10.51.1.11 -P3308 -uroot --secure_auth=off
			  对于方法二，使用在程序做相应mysql配置即可，以php为例，在php.ini中设置secure_auth=off
