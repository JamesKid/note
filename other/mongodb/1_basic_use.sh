#=================================================================
# Description:  this is the note about mongodb basic use  
# Editor:       JamesKid
# Email:		406358964@qq.com 
# Version:      1.0 
# History:      2014-01-10       add mongodb query
#				2014_01_11       add install and run chapters 
#				2014_01_11_15_46 add user collection database
#				2014_01_16_15_35 add driver install and config
#=================================================================
# path 
		/data/db/  # 默认数据路径
		27017      # 默认端口
		./mongodb --dbpath    /mongodb/  # 修改默认数据路径
		./mongodb --port 20111    # 修改默认端口
# 注意
		mongod --storageEngine=mmapv1 --dbpath [your-path]  # 3.2版本以后要这样启动,wiredtiger引擎的问题
																												# 因为Mongodb-3.2已经WiredTiger设置为了默认的存储引擎
# install   
		# method1 
				# 1.download mongodb from http://www.mongodb.org/downloads
				# 2.unzip
						tar -zxvf mongodb-xxxxxx.tgz
				# 3.mongodb no need to make and make install, just copy the package to /usr/local/mongodb
						cp mongodb-xxx /usr/local/mongodb
		# method2 (good 64位用)
				vim /etc/yum.repos.d/mongodb.repo
						[mongodb]  
						name=MongoDB Repository  
						baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/  
						gpgcheck=0  
						enabled=1  
				yum install mongodb-org   # 安装
				rpm -qa | grep mongodb    # 查看安装了哪些相关的包
				mkdir -p /data/mongodb/log
				chown -R mongod:mongod /data/mongodb
				egrep 'dbpath|logpath' /etc/mongod.conf
				oploSize = 4096  # 日志大小
				maxConns = 3280  # 并发连接数


				service mongod restart # 启动
				ls /data/mongodb/      # 查看端口是否开启
				ss -anp | grep mongod  # 查看端口是否开启
				ch]onfig mongod on     # 设置开机自动启动
		# method3  install mongodb3.2 (64位)
				wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel62-3.2.7.tgz
				cd /root/zsj/soft/mongodb
				tar zxvf xxx
				ln -s xxxxx  /usr/local/mongodb
				cp /usr/local/mongodb/bin/mongo /usr/bin/
				mongo

# driver	
		# php driver
				# download 
						https://github.com/mongodb/mongo-php-driver
				# config
						yum install php-devel
						phpize
						./configure
						make 
						make install
						# add extension=mongo.so to php.ini
						# copy /etc/php.ini to /usr/local/php/lib/
						# restart php-fpm   /usr/local/php/sbin/php-fpm	
						# restart web server
				# note 
						1.under the version 1.3.0 there is a connection problem when the connect is big
						2.you need to copy /etc/php.ini to /usr/local/php/lib/
						then the php.ini can be used 
				# test driver
			
