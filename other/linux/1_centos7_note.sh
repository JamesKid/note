#  ================================JamesKid============================== 
# @author				: JamesKid  
# @description :  this is note about pure centos7,(tips: centos6 may not use)
# @change				:
# ======================================================================

# install 
		# double system (安装双系统)
				# web 
            http://wenku.baidu.com/link?url=VW3Xfubd3Cvhzzziq9a8m-j5r_V0CNv97tOKOVDRFCKOOX6zrq98buTO519XRBdO49P2gqAwnd37MHJl65P7UD3uz_8SYHdtIg4Y4-zEHeG

				# tips 
				    The filesystem format mast be fat32, NTFS can not be check 	

        # detail 
            
# use 
		# fix resolution ratio (修改分辨率)
				# web 
				    http://jingyan.baidu.com/article/2c8c281dad52af0008252adc.html
        # detail 
            vim /boot/groub2/grub.cfg  
                # find linux16 /vmlinux-3.10.  and add 'vga=ask' after this line
                linux16 /vmlinuz-3.10.0-229.11.1.el7.x86_64 root=/dev/mapper/centos-root ro rd.lvm.lv=centos/root rd.lvm.lv=centos/swap crashkernel=auto rhgb quiet.utf8 vga=ask 
            shutdown -r now 
            press ENTER when reboot (重启后进入到选择界面时，按下ENTER) # then input the resolution Sign
            vim /boot/groub2/grub.cfg  
                linux16 /vmlinuz-3.10.0-229.11.1.el7.x86_64 root=/dev/mapper/centos-root ro rd.lvm.lv=centos/root rd.lvm.lv=centos/swap crashkernel=auto rhgb quiet.utf8 vga=32A # 32A is resolution Sign you just select 这里改成上面选的标识,就可以开机自动使用该分辨率






