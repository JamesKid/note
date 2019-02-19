# web 
    http://os.51cto.com/art/201610/519291.htm
# install step
    # 1. 下载centos7-dvd镜像
    # 2. 下载utrliso
    # 3. windows上点击 我的电脑->管理->计算机管理->存储->磁盘管理
    # 4. 选一个空间大的几个盘,进行压缩,压缩出的新分区，不要执行 [新建简单卷]，否则稍后 CentOS 不识别
    # 5. 将centos7-dvd.iso写入u盘
    # 6. boot以usb启动 
    # 7. CentOS 7 的黑白界面：按tab
        vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=CentOSx207x20x86_64 rd.live.check quiet # 改为
        vmlinuz initrd=initrd.img linux dd quiet
    # 8. 确认无误后回车,
        # 界面下方有4列，分别是 DEVICE 、 TYPE 、 LABEL 和 UUID，LABEL 这一列就是驱动器名称，据此找到你的优盘，并记下对应 DEVICE 列的值，一般是 sdb4 。
    # 9. 强制重启
    # 10. 按tab ,sdb4根据刚才查出的为准
        vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=CentOSx207x20x86_64 rd.live.check quiet # 改为
        vmlinuz initrd=initrd.img inst.stage2=hd:/dev/sdb4 rd.live.check quiet
    # 11. 选择gnome桌面
    # 12. 这步非常重要!!!!!!!!!!
        1.点击 SYSTEM 下的 INSTALLATION DESTINATION 选择安装位置
        2. 选中那个新分区，并选中 Other Storage Options → Partitioning 下的 I will configure partitioning 选项，切记，一定要选中此项，否则整个硬盘的数据都将被删除!!!
        3. 点Done
        4. 点击 Click here to create them automatically 即可让安装程序自动创建分区
    # 13.  添加root密码和一个其他用户
    # 14. 找回win10启动项
       # 参考网站
          http://blog.csdn.net/hsg77/article/details/50280085
       # 添加源
          wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo  
       # install
          yum update;yum install -y ntfs-3g
          yum install -y ntfs-3g


            
