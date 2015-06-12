#1_linux防火墙禁IP命令
 

	# 封单个IP的命令是： 
		iptables -I INPUT -s 211.1.0.0 -j DROP 

	# 封IP段的命令是： 
		iptables -I INPUT -s 211.1.0.0/16 -j DROP 
		iptables -I INPUT -s 211.2.0.0/16 -j DROP 
		iptables -I INPUT -s 211.3.0.0/16 -j DROP 

	# 封整个段的命令是： 
		iptables -I INPUT -s 211.0.0.0/8 -j DROP 

	# 封几个段的命令是： 
		iptables -I INPUT -s 61.37.80.0/24 -j DROP 
		iptables -I INPUT -s 61.37.81.0/24 -j DROP 

	# 想在服务器启动自运行的话有三个方法： 
		1、把它加到/etc/rc.local中 
		2、iptables-save >;/etc/sysconfig/iptables可以把你当前的iptables规则放到/etc/sysconfig/iptables中，系统启动iptables时自动执行。 
		3、service iptables save 也可以把你当前的iptables规则放/etc/sysconfig/iptables中，系统启动iptables时自动执行。 
		后两种更好此，一般iptables服务会在network服务之前启来，更安全。 

	# 解封的话： 
		iptables -D INPUT -s IP地址 -j REJECT 
		iptables -F 全清掉了   
