启动顺序
POST(加电自检)-->BIOS(Boot Sequence)-->MBR(bootloader，446)-->Kernel-->initrd(initramfs)-->(ROOTFS)-->/sbin/init(/etc/inittab)
RedHat5：ramdisk-->initrd
	硬件驱动：initrd
		initrd：仅需要提供内核访问真正的根文件系统所在设备的驱动存储设备和文件系统相关的模块
		rc.sysinit：系统初始化，初始化其它硬件的驱动程序。
RedHat6：ramfs-->initramfs
启动的服务级别：/etc/inittab
	运行级别：0-6
		0：halt
		1：single user mode，直接以管理员身份进入
		2：multi user mode，no NFS
		3：multi user mode，text mode
		4：reserved
		5：multi user mode，graphic mode
		6：reboot
内核设计风格
RedHat，SUSE
核心：动态加载内核模块/boot/vmlinuz-version
内核：/lib/modules/'内核版本目录'/vmlinuz-版本
用户空间访问、监控内核的方式
/proc /sys：伪文件系统，此目录的文件大多是可读写的
/sys/：某些文件可写
设定内核参数的方法：能立即生效，但无法永久保存
echo value > /proc/sys/to/somefile
sysctl -w kernel.hostname=
永久有效，但不能立即生效：编辑/etc/sysctl.conf
sysctl -p：通知内核重新读取内核参数
sysctl -a：显示所有的内核参数
模块：/lib/modules/version
内核模块管理：
列出当前内核中装载的模块：lsmod
装载模块：modprobe MOD_NAME、insmod /path/to/modules
卸载模块：modprobe -r MOD_NAME、rmmod MOD_NAME
查看模块相关信息：modinfo MOD_NAME
生成模块依赖关系：depmod /path/to/modules_dir
内核中的功能除了核心功能之外，在编译时，大多数功能都有三种选择：
(1)、不使用此功能
(2)、编译成内核模块
(3)、编译进内核
如何手动编译内核：
make gconfig：Gnome桌面环境使用，需要安装图形开发库组：GNOME Software Development
make kconfig：KDE桌面环境使用，需要安装图形开发库组：KDE Software Development
make menuconfig：启动菜单安装界面
复制/boot/config-2.6.32-279.el6.x86_64 到需要编译的内核下
(1)、cp /boot/config-2.6.32-279.el6.x86_64 /usr/src/linux/.config
(2)、make
	如何实现部分编译：
	只编译某子目录下的相关代码
	make dir/  make arch/x86
	make arch/x86/boot/bzImage
	只编译部分模块
	make M=drivers/net
	只编译某一模块
	make drivers/net/pcnet32.ko
	将编译完成的结果放置于别的目录中
	make O=/tmp/kerner
(3)、make modules_install
(4)、make install
screen命令：
screen -ls：显示已经建立的屏幕
screen：直接打开一个新的屏幕
ctrl+a，d：拆除屏幕
screen -r ID：还原回某个屏幕
二次编译时清理，请先备份配置文件.config：
make clean
make mrproper
生成initrd或者initramfs归档文件：
mkinitrd initrd路径 内核版本号
mkinitrd /boot/initrd-`uname -r` `uname -r`
如何将编译好的内核组装为操作系统
大致过程：grub-->kernel-->initrd-->ROOTFS(/sbin/init，/bin/bash)
(1)、增加硬盘，划分两个主分区，创建两个挂载点（/mnt/boot/--存放启动文件/mnt/sysroot/存放相关文件），挂载分区
	fdisk /dev/sdc-->n(p)-->mke2fs-->mkdir(/mnt/boot,/mnt/sysroot)-->mount
(2)、安装grub引导到硬盘第一个分区上
	grub-install --root-directory=/mnt /dev/sdc
	ls /mnt/boot/grub/
(3)、复制编译好的内核文件到/mnt/boot/vmlinuz/目录中
	cp /boot/vmlinuz-2.6.38.6 /mnt/boot/vmlinuz
(4)、解压initrd或者initramfs，修改相关配置，并重新打包
	cp ./initramfs-2.6.38.6.img /root/
	展开：
		方法1、
		mv initramfs-2.6.38.6.img initramfs-2.6.38.6.img.gz
		gzip -d initramfs-2.6.38.6.img.gz
		file initramfs-2.6.38.6.img
		mkdir myInit-->cd myInit/
		cpio -id < ../initramfs-2.6.38.6.img
		方法2、
		mkdir myInit-->cd myInit/
		zcat /boot/initramfs-2.6.38.6.img | cpio -id
