#===================================================================
#!/bin/bash 
# Description:  this program  is the linux note from internet
# Editor:       zhangshijie 
# Email:		406358964@qq.com 
# Version:      1.0 
# History:      2014-01-16 creat zsj
#               2014-01-16 add path
#===================================================================
# command
	# tree
			# description
				this command can show the trees of the directory in the linux, 
				you need to use "yum install tree" to install this in centos.

			# exp:
				tree			# show tree directilly 
				tree --help		# show tree's command help
				tree -N			# show tree's allow chinese language
				tree -L 1		# just show the first level directory
				tree -L 2		# just show two level directory 
	# yum	
			# des:
				this command can manage the soft
			# exp:
				yum install XXX     # install package
				yum search XX	    # search the package
				yum list	  	    # list all the can install package
				yum list updates    # list all the package that can update
				yum list installed  # list all the installed package
				yum list extras     # list all not in yum repository's package
				yum remove XXX      # remove package
				yum list XXX        # list xxx package
				yum info		    # show the package's information
				yum info updates    # show the the update information
				yum info installed  # show installed information
				yum provides        # list at the package include
				yum clean packages  # clean the /var/cache/yum 's package
				yum clean headers   # clean the /var/cache/yum 's headers
				yum clean oldheaders # clean the /var/cache/yum 's old headers
				yum update			# update the system
				yum deplist XXX     # check the dependency 
				yum -y install php  # install php with no asking
	# rewrite root password
			# 1. when system power on ,press esc
			# 2. chose "kernel xxxxx" and then press "e" in keybord
			# 3. then you will see quiet ,and put " 1" after it ,then press enter
			# 4. press "b" button to reboot
			# 5. then input "passwd root" to reset you password
			# 6l. input "init 5 " to go back to the X window
	
	# netstat	
				netstat -atn     # show the connet station in linux
	# grep	
		# grep  line before and after
			grep -5 'pattern' inputfile    # output before and after 5 line
			grep -C 5 'pattern' inputfile  # output before and after 5 line
			grep -A 5 'pattern' inputfile  # output after 5 line 
			grep -B 5 'pattern' inputfile  # output before 5 line
	# free 
		# check the free memory
			free -m
# system setting
	# close selinux
		vim /etc/selinux/config # set SELINUX=enforcing to disabled
# path
	# path of bashrc
		/root/.bashrc
	# iptables path 
		/etc/sysconfig/iptables
	# path of enviroment
		/etc/profile
		# tips
		# you can write the under two line to add envirement
		PATH=/usr/local/firefox:$PATH
		export PATH
		# then use 'source /etc/profile' to reload this file




				








