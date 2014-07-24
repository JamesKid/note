# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is the note about linux soft use 
# @change		: 2014_7_8_17_48 add dstat soft note 
# ======================================================================

# tips 
	# here are the not about linux soft (这里放需要安装的软件的使用笔记

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
	# zabbix 
	# nagios 
	# cacti

		








