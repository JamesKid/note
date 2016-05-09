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
		# 查看cli的插件(cli跟phpinfo()不同
				php -m
		# 查看cli php.ini位置
				php --ini 
				php --ini | grep Configuration # 将php.ini拷贝一份到出现的目录就可以在cli使用加载的模块了
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


# problem
	# 中文乱码
		在php文件头加入以下一句
		header("Content-Type:text/html;charset=utf8");

# error
		# phpinfo 有模块　命令行下php -m 没有模块
				# 原因是没有加载php.ini
				php --ini | grep Configuration # 将php.ini拷贝一份到出现的目录就可以在cli使用加载的模块了
