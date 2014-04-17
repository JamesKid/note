#======================================================
#!/bin/bash 
# Description:  this program is note about yii
# Editor:       zhangshijie 
# Email:        406358964@qq.com 
# Version:      1.0 
#======================================================
# install 
	# download 
		download it 
	# check 
		http://yii/requirements/index.php
# create project
		cd framework
		yiic webapp ..\testdrive
		# tips 
			# if you are in the linux, you need to chmod the authority to the 
			# 'yiic.php' file


# tips 
	# use memcache
		# main.php
			'components' => array(
				'memcache' => array(
					'class' => 'system.caching.CMemCache',
					'useMemcached' => true,
					'servers' => array(
									array('host' => '127.0.0.1',
										  'port' => 11211,
										  'weight' => 100,
									),
								 ),
					'keyPrefix' => '',
					'hashKey' => false,
					'serializer' => false
				),
			),
		# use memcache
			# test.php
				$key = 'people'; 
				$value = json_encode(array('name'=>'ball', 'age'=>'male')); 
				$expire = 10; 
				yii::app()->cache->set($key, $value, $expire); 
				Yii::app()->cache->get($key); 
				Yii::app()->cache->delete($key);

	# find the all yii file
		you can see the 'yiilite.php' to check the yii framework 
	# open log in web site
		add the below to the main.phpfiles 'components' array
			'log'=>array(
				'class'=>'CLogRouter',
				'routes'=>'array(
					array(
						'class'=>'CFileLogRoute',
						'levels'=>'error,warning',
					),
					array(
						'class'=>'CWebLogRoute',
					),
				),
			),


# problem
	# windows
		1.	can't find php.exe in wamp
			slove1:
				右击我的电脑-->属性-->高级-->环境变量-->系统变量 设置为
				"D:\wamp\bin\php\php5.2.5;D:\wamp\www\yii\framework"
				（具体看自己的环境配置情况）
				注：添加环境变量后，关闭cmd重新打开！
			slove2:
				yii/framework/yiic.bat,
				修改if "%PHP_COMMAND%" == "" set PHP_COMMAND=php.exe
				为 if "%PHP_COMMAND%" == "" set PHP_COMMAND=D:\wamp\php\php.exe
				（后面php.exe的路径根据自己的安装环境而定）在cmd.exe窗口中执行
				创建一个网站(yiicms)
				yiic webapp d:/wamp/www/yiicms 
				创建一个模块(admin)
				yiic shell d:\wamp\www\yiicms\index.php
				>> module admin
				>> exit 
				退出shell
	# linux
		1.	date(): It is not safe to rely on the system's timezone settings. You are *required* to use the date.timez
			slove:
				vim /etc/php.ini   # let the date.timezone ="Asia/Shangehai"


		
	
