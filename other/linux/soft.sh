# ================================JamesKid=====================================
# @author        : JamesKid  
# @description : this is the note about linux soft use 
# @change   : 2014_7_8_17_48 add dstat soft note 
#           : 2015_11_23_15_37 add script scriptreplay 命令行录制软件******
#           : 2015_11_23_17_45 add lynis maldet rkhunter ch$ootkit 漏洞扫描工具**
# ============================================================================
# tips 
    # here are the note about linux soft (这里放需要安装的软件的使用笔记)
    # install (手动安装)
        # 常见
            有时候手动configre make 安装软件后,软件不一定能用命令用,命令有可能还是旧版本
        # 处理方法(如安装gawk4.1替换3.1)
            whereis gawk   # 找到程序所在,确认程序
            /bin/gawk -V /usr/bin/gawk -V  #  加如/usr/bin/gawk 为gawk4.1 ,/bin/gawk 为3.1
            mv /bin/gawk /bin/gawk_bak
            ln -s /usr/bin/gawk /bin/gawk  # 其他路径同理

        # tips 
            /usr/local/bin  比/usr/bin 下的命令优先级要高
        

# webs
    # http://www.csdn.net/article/2012-07-11/2807272 (28个实用linux & unix 软件)

# soft 
    # ab 
        # use 
            ab -kc 1000 -n 10000 http://www.baidu.com/index.html
        # error
            #报apr_socket_recv:Connection timed out (主要是由于ab数量太大，需要改一下配置)
            http://blog.csdn.net/sflsgfs/article/details/6298776
                vim /etc/sysctl.conf
                  net.nf_conntrack_max = 655360
                  net.netfilter.nf_conntrack_tcp_timeout_established = 1200
                  sysctl -p /etc/sysctl.conf # 重新加载sysctl
                                  
        # ack(搜索工具) 比grep 强大
            # install 
        # autojump (目录导航)
        # alias 
            # alias 参数
                /!:1    #表示第1个参数
                /!:2*  #表示第2个及余下的所有参数
                /!*      #表示所有参数
            # example (例子)
                alias e="echo /!:1 >>/tmp/test.txt"

    # cat (查看文件)
        # use 
            cat -b /tmp/test1  # 显示行号
            cat -s /tmp/test1  # 多个空白行压缩到单个空白行
            cat -T /tmp/test1  # 不让制表符出现
        
    # chkconfig
        # show list (查看有哪些项目已经注册)
            chkconfig --list
            chkconfig --list mysqld
            chkconfig --list | grep mysqld  # 查看mysqld 进程
            chkconfig --level 3 memcached on   
            chkconfig --level 5 memcached on 
        # add  (添加自动开机项)
            chkconfig --add postfix    
        # open  (打开某项目开机启动)
            chkconfig vsftpd on
        # close  (打开某项目开机启动)
            chkconfig vsftpd off
        # tips 
            这个时候2~5都是on，就表明会自动启动了。
        # options (运行级别)
            运行级别0：系统停机状态
            运行级别1：单用户工作状态
            运行级别2：多用户状态(没有NFS)
            运行级别3：完全的多用户状态(有NFS)，登陆后进入控制台命令行模式
            运行级别4：系统未使用，保留
            运行级别5：X11控制台，登陆后进入图形GUI模式
            运行级别6：系统正常关闭并重启
            
    # chown (文件所有者命令)
        # option 
              # 
                      -c 显示更改的部分的信息
  　　　　  -f 忽略错误信息
  　　　　  -h 修复符号链接
  　　　　  -R 处理指定目录以及其子目录下的所有文件
  　　　　  -v 显示详细的处理信息
        　　# 选择参数:
        　　        --reference=<目录或文件> 把指定的目录/文件作为参考，把操作的文件/目录设置成参考文件/目录相同拥有者和群组
        　　　　--from=<当前用户：当前群组> 只有当前用户和群组跟指定的用户和群组相同时才进行改变
        　　　　--help 显示帮助信息
        　　　　--version 显示版本信息
        # use 
            chown mail:mail log2012.log # 改变拥有者和群组
            chown mail.mail log2012.log # 改变拥有者和群组
            chown root: log2012.log # 改变拥有者和群组
            chown :mail log2012.log # 改变群组
    　　　  chown -R -v root:mail test6 # 改变指定目录以及其子目录下的所有文件的拥有者和群组 

    # curl (下载上传ftp)
        # 列出目录列表
                curl ftp://malu.me/ --user name:passwd
                curl ftp://malu.me/ –u name:passwd    #简洁写法
                curl ftp://name:passwd@malu.me     #简洁写法2
        # 使用
                curl ftp://malu.me –u name:passwd -s #只列出目录，不显示进度条
                curl ftp://malu.me/size.zip –u name:passwd -o size.zip #下载一个文件：
                curl –u name:passwd -T size.mp3 ftp://malu.me/mp3/ #上载一个文件：
                curl –u name:passwd ftp://malu.me/ -X 'DELE mp3/size.mp3' #从服务器上删除文件（使用curl传递ftp协议的DELE命令）:
                #另外curl不支持递归下载，不过可以用数组方式下载文件，比如我们要下载1-10.gif连续命名的文件：
                curl –u name:passwd ftp://malu.me/img/[1-10].gif –O    #O字母大写
                #要连续下载多个文件：
                curl –u name:passwd ftp://malu.me/img/[one,two,three].jpg –O #O字母大写

                # 获取页面状态码
                 curl -I -m 10 -o /dev/null -s -w %{http_code}  www.letuknowit.com
       curl -s http:www.xx.com  # 不返回total 等等xx信息

    # extundelete (linux 恢复rm -rf 误删除文件)
        # web 
            http://www.centoscn.com/CentOS/Intermediate/2015/0114/4489.html
        # use 
            df -h  # 查看驱动器
            cd /tmp   # 进入tmp目录
            extundelete /dev/sdb1 --restore-file /tmp/text.txt  # 恢复文件
            extundelete /dev/sdb1 --restore-directory /usr/hello/  # 恢复目录
            extundelete /dev/sdb1 --restore-all    # 恢复整个分区
            # 恢得后会在当前所在目录下生成RECOVERY_FILE文件夹，恢复文件在里面
      

        # dstat (size:100kb 查看系统性能的软件)
                #  example 
                        dstat -c         # show the cup station (实时显示cpu的占用情况)
                        dstat -cdlmnpsy  # show all the information (显示所有的系统性能情况)
                # plugin 
                    # mysql 
                        # before install
                            yum install gcc libffi-devel python-devel openssl-devel mysql-devel
                        # install 
                            cd /usr/local/src/    
                            wget http://sourceforge.net/projects/mysql-python/files/mysql-python/1.2.3/MySQL-python-1.2.3.tar.gz
                            tar MySQL-python-1.2.3.tar.gz
                            cd MySQL-python-1.2.3
                            python setup.py install # 安装pyhton 支持
                            export DSTAT_MYSQL_HOSTS=127.0.0.1 # 地址
                            export DSTAT_MYSQL_USER=root  # 导入用户名
                            export DSTAT_MYSQL_PWD='123456'  # 导入密码
                            ./dstat --mysql5-cmds # 或者
                            # 教程网
                                http://www.tuicool.com/articles/y6naMf
                            # vim /usr/share/dstat/mysql5io.sh
                                export DSTAT_MYSQL_USER='root'
                                export DSTAT_MYSQL_PWD='123456'
                                dstat --mysql5-io $@

                            dstat --mysql5-io -c -m 3 5
                        # other 
                            # dstat --mysql5-conn (查看有多少人登录数据库,或者有多少个链接数)
                                    vim /usr/share/dstat/dstat_mysql5_conn.py
                                        # 把其中一行改成如下
                                        self.set2['Threads'] = float(float(thread[1]) / float(max[1]) * 100)
                                    vim mysql5io.sh
                                        #!/bin/bash
                                        #file:mysql5conn.sh
                                        export DSTAT_MYSQL_USER='user'
                                        export DSTAT_MYSQL_PWD='pwd'
                                        dstat --mysql5-conn $@
                                    sh mysql5io.sh
                            # dstat --mysql5-cmd (查看插入查询删除情况)
                                dstat --mysql5-cmd
                                # 一般要修改下select的长度
                                    vim /usr/share/dstat/dstat_mysql5_cmds.py 
                                        #改 self.width = 5 为
                                        self.width = 8
                                # 也可以自定义语句
                                    # 这个脚本质是 mysql>show global status;下取的数据所以改一下就可以得到更多的其他信息了
                                    # 在self.vars=('Com_select','Com_insert')这一行加入需要的语句
                                    # show status 为session ,show global status是全局


                        # error 
                            # ImportError: No module named setuptools
                                到
                                https://pypi.python.org/pypi/setuptools#id9
                                下载 setuptools-11.1.tar.gz 
                                tar -zxvf setuptools-11.1.tar.gz 
                                python setup.py install
                        
                # 更新安装包到最新版本 (有些功能最新版本才有)
                     wget http://pkgs.repoforge.org/dstat/dstat-0.7.2-1.el6.rfx.noarch.rpm
                     rpm Uvh dstat-0.7.2-1.el6.rfx.noarch.rpm  # 更新安装包
                            
                # other use 
                    dstat --top-io-adv --top-bio-adv # 查看哪些进程pid占用多少cpu,及io



                # param
                    -c        # show the cpu information  (显示cpu的使用情况)
                    -C 0,1  # show the 1,and 2 cpu information (显示第一第二个cpu的信息)
                    -d        # show the disk station (显示磁盘的实时读写情况)
                    -g        # enable page stats
                    -i        # enable interrupt stats (显示中断)
                    -l        # enable load stats
                    -m        # show memory (显示内存使用情况)
                    -n        # show net status (显示网络情况)
                    -N eth1,total    # show net card status (显示示指定网卡的网络情况)
                    -p        # -proc enable process stats
                    -s        # -swap 显示swap情况
                    -S        # swap1,total 可以指定多个swap
                    -t        # -time enable time counter
                    -y        #  -sys enable system stats
                    -ipc    # 报告IPC消息队列和信号量的使用情况
                    -lock    # enable lock stats
                    -raw    # enable raw stats
                    -tcp    # enable tcp stats
                    -udp    # enable udp stats
                    -unix    # enable unix stats
                    -M        # stat1,stat2 enable external stats
                    -mods    # stat1,stat2
                    -a        # -all 使用-cdngy 缺省的就是这样显示
                    -f        #  -full 使用 -C, -D, -I, -N and -S 显示
                    -v        #  -vmstat 使用-pmgdsc -D 显示
                    -integer # show integer values
                    -nocolor # disable colors (implies -noupdate)
                    -noheaders # 只显示一次表头以后就不显示了,使用重定向写入文件时很有用
                    -noupdate # disable intermediate updates
                -output # file 写入到CVS文件中
        # figlet (文字加粗效果软件)
                # download
                    http://download.chinaunix.net/download.php?id=5563&ResourceID=300
                # problem 
                    1.装好后要重新开一个终端才生效
                    2.配置好/fonts/standard.flf的环境变量

                # use 
                    figlet vim
                    figlet -c vim     # 居中显示
                    figlet -w 20 vim  # 每二十个字条换一行
                    # 若报错找不到standard.flf文件则
                    figlet aa -f /usr/local/src/figlet221/fonts/standard.flf

    # file (查看文件类型)
        file /tmp/test1   # 显示tset1: UTF-8 Unicode English text
        
        # grep 
                # 参数
                        -l  # 只列出目录
                        -i  # 忽略大小写
                        -R  # 遍历子目录
        # groups 
             groups user # 查看用户属于哪个组

        # history 
            # config 
            # 显示命令执行时间
                vim ~/.bashrc 
                    # 添加以下行
                    HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
                    export HISTTIMEFORMAT # 历史命令添加时间
                source ~/.bashrc
            # 添加历史显示条数(默认1000条)
                vim ~/.bashrc
                    HISTFILESIZE=2000
             # user 
           history # 查看历史    
           !number # 执行指定编号的历史指令
           history -c # 清除历史记录
           history -n # 列出最近执行的n条记录
           !!         # 重复执行上一次命令

        # hping (tcp/ip数据包分析工具)
            #　功能

    # (图片压缩工具
       # learn web 
          http://www.tuicool.com/articles/NBNFFj
          http://www.imagemagick.org/script/index.php # ImageMagick加工过的图片的例子。 
          http://www.imagemagick.org # 官网，各种图形开发接口
       # install 
          # ubuntu 
              sudo apt-get install imagemagick 
          # centos 
              yum install ImageMagick  # 区分大小写
       # use 
          find ./ -name "*.jpg" -exec convert {} {}.gif \; # 目录下所有jpg文件转化为gif
          # 用shell命令转换
            for i in *.jpg
              do
              convert $i `basename $i .jpg`.gif
            done
          # mogrify (修改) 
              mogrify -format png *.jpg  # 
              mogrify -sample 80x60 *.jpg  # 批量生成缩略图
          # convert  (转换)
              convert foo.jpg foo.png  # jpg 转png格式
              convert *.jpg foo.pdf    # 将多张图片转为pdf
              convert -resize 100x100 foo.jpg thumbnail.jpg # 按像素转换大小
              convert -resize 50%x50% foo.jpg thumbnail.jpg # 按百分比转换大小
              convert -mattecolor "#000000" -frame 60x60 yourname.jpg rememberyou.png # 在一张照片的四周加上边框，可以用 -mattecolor 参数
              convert -border 60x60 -bordercolor "#000000" yourname.jpg rememberyou.png # 同上
              convert -fill green -pointsize 40 -draw 'text 10,50 "charry.org"' foo.png bar.png  # 在图片上加文字， 上面的命令在距离图片的左上角10x50的位置，用绿色的字写下charry.org，如果你要指定别的字体，可以用-font参数。 
              convert -blur 80 foo.jpg foo.png # 高斯模糊
              convert -flip foo.png bar.png # 上下翻转
              convert -negate foo.png bar.png # 反色，开成底片的样子
              convert -monochrome foo.png bar.png # 把图片变为黑白颜色
              convert -noise 3 foo.png bar.png # 加噪声
              convert -paint 4 foo.png bar.png # 油画效果
              convert -rotate 30 foo.png bar.png # 把一张图片，旋转一定的角度
              convert -charcoal 2 foo.png bar.png # 形成炭笔或者说是铅笔画的效果。
              convert -spread 30 foo.png bar.png # 毛玻璃效果
              convert -swirl 67 foo.png bar.png # 以图片的中心作为参照，把图片扭转，形成漩涡的效果：
              convert -raise 5x5 foo.png bar.png #  凸起效果 用-raise来创建凸边
          # import(屏幕截图的组件)
              import foo.png # 截取屏幕的任一矩形区域
              import -rotate 30 -pause 3 -frame foo.png # 你可以把截取一个倾斜的窗口， 
              import -pause 3 -window root screen.png # 截取整个屏幕
          # display
              # use 
                  display foo.png # 显示图片 
                  display *.png   # 通配显示多个
                  display -delay 5 * # 幻灯片，每5个百分之秒显示一张图片
              # shortkey (快捷键)
                  space(空格):          # 显示下一张图片
                  backspace(回删键): # 显示上一张图片
                  h:                              # 水平翻转
                  v:                              # 垂直翻转
                  /:                              # 顺时针旋转90度
                  \:                              # 逆时针旋转90度
                  >:                              # 放大
                  <:                              # 缩小
                  F7:                              # 模糊图片
                  Alt+s:                      # 把图片中间的像素旋转
                  Ctrl+s:                      # 图象另存
                  Ctrl+d:                      # 删除图片
                  q:                              # 退出
          # tips 
              1.ImageMagick还提供有丰富的编程接口，比如，你可以用php来调用它，用ImageMagick来生成验证码图片，效果非常棒。
              2.ImageMagick还有一个小工具identify，它可以用来显示一个图片文件的详悉信息，比如格式、分辨率、大小、色深等等，你都可用它来帮你的忙。
              3.如果你对命令行不太熟悉，你也可以在图片上单击，你会发现，通过鼠标你也可以完成图像的编辑。


    # ifconfig (网卡管理命令)
        ifconfig lo down # 关闭lo网卡
        ifconfig eth1 down # 关闭eth1网卡
        ifconfig eth1 up # 开启eth1网卡
                
        # jobs (工作持起命令)
                jobs   # 显示所有工作
                bg %1  # 将工作１放到后台运行
                fg %2  # 将工作2放到前台运行
                ctrl+z # 挂起当前工作

        # lynis (命令行漏洞扫描工具)
         a install 
            yum install lynis
         # use 
         # maldet  (maldet：一个恶意软件扫描命令行工具，可以检测和隔离潜在的感染文件。可以在后台运行长期监视。)
      
                
    # pianobar (终端pandora音乐播放器)

    # talk (终端通讯聊天工具) 
      

      # toilet (文字杂符号效果)
            # learn 
                  http://os.51cto.com/art/201304/390059.htm
            # use 
            toilet mylinuxbokk 
            toilet -f mono12 -F metal mylinuxbook 
      # cowsay 
            # a cow say word
      # cmatrix ( 纯属装b )

      # nload
        # install 
            yum install nload
        # use 
            nload  # 显示网络实时带宽占用

    # rkhunter/chkrootkit(一个命令行工具，可以扫描本地系统里的潜在木马、隐藏后门和可疑利用，并禁用它们。)

    # rar (linux 下rar解压软件) 
        # web 
            http://blog.csdn.net/str999_cn/article/details/36017121
        # download
            http://www.rarsoft.com/download.htm  # 来源(from)
            http://www.rarsoft.com/rar/rarlinux-5.5.b2.tar.gz  # 32位版本
            
        # install 
            tar zxvf rarlinux-5.5b2.tar.gz
            cd rar 
            make    # 安装
             
        # use 
            rar a myFile *.jpg  # 压缩文件成rar
            unrar e myFile.rar  # 解压缩文件
    
    # rpm 
        rpm -qa | grep  'softname'  # 查找指定软件是否存在
        rpm -ql  软件名     #  查找软件安装目录或所在地址
        rpm -qlc 软件名     #  查找软件配置文件路径
        rpm -qR  软件名     #  列出需要的依赖套件 
        rpm -qf  软件名     #  查询哪个库里包含了 ls 文件(注意，需要安装了 /bin/ls 后才能查到) 
        rpm -qp  软件名     #  根据rpm包查询(.rpm 文件),可以接其他参数(如i查详细信息，l查文件列表 等) 

    # shelr (shell中的屏幕录制工具)
            # web
                  https://github.com/antono/shelr
                  shelr.tv
                

        # slurm
            # web
                    http://mirrors.oschina.net/ubuntu/pool/universe/s/slurm-llnl/
        # screen 
              #  屏幕共享软件
                    yum install screen   
                    screen -S cc   # creat a sceen in the file in server ip A 
                    screen -x cc   # get screen in client in ip 
              #　与tmux的对比
                    http://blog.longwin.com.tw/2011/04/tmux-learn-screen-config-2011/
        # script scriptreplay (命令行下视频录制) ******
            # use 
                    # 录制和播放
                              script -t 2>timing.log -a output.session  # 录制
                              scriptreplay timing.log output.session  # 播放录制
                      # 多用户广播视频
                              mkfifo scriptfifo  # terminal1中输入创建文件scriptfifo
                              cat scriptfifo  # terminal2中输入,进入scriptfifo文件会话
                              script -f scriptfifo  # terminal 1中输入,开始对scriptfifo文件执行动作
                              command   # terminal 执行命令，其他终端会看到
                              exit    # terminal 输入,中止广播
        # sed (使用教程)
                # use (常规用法)
                        sed 'Nd' filename # 删除第n行
                        sed 3~2d file.txt # 从第三行开始,每隔一行删除
                        sed '4,8d' file.txt
                        sed '4,8'd file.txt
                        sed 4,8d file.txt # 删除从第４行到第８行
                        sed '$'d file.txt  # 删除最后一行
                        sed /Sysadmin/d file.txt # 行匹配删除
                        sed '/Website Design/,$d' file.txt # 从匹配删除到末尾行
                        sed '/Storage/,+2d' file.txt # 删除匹配和后面两行
                        sed '/^$/d' file.txt # 删除空行


                # tips
                        # 配合grep 使用可遍历，可匹配
                                sed -i '/VB/'d `grep -l -R -i 'vbs' .`  # 删除匹配VB关键字的所有文件 grep -i 为忽略大小写 
                                sed 's/xxx/yyy/i' filename     # i参数忽略大小写
                                                                                                                # -l 为只列出目录
                # 参数
                        -i    # 将更改作用到文件上 
                    
        # shc （shell脚本加密)
                # web 
                        http://www.datsi.fi.upm.es/~frosal/sources/  # 源代码地址
                # install 
                        # method 1 
                                tar zvxf shc-3.8.6.tgz
                                cd shc-3.8.6
                                make test    # ubuntu加sudo 
                                make strings
                                make install   # 按y即可
                        # method2 
                                tar zvxf shc-3.8.6.tgz
                                cd shc-3.8.6
                                mkdir -p /usr/local/man/man1  # 需要加上这一行不然安装不了
                                make install 

                # use 
                        # 简单使用
                            shc -r -f test.sh   # 将test.sh生成test.sh.x test.sh.x.c 执行文件
                            ./test.sh.x     # 执行脚本
                        # 多个参数
                                shc -e 20/10/2010 -m "lianxi aaa@163.com" -v -r -f ./ex.sh
                # 参数
                        :e  # 指定过期日期
                        -m  # 过期显示信息
                        -r  # 可在相同操作系统的不同主机上执行
                        -f  # 指定源shell
                        

                # tips 
                        # 直接转入文件名执行需要添加环境变量
                            vim /etc/profile

                        
        # siege （开源压力测试工具,仿真并发,比ab好用)
                # tips 
                        siege可用于仿真用户请求负载，而ab则不能。但不要使用siege来执行最高性能基准调校测试，这方面ab就准确很多。
                # web 
                        http://www.2cto.com/kf/201503/385532.html
                # install 
                        yum instal siege
                # use
                        # 查看配置文件
                                siege -C
                        siege -c 300 -r 100 -f url.txt
                        siege -c 50 -r 100 https://www.abc.com/test.html # 50个用户（每次并发量，注意不是每秒并发量） 重复100次 共产生 50 * 100 = 5000个请求

                        siege -c 50 -r 100 https://www.abc.com/fcgi-bin/rs/?name=zhangsan          # 50个用户 重复100次 发送GET参数
                        siege -c 50 -r 100 https://www.abc.com/fcgi-bin/rs/ POST name=zhangsan  # 50个用户 重复100次 发送POST参数 (注意引号)
                        siege -c 50 -r 100 https://www.abc.com/fcgi-bin/rs/ POST < /root/ab_test/post.xml   # 50个用户 重复100次 发送POST参数(从文件中读取)

                # 参数
                        -C,或–config # 在屏幕上打印显示出当前的配置,配置是包括在他的配置文件$HOME/.siegerc中,可以编辑里面的参数,这样每次siege 都会按照它运行.
                        -v                     #  运行时能看到详细的运行信息
                        -c n,或–concurrent=n # 模拟有n个用户在同时访问,n不要设得太大,因为越大,siege 消耗本地机器的资源越多
                        -i,–internet # 随机访问urls.txt中的url列表项,以此模拟真实的访问情况(随机性),当urls.txt存在是有效
                        -d n,–delay=n # hit每个url之间的延迟,在0-n之间
                        -r n,–reps=n # 重复运行测试n次,不能与 -t同时存在
                        -t n,–time=n # 持续运行siege ‘n’秒(如10S),分钟(10M),小时(10H)
                        -l                     # 运行结束,将统计数据保存到日志文件中siege .log,一般位于/usr/local/var/siege .log中,也可在.siegerc中自定义
                        -R SIEGERC,–rc=SIEGERC # 指定用特定的siege 配置文件来运行,默认的为$HOME/.siegerc
                        -f FILE, –file=FILE # 指定用特定的urls文件运行siege ,默认为urls.txt,位于siege 安装目录下的etc/urls.txt
                        -u URL,–url=URL # 测试指定的一个URL,对它进行”siege “,此选项会忽略有关urls文件的设定
                        urls.txt文件：是很多行待测试URL的列表以换行符断开,格式为:
                        [protocol://]host.domain.com[:port][path/to/file]
                #　结果
                        ** SIEGE 2.72
                        ** Preparing 300 concurrent users for battle.
                        The server is now under siege.. done.

                        Transactions: 30000 hits #完成30000次处理
                        Availability: 100.00 % #100.00 % 成功率
                        Elapsed time: 68.59 secs #总共使用时间
                        Data transferred: 817.76 MB #共数据传输 817.76 MB
                        Response time: 0.04 secs #响应时间，显示网络连接的速度
                        Transaction rate: 437.38 trans/sec #平均每秒完成 437.38 次处理
                        Throughput: 11.92 MB/sec #平均每秒传送数据
                        Concurrency: 17.53 #实际最高并发连接数
                        Successful transactions: 30000 #成功处理次数
                        Failed transactions: 0 #失败处理次数
                        Longest transaction: 3.12 #每次传输所花最长时间
                        Shortest transaction: 0.00 #每次传输所花最短时间

    # sysctl ( 系统内核配置)
        # 路径
            /etc/sysctl.conf
            
        # use
            sysctl -a  #显示所有内核参数
            sysctl -p /etc/sysctl.conf  # 让改变生效
        # 参数说明

    # tmux  (分割终端的软件)
            # web
            http://qyappchentao.sinaapp.com/centos-tmux-screen-byobu/
            http://my.oschina.net/cshell/blog/135261 # new 2015.9.4
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
                tmux    # 打开tmux
        # 最常用
            trl+b 空格 # 切换横竖屏样式
            ctrl+b f    # 查找含有关键字的面板
            ctrl+b w    # 选择面板切换

            # 定制窗口
            tmux new -s name # 机子A定义一个名为name 的窗口 
            tmux attach -t name # 机子B 实时查看名为name的窗口,并可操作
            tmux ls          # 列出所有session
            tmux attach      # 视窗取回

            # 复制内容
            ctrl+b [ # 进入复制模式
            space    # 开始复制，移动光标选择复制区域
            hjkl     # 上下左右选择内容
            Enter    # 按 Enter 复制并退出copy-mode
            ctrl+b ]   # 粘贴内容
            #copy-mode 将快捷键设置为vi 模式
            setw -g mode-keys vi
        # ctrol
            ctrl+b c   # 创建新大　窗口
            ctrl+b p   # 上一个大窗口
            ctrl+b n   # 下一个大窗口
            ctrl+b q   # 显示面板编号 (快速输入编号可跳到相应编号面板)
            ctrl+b number # 跳到指定编号窗口
            ctrl+b d   # 脱离当前会话,暂时返回shell,输入tmux attach重新进入
            ctrl+b &   # 关闭当前窗口
            ctrl+b 引号   # 横向分割出来一个窗口 
            ctrl+b 单引号   # 定义窗口
            ctrl+b ;   # 切换前后两个窗口
            ctrl+b %   # 纵向分割出来一个窗口 
            ctrl+b !   # 关闭所有小窗口
            ctrl+b x   # 关闭当前光标处的小窗口
            ctrl+b t   # 钟表
            ctrl+b o   # 切换窗口
            ctrl+b+o   # 切换窗口并变欢位置
        # map 
            # let the ctrl+b change to ctrl+l
                vim /etc/tmux.conf
            # 用户级用~/.tmux.conf
                set -g prefix C-x
                unbind C-b
                bind C-x send-prefix
                set-window-option -g mode-mouse on # 开启滚轮 (更多资料网址http://www.cnblogs.com/bamanzi/archive/2012/08/17/mouse-wheel-in-tmux-screen.html)



    # byobu (byobu是tmux的再封装,安装之前要装scree/tmux中的一种)
        wget https://launchpad.net/byobu/trunk/5.57/+download/byobu_5.57.orig.tar.gz
        tar -zxvf byobu_5.57.orig.tar.gz
        cd byobu-5.57
        ./configure
        make && make install


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
            yum install ncurses-devel
            yum install htop
            # or 
            wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
            tar xvfz ncurses-5.9.tar.gz
            cd ncurses-5.9
            ./configure
            make
            make install
        # 安装htop
            yum install htop
        # or 
            wget http://sourceforge.net/projects/htop/files/htop/0.9/htop-0.9.tar.gz
            tar zxvf htop-0.9.tar.gz
            cd htop-0.9
            ./configure
            make
            make install
          
        # use 
            Shortcut    FunctionKey     Description                 中文说明
            h, ?            F1         Invoke htop Help             查看htop使用说明
            S                F2         Htop Setup Menu             htop 设定
            /                F3         Search for a Process         搜索进程
            \                F4         Incremental process filtering    增量进程过滤器
            t                F5         Tree View                     显示树形结构
            <, >            F6         Sort by a column             选择排序方式
            [                F7         Nice - (change priority)     可减少nice值，这样就可以提高对应进程的优先级
            ]                F8         Nice + (change priority)     可增加nice值，这样就可以降低对应进程的优先级
            k                F9         Kill a Process                 可对进程传递信号
            q                F10         Quit htop                     结束htop
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
        # 类似命令
            vmstat 1 
            iostat -k -x -d 5 3
            dstat -d 
            pidstat -d -p pid 
            rsync -参数 用户名@同步服务器的IP::rsyncd.conf中那个方括号里的内容 本地存放路径 如:
            rsync -avzP nemo@192.168.10.1::nemo /backup
        # problem 
            # yum install 后用不了报   File "/usr/bin/iotop", line 16, in ?
                # 解决办法
                    yum remove iotop
                    yum install python26
                    rpm -ivh http://guichaz.free.fr/iotop/files/iotop-0.4.1-1.noarch.rpm
                    vim /usr/bin/iotop
                      # edit first line #!/usr/bin/python 
                      #              to #!/usr/bin/python2.6
        
    # in (软链接)
            in -s /home/gamestat    /gamestat # linux下的软链接类似于windows下的快捷方式

        # 注意要写全路径，否则会出错
        # ln -s a b 中的 a 就是源文件，b是链接文件名,其作用是当进入b目录，实际上是链接进入了a目录
        
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

    # nagios 

    # nc (网络检测命令)
        nc -z -w2 10.28.39.41 3306   # 检测ip的端口是否通畅，不通不返回

    # pho 
        # get  pho soft 
            http://www.shallowsky.com/software/pho/
            http://www.shallowsky.com/software/pho/pho-0.9.8.tar.gz
        # tar 
            tar -zxf pho-0.9.8.tar.gz /tmp/soft
            cd /tmp/sfot/pho
            make 
            make install
        # use 
            pho xxx.jpg
        # key 
            <space> 查看下一张或退出
            <backspace> 上一张
            f    触发全屏模式
            F    触发实际大小模式
            k    打开关键字对话框
            p    切换到演示presentation模式
            t    向右旋转90度
            r    同上
            T    向左旋转90度
            R    同上
            l    同上
            L    同上
            +    放大一倍
            =    同上
            /    缩小一倍
            -    同上
            g    用GIMP打开当前图片（可更改）
            q    退出 

    # ps (进程管理)
        # use
            ps ax   # 查看所有进程
        # params (参数)
            -A  # 显示所有进程
            -N  # 显示与指定参数了不符的所有进程
            -a  # 显示除控制进程(session leader)和无终端的进程外的所有进程
            -e  # 显示所有进程

        # state(状态)
            # 基本
                S   # 睡眠
                SW  # 睡眠和等待
                R   # 运行中
                D   # 在等待磁盘
                T   # 被跟踪或被停止
                Z   # 僵进程
            # 附加状态
                W   # 进程被交换出去
                <   # 进程拥有比普通优先级更高的优先级
                N   # 进程拥有比普通优化级更低的优先级
                L   # 有些页面被锁在内存中
                s   # 进程是会话的先导进程

    # rsync
            # format    
                  rsync -参数 用户名@同步服务器的IP::rsyncd.conf中那个方括号里的内容 本地存放路径 如:
                  rsync -avzP nemo@192.168.10.1::nemo /backup

    # stat (查看文件修改状态)
        # use 
            stat /tmp/test.php
      # ttp 
        # install
        # ttp web (down load tpp-1.3.1.tar.gz)
            http://www.ngolde.de/tpp.html
            make & make install
            # ruby-devel
                    yum install ruby-devel
              # ncurses-ruby
            http://ftp.informatik.rwth-aachen.de/ftp/pub/Linux/debian/pool/main/n/ncurses-ruby/?C=N;O=D
                # install
                      ruby extconf.rb
                      make 
                      make install

        # use 
          --author 作者--title 标题--date today（可以自动插入当天日期），还可以加各种格式，例如%a表示星期，%b表示月份，%e表示日期，%H表示小时，%M表示分钟，%S表示秒，%Z表示时区，%Y表示年份。--heading 页面标题--exec bash命令--newpage 开始新页面文字下面加---暂停（一步一步显示）--beginoutput 开始文本框（可以用来显示代码）--endoutput 结束文本框--beginshelloutput 开始shell文本框（模拟shell输入输出）--endshelloutput 结束shell文本框
          --boldon 下面开始文本加粗
          --boldoff 结束文本加粗
          --revon 下面开始知道revoff文本反白
          --revoff 结束文本反白
          --ulon 开始文本下划线
          --uloff 结束文本下划线
          --huge 显示大的艺术字
          --sethugefont 设置艺术字字体， standard标准字体，block砖块字体
          --beginslideleft 下一行开始文本从左边进入，对应的还有right（从右边进入），top（从顶部进入），bottom（从底部进入）
          --endslideleft 结束
          --horline 在下一行画一条水平线
          --header 页眉
          --footer 页脚
          --center 文本居中
          --right 右对齐（默认左对齐）
          --bgcolor 背景色（例如red,blue,yellow）
          --color 设置文本颜色（直到出现新的color设置）
          --fontcolor 设置文本颜色（全局）

                    
    # fortune ( 运行这个命令的时候随机找一条谚语或信息)

    # skpye (in centos)
        http://wiki.centos.org/zh/HowTos/Skype

    # tail (显示文件末尾)
            tail -f /tmp/test.txt # 实时显示文件变化
        tail -n 10 /tmp/test.txt # 显示最后10 行
        tail -s 10 -f /tmp/test.txt # 10 秒更新一次


        # ttyrec
                # ttyrec是一个 tty 控制台录制程序，其所录制的数据文件可以使用与之配套的 ttyplay 播放。

    # w3m 
        # description : this is a web browser in command line 
        # use 

        # most use(最常用和最有用)
            s      # 打开缓存文件,enter进入，D 删除缓存
            ctrl+h # 打开历史记录
            U      # 进入url输入框 ctrl+p 切换到上一个历史
            ctrl+c # 取消操作
            T      # 添加标签
            H      # 打开操作帮助
            R      # 刷新
            u      # 显示光标下url
            Q      # 退出不确认
            I      # 查看光标下图片

        #页面操作
            SPC,C-v # 向下翻页
            b,ESC v # 向上翻页
            l,C-f   # 焦点向右
            h,C-b   # 焦点向左
            j,C-n   # 焦点向下
            k,C-p   # 焦点向上
            J       # 向下滚动一行
            K       # 向上滚动一行
            ^,C-a   # 到行首
            $,C-e   # 到行尾
            w       # 到下一个单词
            W       # 到上一个单词
            >       # 右移一屏
            <       # 左移一屏
            .       # 屏幕右移一列
            ,       # 屏幕左移一列
            g,M-<   # 到首行
            G,M->   # 到末行
            ESC g   # 到指定行
            Z       # 当前行居中
            z       # 当前列居中
            TAB     # 转到下个超链接
            C-u,ESC TAB # 到上个超链接
            [       # 到第一个超链接
            ]       # 到最後一个超链接

        # 超链接操作
            RET  # 打开超链接
            a, ESC RET # 链接另存为
            u     # 查看链接url
            i     # 查看图片url
            I     # 查看图片
            ESC I # 图片另存为
            :     # 标记rul字符串为锚点
            ESC : # 标记ID串为锚点
            c     # 查看当前页面的URL
            =     # 显示当前页面属性
            C-g   # 查看当前行号
            C-h   # 查看历史记录
            F     # 提交表单
            M     # 用外部浏览器打开当前页面 (use 2M and 3M to invoke second and third browser)
            ESC M # 用外部浏览器打开链接 ( use 2ESC M and 3ESC M to invoke second and third browser)

        # 文件/流 操作

            U # 打开URL
            V # 打开文件
            @ # 执行外部命令并导入
            # 执行外部命令并浏览

        # 缓存操作

            B # 返回
            v # 查看源代码
            s # 选择缓存
            E # 编辑缓存代码
            C-l #  重画屏幕
            R # 刷新
            S # 页面另存为
            ESC s # 源码另存为
            ESC e # 编辑图片

        #  缓存选择模式（也就是按了s以後）

            k, C-p # 上一缓存
            j, C-n # 下一缓存
            D      # 删除当前缓存
            RET    # 转至选择的缓存

        #  书签操作

            ESC b  # 打开书签
            ESC a  # 添加当前页到书签

        # 搜索

            /,C-s # 向前搜索
            ?,C-r # 向後搜索
            n     # 下一个
            N     # 上一个
            C-w   # 打开/关闭 循环搜索

        # 标记

            C-SPC # 设定/取消 标记（好像这个键一般被输入法占用了）
            ESC p # 转至上一标记
            ESC n # 转至下一标记
            使用正则表达式标记

        # 杂项

            ! # 执行外部命令
            H # 帮助
            o # 设置选项  ******
                # 找到相应选项后按enter即可变更选项
                # 配置tips 
                    1. 用/找到cookie项，关闭可提高访问速度
                    
            C-k # 显示接受到的cookie
            C-c # 终止
            C-z # 挂起（输入jobs命令可以列出被停止运行的进程及编号， 运行命令bg %进程编号可将进程转为后台运行， fg %进程号将进程转向前台进行）
            q   # 退出（需确认）
            Q   # 退出而不确认

        # 行编辑模式

            C-f   # 光标向後
            C-b   # 光标向前
            C-h   # 删除前一字符
            C-d   # 删除当前字符
            C-k   # 删除光标後所有内容
            C-u   # 删除光标前所有内容
            C-a   # 光标到行首
            C-e   # 光标到行尾
            C-p   # 取得历史记录中的前一个词
            C-n   # 取得历史记录中的後一个词
            TAB,SPC # 自动完成文件名
            RETURN # 确定

    # wine
        # install    
            # depend
                yum install alsa-lib-devel cups-devel dbus-devel esound-devel fontconfig-devel freetype-devel giflib-devel hal-devel isdn4k-utils-devel lcms-devel libICE-devel libjpeg-devel libpng-devel libSM-devel libusb-devel libX11-devel libXau-devel libXcomposite-devel libXcursor-devel libXext-devel libXi-devel libXinerama-devel libxml2-devel libXrandr-devel libXrender-devel libxslt-devel libXt-devel libXv-devel libXxf86vm-devel mesa-libGL-devel ncurses-devel openldap-devel openssl-devel pkgconfig sane-backends-devel xorg-x11-proto-devel gnutls openal-soft-devel gsm-devel libv4l-devel openal-soft-devel gcc flex bison git cabextract wget
            # get wine-1.7.36.tar.bz2
                tar zxvf wine-1.7.36.tar.bz2
                cd wine-1.7.36.tar.bz2
                ./configure
                make && make install
            
        # use 
            wine /home/soft/xx.exe

    # wireshark
        # install 
            yum install wireshark
            yum install wireshark-gnome
            yum install gtk* 

        # windows x use 
            wireshark # open the wireshark

        # command line use  (tshark)
            # learn web 
                http://blog.sina.com.cn/s/blog_6fb8aaeb0100ohm8.html
                http://wenku.baidu.com/link?url=3qCrG-qG-iod4Y5b_c4d7ELQOoVAnkgkRSDUZItf_UCAgM7be-B6mespQabLHBzmOOQ2HomKBpFVJ4lKoK7K9RbUzvCGBtRBJa--x84zpfe
            # command     
                tshark -D        # 查看可抓包网卡或usb设备
                tshark i 1 -c 2000 | grep ping   # 抓取实时的ping 包2000个
                tshark -i 1 -c 2000 -f "tcp dst port 443" # 捕获tcp端口为443,捕获2000个
                tshark -i eth4 -c 20 -f "ip src host 192.168.1.130" > /tmp/cap.txt # 捕获ip 为192.168.168.1.130 的包20个后存到/tmp/cap.txt 后退出
                tshark -i eth4 -c 20 -f "not icmp" # 捕获排除icmp的包
                tshark -i eth4 -c 20 -f "src host 10.7.2.12 and not dst net 10.200.0.0/16" # 显示来源IP地址为10.7.2.12，但目的地不是10.200.0.0/16的封包。
                tshark -i eth4 -c 20 -f "(src host 10.4.1.12 or src net 10.6.0.0/16) and tcp dst portrange 200-10000 and dst net 10.0.0.0/8" 
                #显示来源IP为10.4.1.12或者来源网络为10.6.0.0/16，目的地TCP端口号在200至10000之间，并且目的位于网络10.0.0.0/8内的所有封包。 
            # windows x use 

            # filter
                ip.src == 192.168.0.1  #　过源为192.168.0.1
                ip.dst == 192.168.0.1  # 　
                ip.addr == 192.168.0.1 # 包含 src dst
                tcp.port == 80         # 过滤端口为80的
                udp.port >= 80         # 过滤端口为80的
                udp.length < 30   http.content_length <=20
                http.request.uri matches "vipscu"  （匹配http请求中含有vipscu字段的请求信息）
                ip.src ==192.168.1.130 and icmp  # 过滤ip为192.168.1.130 为icmp的包

        # wubi (极点五笔安装) ******
                # web
                        http://www.centoscn.com/image-text/install/2015/0704/5790.html
                # install 
                        yum remove ibus    
                        yum install ibus ibus-table 
                        yum install ibus ibus-table-wubi   
                        # 然后在面版中选中

        # 单字词组输入切换
            ctrl+,   

        # xclip 
                # copy file to clipbord(用命令复制文件内容到剪贴版)
                # install 
                        yum install xclip
                        cat /tmp/file.txt | xclip -selection clipboard   # 到了这步已经将内容复制到剪贴版
                        # past
            
        # zabbix (基于web的分布式监控系统)
                # install
                      # get 
                              wget http://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/2.0.6/zabbix-2.0.6.tar.gz/download 
                              wget http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.2.6/zabbix-2.2.6.tar.gz
                      # envirement
                              yum -y install net-snmp net-snmp-devel perl-DBI php-gd php-xml php-bcmath fping OpenIPMI-devel php-mbstring
                      # learn 
                              http://blog.chinaunix.net/uid-24250828-id-3758077.html

        # use 
            # web 
                http://waringid.blog.51cto.com/65148/955939/
                http://nanwangting.blog.51cto.com/608135/641811
            # 邮件服务报警
                http://www.2cto.com/os/201405/304381.html
        # default
            #default 
            # cms
                user     : admin
                password : zabbix
            # database 
                user    : zabbix
                password: zabbix123
                database: zabbix
    
      # zsh  (linux下装X利器之一)
        # install 
            # web
                http://www.ha97.com/book/OpenSource_Guide/ch30s04.html # 开源世界旅行手册
            # zsh
                yum install zsh
                wget http://sourceforge.net/projects/zsh/files/zsh/5.0.2/zsh-5.0.2.tar.bz2/download && tar xv} zsh-5.0.2.tar.bz2 && cd zsh-5.0.2
                ./configure && make && sudo make install
                echo "/usr/local/bin/zsh" | tee -a /etc/shells # 将zsh设为默认shell
                whereis zsh  # 查看zsh路径
                chsh -s /bin/zsh  #  /bin/zsh为whereis 查找后的路径(更换其他shell方法同理)
            # oh my zsh
                # install
                    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        # use 
            # 简化短路径跳转
                cd /v/w/f/tab
            # 错误自动提示
            # 直接kill程序
                # ps aux | grep xxx查进程的 PID，然后kill PID。有了 zsh，
                kill xxx     # 然后按下 tab 键即可～
                kill emacs   # 按下 tab，变成：kill 59683  eus e 
            # 支持针对文件类型的 alias
                alias -s php='vim'   # 让php后缀的文件自动用vim打开
                alias -s gz='tar -xzvf'  #  gz后缀的文件直接打开解压
                alias -s gz='tar -xzvf'
                alias -s tgz='tar -xzvf'
                alias -s zip='unzip'
                alias -s bz2='tar -xjvf'
                alias -s py='vim'
                alias -s rb='vim'
                alias -s html='vim'
                alias gcid="git log | head -1 | awk '{print substr(\$2,1,7)}' | pbcopy"
                # gcid将当前 git 项目的第一个 commit 的 id 复制到系统剪切板（pbcopy是 Mac 下的复制到系统剪切板命令，linux 请参考相应的发行版更改），在执行 rebase 的时候特别方便。
            # 通配符搜索
                ls *.png       # 查找当前目录下所有 png 文件，
                ls **/*.png  # 递归查找。
            # 切换shell
                /bin/bash # 切换到bash shell
                /bin/zsh # 切换到zsh shell 或重新加载zsh
        # config(配置)
            # ~/.zshrc
              # 显示时间    
                    PROMPT 加%T%
                
