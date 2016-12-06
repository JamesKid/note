#======================================================
#!/bin/bash 
# Description:  this program is note about php
# Editor:       zhangshijie 
# Email:        406358964@qq.com 
# Version:      1.0 
#======================================================
# 
# 框架开发，设计心得
		# 常量，非保密性文字内容,静态变化很小的内容做成分类配置文件,可减轻数据库负载

# tips 
		# tips web 
				http://www.laruence.com/2015/12/04/3086.html
		# 查看cli的插件(cli跟phpinfo()不同
				php -m
		# 查看cli php.ini位置
				php --ini 
				php --ini | grep Configuration # 将php.ini拷贝一份到出现的目录就可以在cli使用加载的模块了
		# 使用新的编译器
				推荐gcc4.8以上,4.8 以上才会开启Global Register for opline and execute_data支持,这个会带来5%左右的性能提升

# php7 
		# install php7
				# web (详细教程,与性能对比)
						http://blog.csdn.net/21aspnet/article/details/47708763	
				# get file and tar 
						wget  http://php.net/get/php-7.0.2.tar.gz/from/a/mirror
						tar zxvf mirror 
				# 安装依赖
						 yum -y install libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel MySQL pcre-devel
						 yum -y install curl-devel
			  # install(安装) (配置到php7目录下,兼容之前版本)
					 ./configure --prefix=/usr/local/php7 \
					 --with-curl \
					 --with-freetype-dir \
					 --with-gd \
					 --with-gettext \
					 --with-iconv-dir \
					 --with-kerberos \
					 --with-libdir=lib64 \
					 --with-libxml-dir \
					 --with-mysqli \
					 --with-openssl \
					 --with-pcre-regex \
					 --with-pdo-mysql \
					 --with-pdo-sqlite \
					 --with-pear \
					 --with-png-dir \
					 --with-xmlrpc \
					 --with-xsl \
					 --with-zlib \
					 --enable-fpm \
					 --enable-bcmath \
					 --enable-libxml \
					 --enable-inline-optimization \
					 --enable-gd-native-ttf \
					 --enable-mbregex \
					 --enable-mbstring \
					 --enable-opcache \
					 --enable-pcntl \
					 --enable-shmop \
					 --enable-soap \
					 --enable-sockets \
					 --enable-sysvsem \
					 --enable-xml \
					 --enable-zip

					  make && make install
				# 拷贝配置文件
					  cp php.ini-development /usr/local/php/lib/php.ini
					  cp /usr/local/php7/etc/php-fpm.conf.default /usr/local/php7/etc/php-fpm.conf
					  cp /usr/local/php7/etc/php-fpm.d/www.conf.default /usr/local/php7/etc/php-fpm.d/www.conf
					  cp -R ./sapi/fpm/php-fpm /etc/init.d/php-fpm

				# 查看php.ini是否正确加载 用phpinfo()
						Configuration File (php.ini) Path  /usr/local/php7/lib/  
						Loaded Configuration File /usr/local/php7/lib/php.ini  # 如果值为NULL 表示未正确加载,参考php-fpm启动
					
				# 切换和启动
						/usr/local/php/sbin/php-fpm stop  # 停止php5fpm
						/usr/local/php7/sbin/php-fpm -y /usr/local/php7/etc/php-fpm.conf -c /usr/local/php7/lib/php.ini   
																							# 启动php7并加载配置
						cp /usr/bin/php /usr/bin/php_old  # 将命令行旧有php更换
						cp /usr/local/php7/bin/php /usr/bin/php  # 将php7命令放入环境
						cp /usr/local/php7/bin/php /usr/local/bin/php  # 将php7命令放入环境
						ps -auwxx | grep php-fpm   # 查找php7 php-fpm 
						kill pid                   # 关闭php7 php-fpm 
						/usr/local/php/sbin/php-fpm -y /usr/local/php7/etc/php-fpm.conf -c /usr/local/php7/lib/php.ini  
																		   # 重新加载php.ini
				# error 
						# make: *** [ext/fileinfo/libmagic/apprentice.lo] Error 1 
								由于内存小于1G所致
								在./configure 加上　--disable-fileinfo 即可
								然后
								make clean 
								make && makeinstall
						# make: *** [sapi/cli/php] Error 1 
								make ZEND_EXTRA_LIBS='-liconv'
								ln -s /usr/local/lib/libiconv.so.2 /usr/lib64/
				# 安装插件
						# 注意
								# cli下的插件安装和php-fpm不一样
										php -i | grep php.ini  # 查找cli php.ini所在地方,如何没有该文件，将文件加入路径
								# cli下安装插件
										cd /root/soft/php5.6/ext/curl # 进入源码包curl扩展目录 
										/usr/local/php7/bin/phpize    # phpize配置
										./configure --with-php-config=/usr/local/php7/bin/php-config
										make && make install 
										vim php.ini			# 编辑查到的php.ini文件
												extension_dir='生成的目录';
												extensions=curl.so;
						# xhprof (性能检测工具)


						#  opcache
								#开启opcache(可提升性能)
								vim php.ini
									zend_extension=opcache.so
									opcache.enable=1
									opcache.enable_cli=1
								
						# 扩展安装后所在目录
								/usr/local/php7/lib/php/extensions/no-debug-non-zts-xxxxx
						# pdo
								# 安装
										cd /root/zsj/soft/php/php-7.0.5/ # 进入源码包
										cd ext/pdo_mysql    # 进入源泉码包
										/usr/local/php7/bin/phpize
										./configure --with-php-config=/usr/local/php7/bin/php-config #--with-pdo-mysql=/usr/bin/mysql
										make && make install 
										# (不出错就会显示Installing shared extensions: /usr/local/php5/lib/php/extensions/no-debug-non-zts-20041030/) 

								# 配置
								vim /usr/local/php7/lib/php.ini  # 配置sock,
										pdo_mysql.default_socket=/var/lib/mysql/mysql.sock  # 值为/etc/my.cnf定义的sock值
								# use 
										http://php.net/manual/en/book.pdo.php
								# mysql 移植到pdo 参考网页
										http://php.net/manual/en/function.mysql-data-seek.php
						# swoole
								# download
										https://github.com/swoole/swoole-src/releases # 各种版本地址
										wget https://github.com/swoole/swoole-src/archive/swoole-1.8.4-stable.tar.gz 
								# install 
										tar zxvf swoole-1.8.4-stable
										cd swoole-src-swoole-1.8.4-stable
										/usr/local/php7/bin/phpize
										./configure --with-php-config=/usr/local/php7/bin/php-config
										vim /usr/local/php7/lib/php.ini
												extension_dir=/usr/local/php7/lib/php/extensions/no-debug-non-zts-20151012/
												extension=swoole.so	
								# check 
										phpinfo(),check swoole

										
		# 性能对比(php5,php7性能对比)
				vim /tmp/test.php
						<?php  
						$a = array();  
						for($i=0;$i<1000000;$i++){  
							$a[$i] = $i;  
						}  

						foreach($a as $i){  
							array_key_exists($i, $a);  
						}  
						?>  
				time /usr/bin/php_5.3.3 /tmp/test.php
				time /usr/bin/php_7.0.5 /tmp/test.php

		# use 

		# different(变更)
				# support
						1. 支持常量数组
						2. 支持匿名类
				# no more suppor
						1. 不再支持mysql,请使用pdo或mysqli链接
						2. 不再支持静态调用非静态方法,非静态类,非静态变量
						3. 不再支持的扩展ereg, mssql ,mysql ,sybase_ct
						4. 方法名不能和类名相同
						5. 移除的sapi
								aolserver
								apache
								apache_hooks
								apache2filter
								caudium
								continuity
								isapi
								milter
								nsapi
								phttpd
								pi3web
								roxen
								thttpd
								tux
								webjames


				