# run 
		# run server
				/usr/local/mongodb/bin/mongod --dbpath=/home/data/mongodb/ \
				--logpath=/temp/dblog/mongodb/mongod.log \
				--journal
		# option meaning
				--bind_ip		# only the ip that can visit
				--dbpath		# path of the database , you need to mkdir the directory
				--port			# the port of the database,default value is 27107
				--logpath		# the path of log
				--logappend		# use append format to write log
				--pidfilepath	# appoint the process file,if not then don't make process file
				--journal		# use log
				--maxConns		# max connectoin value ,default value is 2000
				--fork			# let the service run in background
				--notablescan	# not able to can the table
				--syncdelay		# data write to disk's time,0 means not wating,write data directly 

				# 基本
					--quiet     # 安静输出
					--port arg     # 指定服务端口号，默认端口27017
					--bind_ip arg     # 绑定服务IP，若绑定127.0.0.1，则只能本机访问，不指定默认本地所有IP
					--logpath arg     # 指定MongoDB日志文件，注意是指定文件不是目录
					--logappend     # 使用追加的方式写日志
					--pidfilepath arg     # PID File 的完整路径，如果没有设置，则没有PID文件
					--keyFile arg     # 集群的私钥的完整路径，只对于Replica Set 架构有效
					--unixSocketPrefix arg     # UNIX域套接字替代目录,(默认为 /tmp)
					--fork     # 以守护进程的方式运行MongoDB，创建服务器进程
					--auth     # 启用验证
					--cpu     # 定期显示CPU的CPU利用率和iowait
					--dbpath arg     # 指定数据库路径
					--diaglog arg     # diaglog选项 0=off 1=W 2=R 3=both 7=W+some reads
					--directoryperdb     # 设置每个数据库将被保存在一个单独的目录
					--journal     # 启用日志选项，MongoDB的数据操作将会写入到journal文件夹的文件里
					--journalOptions arg     # 启用日志诊断选项
					--ipv6     # 启用IPv6选项
					--jsonp     # 允许JSONP形式通过HTTP访问（有安全影响）
					--maxConns arg     # 最大同时连接数 默认2000
					--noauth     # 不启用验证
					--nohttpinterface     # 关闭http接口，默认关闭27018端口访问
					--noprealloc     # 禁用数据文件预分配(往往影响性能)
					--noscripting     # 禁用脚本引擎
					--notablescan     # 不允许表扫描
					--nounixsocket     # 禁用Unix套接字监听
					--nssize arg (=16)     # 设置信数据库.ns文件大小(MB)
					--objcheck     # 在收到客户数据,检查的有效性，
					--profile arg     # 档案参数 0=off 1=slow, 2=all
					--quota     # 限制每个数据库的文件数，设置默认为8
					--quotaFiles arg     # number of files allower per db, requires --quota
					--rest     # 开启简单的rest API
					--repair     # 修复所有数据库run repair on all dbs
					--repairpath arg     # 修复库生成的文件的目录,默认为目录名称dbpath
					--slowms arg (=100)     # value of slow for profile and console log
					--smallfiles     # 使用较小的默认文件
					--syncdelay arg (=60)     # 数据写入磁盘的时间秒数(0=never,不推荐)
					--sysinfo     # 打印一些诊断系统信息
					--upgrade     # 如果需要升级数据库
				  # * Replicaton 参数
						 --fastsync     # 从一个dbpath里启用从库复制服务，该dbpath的数据库是主库的快照，可用于快速启用同步
						 --autoresync     # 如果从库与主库同步数据差得多，自动重新同步，
						 --oplogSize arg     # 设置oplog的大小(MB)

				  # * 主/从参数
							--master     # 主库模式
							--slave     # 从库模式
							--source arg     # 从库 端口号
							--only arg     # 指定单一的数据库复制
							--slavedelay arg     # 设置从库同步主库的延迟时间
					 # * Replica set(副本集)选项：
							 --replSet arg     # 设置副本集名称 
					 # * Sharding(分片)选项
								--configsvr     # 声明这是一个集群的config服务,默认端口27019，默认目录/data/configdb
								--shardsvr     # 声明这是一个集群的分片,默认端口27018
								--noMoveParanoia     # 关闭偏执为moveChunk数据保存 

		# run client
				/usr/local/mongdb/bin/mongo
				# or cd to /usr/local/mongodb/bin
				./mongo
		# autorun 
				vim /etc/rc.local
				/usr/local/mongodb/bin/mongod --dbpath=/home/data/mongodb/ \
				--logpath=/temp/dblog/mongodb/mongod.log \
				--journal

# user	
		# add 
				db.addUser('name','pwd')	# add or fix user,and user's password
		# delete
				db.removeUser('name')
		# find
				db.system.user.find()		# find user's list
				show users
		# authentification
				db.auth('name','pwd')		# user's authentification

# collection
		# show
				show collections	# show all the collections
				db.printColloectionStats()	# show the stats of the collection
				db.deliver_status.stats()
		# size
				db.deliver_status.dataSize()
# profile
		# set record profiling, 0=ff 1=slow 2=all
				db.setProfilingLevel(1)
		# show 
				show profile


# database	
		# use 
				use admin	# use admin database
		# show 
				show dbs	# show all the database
				db			# show current db 
		# repair
				db.repairDatabase() # repaire database
		# copy 
				db.copyDatabase('mail_ddr','mail_addr_tmp')
		# drop 
				db.dropDatabase()	# drop recent database
# index
		# add	
				1(ascending),-1(descending)
		# index son object
				db.user_addr.ensureIndex({'AI.Em':1})
		# show 
				db.foo.getIndexes()
				db.foo.getIndexKeys()
				db.deliver_status.totalIndexSize() # show all the index size
		# delete
				db.user_addr.dropIndex('AI.Em_1')

