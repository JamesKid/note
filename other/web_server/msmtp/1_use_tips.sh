 ================================JamesKid============================== 
 @author		: JamesKid  
 @description :   this is note about msmtp install (邮件服务器安装)
 @change		:
 ======================================================================
# install
	# web
		http://www.2cto.com/os/201405/304381.html
	# install
		# 安装msmtp 
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
		# 安装mutty
			yum install mutt -y
			# 编辑mutt的总设置，修改以下几行
				vi /etc/Muttrc
					set sendmail="/usr/local/msmtp/bin/msmtp"
					set from="noreply@XXX.net"
					set use_from=yes
					set realname=noreply@XXX.net
					set editor="vi"
			# 发件地址最好与msmtp设置的账号相同，否则可能会出错。下面以#开头的操作可以不做.
			# vi ~/.muttrc ， 编辑根目录下的设置
			# set envelope_from=yes
			# set from="发送邮件地址"
			# set realname="发件人"
			# set use_from=yes
			# 测试一下mutt是否有效
			echo "测试测试" | mutt -s "测试" 测试邮件地址
			echo "content" |mutt -s "title" XX@XXX.com
		# 使用
			echo "c" | mutt -a /home/backup/1.txt -s "s" -- 12345678@qq.com # 发送附件
			mutt -s "subject" -a /home/admin/backup.tar.gz -- xxx@163.com < /tmp/x.txt  # 以/tmp/x.txt　里的内容作为邮件内容
