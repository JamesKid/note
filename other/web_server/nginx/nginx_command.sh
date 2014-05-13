# 1.restart nginx
		# exp:
		ps -auxww |grep nginx        # get the nginx process 
		kill <process id>            # kill the process id 
		/usr/local/nginx/sbin/nginx  # restart the nginx
		setenforece 0				 # close the selinux
		/usr/local/php/sbin/php-fpm start # start php-fpm 

# 2.open the 80 port
		# exp:
		/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT  # open 80 port
		/etc/rc.d/init.d/iptables save   # save the config
		/etc/rc.d/init.d/iptables restart   #  restart the iptables service
		/etc/init.d/iptables status    # show if the 80 port is open 

# error
	# 98: address already in use 
		ps auxww | grep nginx			# find nginx process
		kill <nginx process number>		# kill nginx process 
		/usr/local/nginx/sbin/nginx		# restart nginx
	
