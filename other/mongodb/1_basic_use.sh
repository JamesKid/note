#=======================================================
# Description:  this is the note about mongodb basic use  
# Editor:        JamesKid
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2014-01-10 add mongodb query
#=======================================================
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

# fail

# config

# error