# query	
		# select
				# mongodb									# mysql
				db.test.find({'name':'foobar'})           <==> select * from test where name='foobar'
				db.test.find()                            <==> select *from test
				db.test.find({'ID':10}).count()           <==> select count(*) from test where ID=10
				db.test.find().skip(10).limit(20)         <==> select * from test limit 10,20
				db.test.find({'ID':{$in:[25,35,45]}})     <==> select * from test where ID in (25,35,45)
				db.test.find().sort({'ID':-1})            <==> select * from test order by IDdesc
				db.test.distinct('name',{'ID':{$lt:20}})  <==> select distinct(name) from testwhere ID<20
				db.test.group({key:{'name':true},
				cond:{'name':'foo'},reduce:function(obj,prev)
				{prev.msum+=obj.marks;},initial:{msum:0}})  <==> select name,sum(marks) from testgroup by name
				db.test.find('this.ID<20',{name:1})  <==> select name from test whereID<20
				db.test.findOne()	# find one record
				db.test.find({'msg':'Hello 1'}).limit(10) # find record limit 10 one 
				db.user.find({},{age:0,address:false})	# 0 is false ,!0 is true
				db.users.find({name: "bruce"},{age:0,address:false})


	# insert
		db.test.insert({'name':'foobar','age':25}) <==>insertinto test ('name','age') values('foobar',25)
	# delete
		db.test.remove({})                 <==> delete * from test
		db.test.remove({'age':20})         <==> delete test where age=20
		db.test.remove({'age':{$lt:20}})   <==> elete test where age<20
		db.test.remove({'age':{$lte:20}})  <==> delete test where age<=20
		db.test.remove({'age':{$gt:20}})   <==> delete test where age>20
		db.test.remove({'age':{$gte:20}})  <==> delete test where age>=20
		db.test.remove({'age':{$ne:20}})   <==> delete test where age!=20
	# update
		db.test.update({'name':'foobar'},{$set:{'age':36}})  <==> update test set age=36 where name='foobar'
		db.test.update({'name':'foobar'},{$inc:{'age':3}})   <==> update test set age=age+3 where name='foobar'
	# function
		# sort
			db.deliver_status.find({'From':'ixigua@sina.com'}).sort({'Dt',-});
			db.deliver_status.find().sort({'Ct':-1}).limit(1);
			db.user.find().sort({age:1});
			db.user.find().sort({age:-1});
		# count
			db.user_addr.count()
			db.users.find({age:18}).count();
		# distinct 
			db.foo.distinct('msg');	# distinct msg
		# limit
			db.users.find().limit(5);
		# skip 
			db.users.find().skip(3).limit(5);	# begin from 3 ,list fine record

		
	# find son
		db.foo.din({'address.city':'beijing'});
	# mod
		db.users.find('this.age %10 == 0');
		db.users.find({age:{$mod:[10,0]}});
		db.user.find({age:{$not:{$mod:[10,0]}}});
	# regular expression
		db.users.find({name:{$not:/^B.*/}});
	# $exists
		db.users.find({name:{$exists:true}});	# find all have name's record
		db.users.find({phone:{$exists:false}});
	# $type
		db.users.find({name:{$type:2}});
		db.users.find({age:{$type:16}});

	# sign
		# exp:	
			db.foo.find({"timestamp":{"$gte";2}})	
			db.users.find({name:{$ne:"bruce"},age:{$gte:18}})
			# find creation_date > '2010-01-01' and creation_date <= '2010-12-31'
			db.users.find({creation_date:{$gt:new Date(2010,0,1),$lte:new Date(2010,11,fff31)})
			db.user.find({age:{$in:[20,22,24,26]}})
			db.users.find({favorite_number:{$all:[6,8]}})
		# sign list
			$gt		# >
			$lt		# <
			$gte	# >=
			$lte	# <=
			$ne		# !=  <>
			$in		# in
			$nin	# not in
			$all	# all
			$not	# !
		# other exp
			db.users.find({age:{$gt:18}});
			db.users.find({$where:"this.age > 18 "});
			db.users.find("this.age > 18 ");
			f = function() {return this.age > 18} db.users.find(f);

# soft	
	# gui mongodb soft
		rockmongo	# this soft a little like phpmyadmin

# other
	db.printcollectionStats()	#查看主从复制状态 

# fail

# config

# error

# problem 
	# 1 . can't find mongodb in phpinfo()
		you need to copy /etc/php.ini to /usr/local/php/lib/
