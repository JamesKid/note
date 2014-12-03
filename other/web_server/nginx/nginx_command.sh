# 1.restart nginx
		# exp:
		ps -auxww |grep nginx        # get the nginx process 
		kill <process id>            # kill the process id 
		/usr/local/nginx/sbin/nginx  # restart the nginx
		setenforece 0				 # close the selinux
		/usr/local/php/sbin/php-fpm restart # start php-fpm 
		/usr/local/php/sbin/php-fpm start # start php-fpm 

# 2.open the 80 port
		# exp:
		/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT  # open 80 port
		/etc/rc.d/init.d/iptables save   # save the config
		/etc/rc.d/init.d/iptables restart   #  restart the iptables service
		/etc/init.d/iptables status    # show if the 80 port is open 
# 3. open gzip 
	# note : use gzip will use cup ,you need to balance it 
		vim nginx.conf
			gzip on;
			gzip_disable "msie6"; # in the ie6 gzip will have problem,close it 
			gzip_vary on;
			gzip_prozied any;
			gzip_comp_level 8; # zip level 
			gzip_buffers 16 8k;
			gzip_http_version 1.1;
			gzip_types text/plain test/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

# 4 test 
	/usr/local/ngin/sbin/nginx -t # test the nginx.conf file

# error
	# 98: address already in use 
		ps auxww | grep nginx			# find nginx process
		kill <nginx process number>		# kill nginx process 
		/usr/local/nginx/sbin/nginx		# restart nginx
	# phpinfo have no mysql
		# find mysql.so
			vim /etc/php.ini 
				extension = mysql.so
		# echo phpinfo() find path of php.ini
			cp /etc/php.ini /usr/local/php/lib/
	
