# here the note of linux from the world wide web

	1.tree
			# description
				this command can show the trees of the directory in the linux, 
				you need to use "yum install tree" to install this in centos.

			# exp:
				tree			# show tree directilly 
				tree --help		# show tree's command help
				tree -N			# show tree's allow chinese language
				tree -L 1		# just show the first level directory
				tree -L 2		# just show two level directory 
	2.yum	
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
	3.rewrite root password
			# 1. when system power on ,press esc
			# 2. chose "kernel xxxxx" and then press "e" in keybord
			# 3. then you will see quiet ,and put " 1" after it ,then press enter
			# 4. press "b" button to reboot
			# 5. then input "passwd root" to reset you password
			# 6l. input "init 5 " to go back to the X window



				








