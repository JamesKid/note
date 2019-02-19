#第一章 nginx简介
#第二章 nginx服务器的安装与配置
	# 1. you need to install the following package
		yum -y install gcc gcc-c++ autoconf automake
		yum -y install zlib zlib-devel openssl openssl-devel pcre pcre-devel
	# 2. download nginx package in www.nginx.net

	# 3. install nginx package
		# install in windows
			d:
			cd d:\nginx
			start nginx
			# use nginx -s [ stop | quit | reopen | reload ]
		# install in linux
			tar zxvf nginx-xxxx
			cd nginx-xxxx
			./configure
			make
			sudo make install 
		# default path of nginx
			/usr/local/nginx
		
			
			

