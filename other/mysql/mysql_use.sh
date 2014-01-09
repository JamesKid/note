# Author :	JamesKid
# History:	2014_01_06_14_52 add command and fail
#			2014_01_09_11_12 add 'databases','tables','user',control command
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
			mysqldump -u username -p databasename > path

	# tables 
		# show table
			mysql>show tables;
		# describe table
			mysql>describe tablename;
	# remote
		# login in remote
			mysql -h ip -u username -p -P 3306
		

	# user
		# show user 
			select user,host,password from mysql.user;
		# create user 
			/usr/bin/mysqladmin -u root password '123456'
			mysql> insert into mysql.user(Host,User,Password) values ('localhost','zsj',password('123456'));
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
			
# fail
	# fail: mysql daemon already running with the same unix socket. 
			mv /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock.bak
			iservice mysqld start
	# fail: mysql deamon failed to start
			gentenforce
			# if the resoult is 'Enforcing' means that selinux is open,you need to close it 
			setenforce 0  # (0 means open 1 means close)

