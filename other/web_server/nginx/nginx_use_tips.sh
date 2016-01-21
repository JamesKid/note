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
		# good web 
			http://54im.com/nginx/nginx-tomcat-cluster.html
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
# 4. nginx 监控　
		# 方法一
			# 添加location 
					vim nginx.conf
							server {
									listen xxx
									# 添加以下location 
									location /ngx_status {
											stub_status on; 
											access_log off;
									}
							}
			# 重启nginx 
					service nginx restart 
			# 测试
					curl http://www.xxx.com/ngx_status  #  查看状态及链接数
					curl -m 5 -s -w %{http_code} http://www.frlgz.com/index.html -o /dev/nul l  # 获取状态码(200,404,500)

			# 参数
					Active connections  # 当前活跃链接(就是现在有多少个人在线)
					server accepts      # 总共处理了的链接数
					handled             # 成功创建握手数
					requests            # 总共处理的请求
					reading             # 读取客户端的连接数
					writing             # 响应数据到客户端的数量
					waiting             # 开启keep-alive 的情况下，这个值等于active (reading+writing ),意思就是nginx 已经处理完下正在等候下一次请求指令的驻留连接。
					
		# 方法二
				# 命令查询
						netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a,S[a]}'
				# 参数
						SYN_RECV        # 一个连接请求已经到达，等待确认
						ESTABLISHED     # 正常数据传输状态/当前并发连接数
						FIN_WAIT2       # 另一边已同意释放
						ITMED_WAIT			# 等待所有分组死掉
						TIME_WAIT       # 另一边已初始化一个释放
						LAST_ACK        # 等待所有分组死掉



				

