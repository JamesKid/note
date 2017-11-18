ll /dev/disk/by-path   # 列出所有磁盘
fdisk /dev/sdb         # 格式化磁盘
n p 1 p w              # 
mkfs.ext4 /dev/sdb1    # 创建分区
mkdir /work
mount /dev/sdb1 /work 
