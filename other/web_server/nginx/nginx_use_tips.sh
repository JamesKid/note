# 加载 .htaccess  file
	# 教程地址
		http://www.php100.com/html/program/nginx/2013/0905/5537.html
	# vim /var/www/web/.htaccess
		# nginx rewrite rule
		rewrite ^(.*?)/article/.*?-(d+)-(d+).html$   $1/show.html?id=$2&page=$3      break;
		rewrite ^(.*?)/category/.*?-(d+)-(d+).html$  $1/list.html?id=$2&page=$3      break;
		rewrite ^(.*?)/tag/([^/]+)/?$   $1/tag.html?w=$2        break;
		rewrite ^(.*?)/tag/([^/]+)/(d+)$       $1/tag.html?w=$2&page=$3       break;
		# end nginx rewrite rule
	# vim /usr/local/nginx/conf/nginx.conf
		include /var/www/web/.htaccess
	/usr/local/nginx/sbin/nginx  # restart nginx

	# 注意!!　　建设用conf 文件来保存rewrite规则