# useful frame (有用的框架)
		# db(数据库相关)
				# php-cp 
						# basic
								php-cp  # php 数据库链接池,支持负载均衡
						# web 
								https://github.com/swoole/php-cp
								http://blog.sina.com.cn/s/blog_9eaa0f400102v9fd.html
								http://www.open-open.com/lib/view/open1421983578500.html
		# php框架相关
				# Swoole: PHP的异步、并行、分布式扩展
						# install
						# web 
								https://github.com/swoole/swoole-src
						# use

				

# function 
		# debug
				debug_zval_dump($param); # 显示变量调用次数
				debug_backtrace();   # 回溯查看调用的方法
				get_defined_vars();  # 返回一个多维数组，里面包含了所有定义过的变量
				get_browser();       # 返回浏览器兼容信息
				memory_get_usage();  # 获取内存使用
				memory_get_peak_usage(); # 获取内存使用峰值
				getrusage();         # 获取cpu使用情况
		# nl2br 
			# description :将\n 的换行转成<br />

			# use 
				# 若要空格的话要先将空格转了
				$result =  str_replace(" ","&nbsp",$string);
				$result = nl2br($result);
				echo $result;		
		# 打印所有报错信息
			error_reporting(E_ALL);
		# php内部post网页
			<?php
			$URL="www.mysite.com/test.php";
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL,"https://$URL");
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, "Data1=blah&Data2=blah");
			curl_exec ($ch);
			curl_close ($ch);
			?>