(5)、修改相关脚本，并重新打包(etc/fstab)
	file init
	find . | cpio -H newc --quiet -o | gzip -9 > /mnt/boot/initrd.gz
(6)、手动增加一个grub配置文件grub.conf
	find (hd0,0)/
	root (hd0,0)
	kernel /vmlinuz
	initrd /initramfs-2.6.38.6.img
(7)、创建/mnt/sysroot/下的相关目录
	mkdir proc sys dev etc/rc.d lib lib64 bin sbin boot home var/log usr{bin,sbin} root tmp -pv
(8)、复制相关的文件到对应的目录（相关程序依赖的库文件也需要复制）
	[root@localhost sysroot]# cp /sbin/init /mnt/sysroot/sbin/
	[root@localhost sysroot]# cp /bin/bash /mnt/sysroot/bin/
	[root@localhost sysroot]# ldd /sbin/init
	        linux-vdso.so.1 =>  (0x00007fff907ff000)
	        libnih.so.1 => /lib64/libnih.so.1 (0x00007fb247982000)
	        libnih-dbus.so.1 => /lib64/libnih-dbus.so.1 (0x00007fb247778000)
	        libdbus-1.so.3 => /lib64/libdbus-1.so.3 (0x00007fb247536000)
	        libpthread.so.0 => /lib64/libpthread.so.0 (0x00007fb247319000)
	        librt.so.1 => /lib64/librt.so.1 (0x00007fb247111000)
	        libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007fb246efa000)
	        libc.so.6 => /lib64/libc.so.6 (0x00007fb246b66000)
	        /lib64/ld-linux-x86-64.so.2 (0x0000003861200000)
	[root@localhost sysroot]# cp /lib64/libnih.so.1 /mnt/sysroot/lib64/
	[root@localhost sysroot]# cp /lib64/libnih-dbus.so.1 /mnt/sysroot/lib64/
	[root@localhost sysroot]# cp /lib64/libdbus-1.so.3 /mnt/sysroot/lib64/  
	[root@localhost sysroot]# cp /lib64/libpthread.so.0 /mnt/sysroot/lib64/
	[root@localhost sysroot]# cp /lib64/librt.so.1 /mnt/sysroot/lib64/     
	[root@localhost sysroot]# cp /lib64/libgcc_s.so.1 /mnt/sysroot/lib64/
	[root@localhost sysroot]# cp /lib64/libc.so.6 /mnt/sysroot/lib64/    
	[root@localhost sysroot]# cp /lib64/ld-linux-x86-64.so.2 /mnt/sysroot/lib64/
	[root@localhost sysroot]# ldd /bin/bash 
	        linux-vdso.so.1 =>  (0x00007fffaedee000)
	        libtinfo.so.5 => /lib64/libtinfo.so.5 (0x0000003863600000)
	        libdl.so.2 => /lib64/libdl.so.2 (0x0000003861a00000)
	        libc.so.6 => /lib64/libc.so.6 (0x0000003861600000)
	        /lib64/ld-linux-x86-64.so.2 (0x0000003861200000)
	[root@localhost sysroot]# cp /lib64/libtinfo.so.5 /mnt/sysroot/lib64/       
	[root@localhost sysroot]# cp /lib64/libdl.so.2 /mnt/sysroot/lib64/ 
	[root@localhost sysroot]# chroot /mnt/sysroot/
	bash-4.1# ls
	bash: ls: command not found
	bash-4.1# exit
	cp /etc/inittab ./etc/
3、详解启动过程
bootloader（MBR）
	LILO：Linux Loader(不支持大分区，嵌入式很适用)
	GRUB：Grand Unified Bootloader
		Stage1：MBR-->引导第二阶段
		Stage1_5
		Stage2：/boot/grub/
