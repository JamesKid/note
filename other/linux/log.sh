# 日志监控
	#登录日志
		# ssh
			last | grep root # 查看root的ssh登录日志
			last | grep root | grep still # 查看当前在线
		# vpn
			last | grep ppp  # 查看ppp vpn的登录日志
			last | grep ppp | grep still  # 查看当前在线

# path 
	# 日志路径
		/var/log
		/var/log/last
		
