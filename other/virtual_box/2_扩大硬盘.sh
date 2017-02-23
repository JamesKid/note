# virtualbox  添加硬盘,添加磁盘,centos扩大容量

  1.  设置-> storage -> sata控制器 -> 右击-> 添加虚拟硬盘
  2.  fdisk -l    # 查看
  3.  fdisk /dev/sdb   
  4.  command (m for help):m    # 键入m,可看到帮助信息 
  5.  command (m for help):n    # 添加新分区
  6.  Partition number(1-4):1  # 建立一个分区
  7.  First cylinder (1-15908,default 1):Enter 
  8.  command (m for help):w    # 写入并退出
  9.  sudo mkdir /work      # 创建挂载点
  10. sudo mount -t ext4 /dev/sdb1 /work   # 将新磁盘分区挂载到/work目录下 
  11. df -h   # 查看挂载
  12. vim  sudo vim /etc/fstab   # 后面加入下面行
           /dev/sdb1 /work ext4 errors=remount-ro 0 1   # 开机自动挂载
