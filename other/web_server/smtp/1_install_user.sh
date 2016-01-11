# web		
		http://www.zzbaike.com/wiki/CentOS/SMTP服务器的构建
# install 
		# 添加 MX记录
				到购买域名的后台添加,优先度从10-20,如smtp.frlgz.com
		# check （检查MX记录是否正常)
				hosts -t mx smtp.frlgz.com  # is handled 表示已经解析 MX记录
		# intall 
				yum -y install postfix

				
