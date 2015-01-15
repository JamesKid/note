 ================================JamesKid============================== 
 @author		: JamesKid  
 @description :   this is note about msmtp install (邮件服务器安装)
 @change		:
 ======================================================================
# install
	# web
		http://www.2cto.com/os/201405/304381.html
	# install
		# 下载msmtp
		wget http://downloads.sourceforge.net/msmtp/msmtp-1.4.30.tar.bz2?big_mirror=0
		# 解压
		tar -jxvf msmtp-1.4.30.tar.bz2
		# 进入msmtp目录
		cd msmtp-1.4.30
		# 编译安装
		./configure –prefix=/usr/local/msmtp
		make && make install
		#  配置msmtp账号
			#  切换到目录
			cd /usr/local/msmtp
			#新建文件夹etc
			mkdir etc
		# 使用vi新建文件，输入：
			vi /usr/local/msmtp/etc/msmtprc 
				# Set default values for all following accounts.
				defaults
				logfile /var/log/msmtp.log
				# The SMTP server of the provider.
				account service
				# SMTP邮件服务器地址
				host smtp.qq.com
				#端口
				port 25
				# 发送的邮件Email
				from xxx@xxx.com
				auth login
				# 邮件服务器登录账号
				user xxx@xxx.com
				# 邮件服务器登陆密码
				password 123456  # 此处为邮箱的独立密码
				# Set a default account
				account default : service
			#保存退出。
		# 设定权限
			chmod 600 etc/msmtprc
		# 测试
			/usr/local/msmtp/bin/msmtp youremail@test.com
			输入任意字符，然后按Ctrl+D退出，查看邮件是否收到。
			由于设置了日志，可以到 /var/log/msmtp.log ，查看日志，发信成功失败都会有记录。
