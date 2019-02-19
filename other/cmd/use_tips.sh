# 
	# 配置ip地址
		# 显示设置情况
			netsh interface ip show config
		# 静态地址切换为dhcp
			netsh interface ip set address "本地连接" dhcp
		# 设置静态地址
			netsh interface ip set address "本地连接" static 　IP 　掩码 　网关 　跃点数
			netsh interface ip set address "本地连接" static 192.168.0.10 255.255.255.0 192.168.0.1 1
		# 更改dns 为192.168.0.1
			netsh interface ip set DNS  "本地连接" static 192.168.0.1
		# 删除网关:
			netsh interface ip delete address "本地连接" gateway=all
		# 删除DNS:
			netsh interface ip delete dns "本地连接" all
	# 配置ip批处理
		vim setIp.bat
			netsh interface IP set address local static 192.168.1.200 255.255.255.0
			netsh interface IP set address local static gateway=192.168.1.1 gwmetric=1
			netsh interface IP set dns "%1" static 192.168.1.1
			netsh interface ip add dns "%1" 61.128.128.68 index=2 
