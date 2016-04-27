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

# install 
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
						
				# 切换和启动
						/usr/local/php/sbin/php-fpm stop  # 停止php5fpm
						/usr/local/php7/sbin/php-fpm      # 启动php7fpm
						cp /usr/bin/php /usr/bin/php_old  # 将命令行旧有php更换
						cp /usr/local/php7/bin/php /usr/bin/php  # 将php7命令放入环境
						cp /usr/local/php7/bin/php /usr/local/bin/php  # 将php7命令放入环境
				
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
