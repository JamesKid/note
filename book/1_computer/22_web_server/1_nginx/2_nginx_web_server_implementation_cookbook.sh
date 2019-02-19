# chapter1
	# 1 go into the directory and configure it,here you can enable 
	#   and disable the core modules that already come with Nginx.
	#   following is a sample sonfigure command;
		./configure --with-debug \
		--with-http_ssl_module \
		--with-http_realip_module \
		--with-http_ssl_module \
		--with-http_pers_module \
		--with-http_stub_status_module
	# 2  you can figure out more about what other modules and configuration flags use:
		./configure --help

	# 3 log errors for specific IP addresses.  that will log errors from 192.168.1.1 
	#	and the IP range of 192.168.10.0/24:
		error_log logs/error.log;
		events {
			debug_connection 192.168.1.1;
			debug_connection 192.168.10.0/24;
		}
	# 4 reload Nginx setup
		>Debian based:  /etc/init.d/Nginx reload
		>Fedora based: service Nginx reload
		>FreeBSD/BSD: service Nginx reload
		>Windows:Nginx -s reload	

	# 5 control signals to the Nginx master process
		>TERM,INT	Quick shutdown
		>QUIT		Gracefuul shutdown 
		>HUP		Reload configuration,gracefully shutdown the worker processes and 
					restart them 
		>USR1		Reopen the log files
		>USR2		Upgrade the executable on the fly , when you have already instlled it 
		>WINCH		Gracefully shutdown the worker process
		# exp:
		kill -HUP <PID of the nginx master process>

	# 6 get the nginx process
		ps auxww | grep nginx
	# 7 path of the fastcgi.conf and nginx.conf
		/usr/local/nginx/conf/fastcgi.conf
		/usr/local/nginx/conf/nginx.conf


