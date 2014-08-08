# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is the note about linux soft use 
# @change		: 2014_7_8_17_48 add dstat soft note 
# ======================================================================

# tips 
	# here are the note about linux soft (这里放需要安装的软件的使用笔记)

# webs
	# http://www.csdn.net/article/2012-07-11/2807272 (28个实用linux & unix 软件)

# soft 
	# dstat (size:100kb 查看系统性能的软件)
		#  example 
			dstat -c         # show the cup station (实时显示cpu的占用情况)
			dstat -cdlmnpsy  # show all the information (显示所有的系统性能情况)
		# param
			-c		# show the cpu information  (显示cpu的使用情况)
			-C 0,1  # show the 1,and 2 cpu information (显示第一第二个cpu的信息)
			-d		# show the disk station (显示磁盘的实时读写情况)
			-g		# enable page stats
			-i		# enable interrupt stats (显示中断)
			-l		# enable load stats
			-m		# show memory (显示内存使用情况)
			-n		# show net status (显示网络情况)
			-N eth1,total	# show net card status (显示示指定网卡的网络情况)
			-p		# -proc enable process stats
			-s		# -swap 显示swap情况
			-S		# swap1,total 可以指定多个swap
			-t		# -time enable time counter
			-y		#  -sys enable system stats
			-ipc	# 报告IPC消息队列和信号量的使用情况
			-lock	# enable lock stats
			-raw	# enable raw stats
			-tcp	# enable tcp stats
			-udp	# enable udp stats
			-unix	# enable unix stats
			-M		# stat1,stat2 enable external stats
			-mods	# stat1,stat2
			-a		# -all 使用-cdngy 缺省的就是这样显示
			-f		#  -full 使用 -C, -D, -I, -N and -S 显示
			-v		#  -vmstat 使用-pmgdsc -D 显示
			-integer # show integer values
			-nocolor # disable colors (implies -noupdate)
			-noheaders # 只显示一次表头以后就不显示了,使用重定向写入文件时很有用
			-noupdate # disable intermediate updates
			-output # file 写入到CVS文件中
	# slurm
		# web
			http://mirrors.oschina.net/ubuntu/pool/universe/s/slurm-llnl/
	# tmux  (分割终端的软件)
		# web
			# 
			http://qyappchentao.sinaapp.com/centos-tmux-screen-byobu/
			# 教程web
				http://blog.chinaunix.net/uid-26285146-id-3252286.html
				http://blog.csdn.net/yjj1s/article/details/6413172
		# install
			yum install libevent-devel ncurses-devel
			wget http://downloads.sourceforge.net/tmux/tmux-1.6.tar.gz
			tar -zxvf tmux-1.6.tar.gz
			cd tmux-1.6
			./configure
			make 
			make install
		# use 
			tmux	# 打开tmux
		# ctrol
			ctrl+b c   # 创建新窗口
			ctrl+b p   # 上一个窗口
			ctrl+b n   # 下一个窗口
			ctrl+b q   # 显示面板编号
			ctrl+b number # 跳到指定编号窗口
			ctrl+b d   # 脱离当前会话,暂时返回shell,输入tmux attach重新进入
			ctrl+b &   # 关闭当前窗口
			ctrl+b 引号   # 横向分割出来一个窗口 
			ctrl+b %   # 纵向分割出来一个窗口 
			ctrl+b !   # 关闭所有小窗口
			ctrl+b x   # 关闭当前光标处的小窗口
			ctrl+b t   # 钟表
			ctrl+b o   # 切换窗口


	# byobu (byobu是tmux的再封装,安装之前要装scree/tmux中的一种)
		wget https://launchpad.net/byobu/trunk/5.57/+download/byobu_5.57.orig.tar.gz
		tar -zxvf byobu_5.57.orig.tar.gz
		cd byobu-5.57
		./configure
		make && make install

	# zsh  (linux下装X利器之一)

	# multitail (多个日志动态查看及监控)
		# github 
			https://github.com/flok99/multitail	
		# install
			wget http://www.vanheusden.com/multitail/multitail-6.2.1.tgz
		# use
			multitail -i file1 -i file2 # 监控两个文件
			multitail /var/log/apache/access.log -I /var/log/apache/error.log 
									    # 合并两个文档内容
			multitail -l ls             #　监控命令的动态输出 
			multitail -l "ping localhost" #　监控命令的动态输出
			multitail -c -l "ping localhost" #　带颜色输出
			multitail -cS ssh -l "ping localhost" #　选用ssh配色方案
			multitail -e "gnu-pop3d" /var/log/messages # gep gnu-pop3d 的行
			multitail -v -e "ssh" /var/log/messages    # 反选不包含ssh的行
			multitail -v -e "ssh" -v -e "gnu-pop3d" -e "localhost " /var/log/messages    
								# 反选不包含ssh,gnu-pop3d但是包含localhost 的行

		# path
			/etc/multitail.conf.new   # 配色方案
	# htop (相当于top 的加强版,颜色显示不同参数,且支持鼠标操作)
		# 安装支持的组件
			wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
			tar xvfz ncurses-5.9.tar.gz
			cd ncurses-5.9
			./configure
			make
			make install
		# 安装htop
			wget http://sourceforge.net/projects/htop/files/htop/0.9/htop-0.9.tar.gz
			tar zxvf htop-0.9.tar.gz
			cd htop-0.9
			./configure
			make
			make install
		# use 
			Shortcut	FunctionKey	 Description		         中文说明
			h, ?			F1		 Invoke htop Help			 查看htop使用说明
			S		        F2		 Htop Setup Menu		     htop 设定
			/				F3		 Search for a Process	     搜索进程
			\				F4		 Incremental process filtering	增量进程过滤器
			t				F5		 Tree View				     显示树形结构
			<, >			F6		 Sort by a column	         选择排序方式
			[				F7		 Nice - (change priority)	 可减少nice值，这样就可以提高对应进程的优先级
			]				F8		 Nice + (change priority)	 可增加nice值，这样就可以降低对应进程的优先级
			k				F9		 Kill a Process				 可对进程传递信号
			q				F10		 Quit htop					 结束htop
		# web  (详细教程地址)
			http://www.cnblogs.com/mchina/archive/2013/03/15/2858041.html
	# iotop(监控磁盘IO使用状况)
		# install 
			yum install iotop
		# use 
			-b:  批处理模式,适合用于通过脚本将I/O的使用状况记录到文件中.
			-o:  只报告有I/O活动进行的进程
			-t:  在显示结果中增加时间
			–iter=# : 限制iotop运行时候的采样次数
			-q:  让显示结果在第一次运行之后不再显示结果列的头部信息. “-qq”则完全不显示头部信息, “-qqq”则不显示头部和I/O汇总信息
			iotop -botqqq  # 实时显示,并显示时间

		# web  (详细教程地址)
			http://www.zrwm.com/?p=1440
		# 每隔一分钟记录一次I/O 状况
			vim /etc/cron.d/iotop
			#　加入以下内容并保存
				#  Run iotop and log any detected activity.
				* * * * * root iotop -botqqq --iter=3 >> /data/logs/iotop
				# cron.d 就会使iotop每分钟运行一次(每运行一次iotop采样3次,间隔为5秒),记录I/O状况到日志文件/data/logs/iotop中.
			# 
		# 类似命令
			vmstat 1 
			iostat -k -x -d 5 3
			dstat -d 
			pidstat -d -p pid 
		# problem 
			# yum install 后用不了报   File "/usr/bin/iotop", line 16, in ?
				# 解决办法
					yum remove iotop
					yum install python26
					rpm -ivh http://guichaz.free.fr/iotop/files/iotop-0.4.1-1.noarch.rpm
					vim /usr/bin/iotop
						# edit first line #!/usr/bin/python 
						#              to #!/usr/bin/python2.6


		
	# mtr(网络检测工具)
		# install
			yum install mtr -y
		# use 
			mtr -r www.frlgz.com # 追踪 www.frlgz.com 经过的路由
			# 说明 
				#第一列:显示的是IP地址和本机域名，这点和tracert很像
				#第二列:snt:10 设置每秒发送数据包的数量，默认值是10 可以通过参数 -c来指定。
				#第三列:是显示的每个对应IP的丢包率
				#第四列:显示的最近一次的返回时延
				#第五列:是平均值 这个应该是发送ping包的平均时延
				#第六列:是最好或者说时延最短的
				#第七列:是最差或者说时延最常的
				#第八列:是标准偏差
	# zabbix
	# nagios 
	# cacti
	# ttyrec
		# ttyrec是一个 tty 控制台录制程序，其所录制的数据文件可以使用与之配套的 ttyplay 播放。

		








