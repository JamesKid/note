#======================================================
#!/bin/bash 
# Description:  this program is note about php
# Editor:       zhangshijie 
 # Email:        406358964@qq.com 
 # Version:      1.0 
#======================================================
# 

# function 
	# nl2br 
		# description :将\n 的换行转成<br />

		# use 
			# 若要空格的话要先将空格转了
			$result =  str_replace(" ","&nbsp",$string);
			$result = nl2br($result);
			echo $result;		
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
