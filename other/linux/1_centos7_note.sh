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
            
				    1. The filesystem format mast be fat32, NTFS can not be check 	
            2. 有的时候，读者会发现，在更新CentOS7之后，Windows7的引导项又没有了，没有关系。那是因为CentOS更新后，修改了grub.cfg这个文件。只要进CentOS7重新修改grub.cfg这个文件即可。比方作者出现这个问题时，“menuentry 'Windows 7 64_Bit' {”这句在更新后，后面多了一个“’”单引号这样的错误，去掉这个单引号，系统引导项正常。

        # detail 
            # fix grub ( 修改主引导记录)
                # reboot press 'C' , into grub2 ,and press 'ls -l' to show windows7's position
                # and you can find the position is (hd0,msdos1)

                vim /boot/groub2/grub.cfg # add under content
                    menuentry 'Windows 7 64_Bit' { 
                        insmod chain 
                        insmod ntfs 
                        set root=(hd0,msdos1)   # the disk area find by 'ls -l' before 
                        chainloader +1 
                    }
            
# use 
		# fix resolution ratio (修改分辨率)
				# web 
				    http://jingyan.baidu.com/article/2c8c281dad52af0008252adc.html
        # detail 
            vim /boot/grub2/grub.cfg  
                # find linux16 /vmlinux-3.10.  and add 'vga=ask' after this line
                linux16 /vmlinuz-3.10.0-229.11.1.el7.x86_64 root=/dev/mapper/centos-root ro rd.lvm.lv=centos/root rd.lvm.lv=centos/swap crashkernel=auto rhgb quiet.utf8 vga=ask 
            shutdown -r now 
            press ENTER when reboot (重启后进入到选择界面时，按下ENTER) # then input the resolution Sign
            vim /boot/groub2/grub.cfg  
                linux16 /vmlinuz-3.10.0-229.11.1.el7.x86_64 root=/dev/mapper/centos-root ro rd.lvm.lv=centos/root rd.lvm.lv=centos/swap crashkernel=auto rhgb quiet.utf8 vga=32A # 32A is resolution Sign you just select 这里改成上面选的标识,就可以开机自动使用该分辨率






