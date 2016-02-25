# 1 加载 .htaccess  file
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
# 2 负载均衡
	# 轮询式
		# web learn 
			http://www.php100.com/html/program/nginx/2013/0905/5525.html
		# use 
			# A  主服务器 192.168.5.149 (只做转发,不做服务)
			vim /usr/local/nginx/conf/nginx.conf  # add 
				upstream a.com  {
					server 192.168.5.27:80;
					server 192.168.5.126:80;
					# 若要主服务器也提供服务则要换个端口,否则会死循环
					# server 127.0.0.1:8080
				}
				server{
					listen 80;
					server_name a.com;
					location / {
					proxy_pass         http://a.com;
					proxy_set_header   Host             $host;
					proxy_set_header   X-Real-IP        $remote_addr;
					proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
					}
				}
			/usr/local/nginx/sbin/nginx  # restart nginx 
			# B 192.168.5.27   (提供web服务)
			# C 192.168.5.126   (提供web服务)
				vim /usr/local/nginx/conf/nginx.conf  # add 
					server{
						listen 80;
						server_name a.com;
						index index.html;
						root /data0/htdocs/www;
					}
			# 数据库要指向统一的位置

		# test 

			# 如果运行成功，这时在你win7的浏览器中输入http://192.168.1.100 ，
			# 这时会有i am server 2显示，按f5刷新，server名字每次都会变化！
# 3 nginx压力测试
	# web 
		http://www.nginx.cn/110.html
	# use 
		# install 
		  # method1
				apt-get install apache2-utils # ubuntu
				ym install httpd-tools        # centos
			# method 2
				yum install apr-util
				yum install yum-utils
				cd /opt
				mkdir abtmp
				cd abtmp
				yum install yum-utils.noarch
				yumdownloader httpd-tools*
				rpm2cpio httpd-*.rpm | cpio -idmv
				cp /opt/abtmp/usr/bin/ab /usr/bin/
		# put file to the nginx/html directory
			ab.html
		# test with 1000 request 
			ab -kc 1000 -n 1000 http://localhost/ab.html
			# or other 
				ab -kc 1000 -n 1000 http://www.nginx.cn/ab.html
# ４ nginx伪静态
		# 项目conf引用 htanginx  伪静态文件
				cd /xx/nginx/sites-enabled/
				vim web1.conf
						# 加入以下这句引用伪静态文件
						include /var/www/project/htanginx;
				vim /var/www/project/htanginx  # 编辑伪静态文件
		# 规则
				rewrite ^/info/([a-z0-9]+)$ /info/article-category-100-fileid-$1 last;   # 将info后的数字转为fileid的值
				rewrite 6/info/test/$ /copyright/info-test-986 last;


						



				

