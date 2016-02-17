#======================================================
#!/bin/bash 
# Description:  this program is note about php
# Editor:       zhangshijie 
 # Email:        406358964@qq.com 
 # Version:      1.0 
#======================================================
# 
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
