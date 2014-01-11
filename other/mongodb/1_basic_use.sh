#=================================================================
# Description:  this is the note about mongodb basic use  
# Editor:        JamesKid
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2014-01-10       add mongodb query
#				2014_01_11       add install and run chapters 
#				2014_01_11_15_46 add user collection database
#=================================================================
# install   
	# 1.download mongodb from http://www.mongodb.org/downloads
	# 2.unzip
		tar -zxvf mongodb-xxxxxx.tgz
	# 3.mongodb no need to make and make install, just copy the package to /usr/local/mongodb
		cp mongodb-xxx /usr/local/mongodb
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

# other
	db.printcollectionStats()	#查看主从复制状态 
# fail

# config

# error