# extention  (扩展)
	# 动态添加扩展
		#下载下应版本的源码包如(php-5.3.3.tar.gz)
			#进入源码包需要的扩展
			cd php-5.3.3/ext/gettext
			/usr/local/php/bin/phpize
			./configure --with-php-config=/usr/local/php/bin/php-config
			make && make install
			#　修改php.ini文件加入扩展
				vim /etc/php.ini
					# 添加一行
					extention = gettext.so
					extention_dir = "安装后提示的扩展目录"
			# 生效
				#　重启apache 或php-fpm即可生效
			# 注意
				#　必须使用相同版本的源码包安扩展,以避免版本不同的错误

		# phpunit 
				# 下载安装4.8（支持5.3以上,其他版本到官网查看)
					wget https://phar.phpunit.de/phpunit-old.phar    
					chmod +x phpunit-5.3.2.phar
					cp phpunit.phar /usr/local/bin/phpunit
					phpunit –version       # 如果能出现版本表示安装成功．

    # keepalived
        # web 
            http://blog.sina.com.cn/s/blog_6dbc8a680100u1s7.html
        # install
            wget http://www.keepalived.org/software/keepalived-1.2.13.tar.gz
            tar -zxvf keepalived-1.2.13.tar.gz
            cd keepalived1.2.13
            ln -s /usr/src/kernels/2.6.9-78.EL-i686/usr/src//linux
            ./configure 
            make && make install
            cp /usr/local/etc/rc.d/init.d/keepalived /etc/rc.d/init.d/
            cp /usr/local/etc/sysconfig/keepalived /etc/sysconfig/
            mkdir /etc/keepalived
            cp /usr/local/etc/keepalived/keepalived.conf/etc/keepalived/
            cp /usr/local/sbin/keepalived /usr/sbin/
            chkconfig --add keepalived

        # use 
            service keepalived start  # 启动服务
            service keepalived status # 查看服务状态


        # config

    # memcache
        # web 
            http://www.linuxidc.com/Linux/2015-05/117170.htm  # memcache 安装
            http://www.360doc.com/content/11/0722/00/1542811_135109676.shtml # 负载均衡
            http://www.111cn.net/sys/linux/80018.htm  # useful 
            http://www.bubuko.com/infodetail-1591704.html  # useful
        
        # install 

            # install libmemcached
                yum remove libmemcached libmemcached-devel  # remove原有
                wget https://launchpad.net/libmemcached/1.0/1.0.17/+download/libmemcached-1.0.17.tar.gz
                tar zxf libmemcached-1.0.17.tar.gz
                cd libmemcached-1.0.17
                ./configure
                make
                make install

            # install memcached
                git clone https://github.com/php-memcached-dev/php-memcached.git
                cd php-memcached
                git checkout php7
                phpize
                ./configure --disable-memcached-sasl
                make && make install

    # redis 
        # install 
            # web 
                http://blog.csdn.net/ludonqin/article/details/47211109
            # 安装扩展

                # wget https://github.com/phpredis/phpredis/archive/2.2.4.tar.gz   # 其他版本
                git clone -b php7 https://github.com/phpredis/phpredis.git  # php7
                cd phpredis-2.2.7                      # 进入 phpredis 目录
                /usr/local/php/bin/phpize              # php安装后的路径
                ./configure --with-php-config=/usr/local/php/bin/php-config
                make && make install
                vim 路径下/php.ini
                    extension_dir = "/usr/local/php/lib/php/extensions/no-debug-zts-20090626"
                    extension=redis.so

            # 主从配置

            # 集群配置

        # use 
            # server 
                redis-server -v   # 查看redis版本
                redis-server /etc/redis/redis.conf    # 启动redis服务器,并引用配置文件
            # client
                redis-cli       # 打开redis客户端
                127.0.0.1:6379> set hello 3000  # 设置hello的值为3000
                127.0.0.1:6379> get hello   # 获取hello的值
                127.0.0.1:6379> keys *      # 显示所有键值

            # code (PHP)
                $redis = new Redis();  # 实列化Redis
                $redis->connect('127.0.0.1', 6379);   # 连接实列
                $redis->keys("*");     #  获取所有的键值列表
                
                # get set 
                    $redis->set("tutorial-name", "Redis tutorial");  # 设置键值
                    $redis->get("hello");  #  获取键值为hello的值
                #hash 
                    hset myhash field1 Hello    # 设定myhash 表的field1值为Hello,返回1表示key不存在
                    hsetnx myhash field "Hello" # 设置hash field为指定值，如果key不存在，则先创建。如果field已经存在，返回0，nx是not exist的意思。 
                    hmset myhash field1 Hello field2 World # 同时设置多个filed
                    hget myhash field1          # 获取指定的hash field
                    hmget myhash field1 field2 field3  # 获取全部指定的filed
                    hexists myhash field1       # 测试指定field 是否存在
                    hlen myhash                 # 返回指定hash的field数量
                    hdel myhash field1          # 删除某个field
                    hkeys myhash                # 返回hash 的所有filed
                    hvals myhash                # 返回hash 所有value
                    hgetall myhash              # 获取某个hash中全部的filed及value


                    # tips 返回nil 表示为空

                    
                    

        # config 
            hash-max-zipmap-entries 64   #配置hash字段最多64个。
            hash-max-zipmap-value 512    #配置hash value最大为512字节。

				
		# xdebug
				# download
						wget https://xdebug.org/files/xdebug-2.4.0.tgz
				# install 
						tar zxvf xdebug-2.4.0.tgz
						cd xdebug-2.4.0
						/usr/local/php7/bin/phpize  # 找到想编译的路径
						./configure --with-php-config=/usr/local/php7/bin/php-config # 对应相应的php-config
						make && make install 
						vim /usr/local/php7/lib/php.ini
								extension_dir = '生成出来的dir'
								extension= xdebug.so
						# 重新运行php-fpm
						
		# Toran Proxy ( A Composer proxy )
				https://toranproxy.com/download

		# composer
				# download(下载)
						# 直接下载法
								https://getcomposer.org/download/1.1.2/composer.phar
								chmod +x composer.phar
								cp composer.phar /usr/bin/composer
						# curl 法
							curl -sS https://getcomposer.org/installer | php	
				# 安装
						cp composer.phar /usr/local/bin/composer
						composer -v  # 能显示版本信息表示安装成功
				# 包地址
						https://packagist.org
				# use
						# 正常使用
								1.在项目下建立composer.json 文件，里面声明依赖关系
								2.进入composer.json文件所在位置，composer install 使用安装
						# 自动生成composer
								 composer init --require "monolog/monolog:1.0.*" 
								 composer init --require=foo/bar:1.0.0 -n  # -n 不用回答问题
						# 下载或更新 composer
								composer update 
						# 验证正确性
								composer validate  # 验证正确性
						# 仅更新单个库
								composer update foo/bar
								composer update nothing  #，Composer不会更新库，但是会更新composer.lock。注意nothing并不是update命令的关键字。只是没有nothing 这个包导致的结果。如果你输入foobar，结果也一样。
								composer update --lock # 效果同上(新版本才有)
						# 直接安装库
								composer require "foo/bar:1.0.0"

        # composer 打包及下载包
            1. 在github上创建项目,提交代码
                项目结构
                    docs/    # 说明文档
                    src/     # 源代码
                    tests/   # phpunit
                    composer.json

            2. 在项目内添加composer.json文件 (格式参考: https://github.com/kidphp/kidphp_rand/composer.json)
            3. 在https://packagist.org 登录自已的github 账号,点submit提交自已的github包地址
            4. 在github添加钩子
            5. 编写引用项目的composer 
            6. 在引用项下 composer install -vvv  安装包 composer update -vvv 更新包
								
								

# problem
		# 中文乱码
				在php文件头加入以下一句
				header("Content-Type:text/html;charset=utf8");

# error
		# phpinfo 有模块　命令行下php -m 没有模块
				# 原因是没有加载php.ini
				php --ini | grep Configuration # 将php.ini拷贝一份到出现的目录就可以在cli使用加载的模块了