#boot=/dev/sda
default=0 #设定默认启动的title编号
timeout=5 #等待用户选择的超时时长(s)
splashimage=(hd0,0)/grub/splash.xpm.gz #指定grub的背景图片
hiddenmenu #隐藏菜单
title Red Hat Enterprise Linux (2.6.32-279.el6.x86_64) #内核标题或操作系统标题，可自由修改
        root (hd0,0) #内核文件所在的设备，对grub所有类型的硬盘一律为hd，hd#表示第几块磁盘，最后的数字表示对应磁盘的分区
        kernel /vmlinuz-2.6.32-279.el6.x86_64 ro root=/dev/mapper/VolGroup-lv_root rd_NO_LUKS LANG=en_US.UTF-8 rd_NO_MD rd_LVM_LV=VolGroup/lv_swap SYSFONT=latarcyrheb-sun16 crashkernel=auto rd_LVM_LV=VolGroup/lv_root  KEYBOARDTYPE=pc KEYTABLE=us rd_NO_DM rhgb quiet #内核文件路径及传递给内核的参数 
        initrd /initramfs-2.6.32-279.el6.x86_64.img #ramdisk文件路径
kernel初始过程：
	(1)、设备探测
	(2)、驱动初始化（可能会从initrd(initramfs)文件中装载驱动模块
	(3)、以只读挂载根文件系统
	(4)、装载第一个进程init（pid：1）
	/sbin/init-->（/etc/inittab）
		upstart(redhat6)：ubuntu，d-bus，event-driver
			/etc/inittab
			/etc/init/*.conf
		systemd
/etc/inittab配置文件格式相关信息
	格式：id：runlevels：action：process
	id：标识符
	runlevels：在哪个级别运行此行
	action：在什么情况下执行此行
		innitdefault：设定默认运行级别
		sysinit：系统初始化
		wait：等待级别切换至此级别时执行
		respawn：一旦程序终止，会重新启动
	process：要运行的程序
/etc/inittab完成的任务：
	(1)、设定默认运行级别
	(2)、运行系统初始化脚本(/etc/rc.d/rc.sysint)
	(3)、运行指定运行级别对应的目录下的服务脚本
	/etc/rc.d/init.d/
		/etc/rc.d/rc#.d(rc0.d--rc6.d)
			K*(*为00-99 代表运行次序)
			S*
	服务类脚本：
		sysv：/etc/rc.d/init.d
			start|stop|restart|status
			reload|configtest
	chkconfig：创建服务脚本链接
	# chkconfig： runlevels SS KK
		当chkconfig命令来为此脚本在rc#.d目录创建链接时，runlevels表示默认创建为S*开头的链接，除此之外默认创建为K*开头的链接
		S后面启动优先级为SS表示的数字，k后面启动的优先级为KK表示的数字
	# description： 用于说明此脚本的简单功能
	chkconfig --list：查看独立守护服务的启动设定，独立守护进程
		chkconfig --list SERVER_NAME
	chkconfig --add：增加服务
		chkconfig --add SERVER_NAME
	chkconfig --del：删除服务
		chkconfig --del SERVER_NAME
	chkconfig --level：制定运行级别
		chkconfig --level RUNLEVELS SERVER_NAME {on|off}
	/etc/rc.d/rc.local:系统最后一个启动的脚本
	(4)、设定组合键的操作
	(5)、定义UPS电源在电源故障/恢复时的执行操作
	(6)、启动虚拟终端(2345级别)
	(7)、启动图形终端(5级别)
/etc/rc.d/rc.sysinit完成的任务：
	(1)、激活udev和selinux
	(2)、根据/etc/sysctl.conf文件，来设定内核参数
	(3)、设定系统时钟
	(4)、装载键盘映射
	(5)、启用交换分区
	(6)、设置主机名
	(7)、根据文件系统检测，并以读写方式重新挂载
	(8)、激活RAID和LVM设备
	(9)、启用磁盘配额
	(10)、根据/etc/fstab，检查并挂载其它文件系统
	(11)、清理过期的锁和PID文件
3、查看内核运行级别
runlevel或者who -r
4、如何修复grub
	4.1、输入grub命令
		进入紧急救援模式：linux rescue
		grub>find (hd0,0)/
		grub>root (hd0,0)
		grub>setup (hd0)
	4.2、安装grub到另外一块硬盘上
		(1)、创建分区
		(2)、格式化分区
		(3)、挂载分区
		(4)、安装grub
		grub-install --root-directory=/mnt /dev/sda
5、在grub配置文件丢失情况下如何启动系统
grub>find (hd0,0)/
grub>root (hd0,0)
grub>kernel /path
grub>initrd /path
grub>boot
