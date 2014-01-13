#==============================================================
# Description:  this note is about 鸟哥的linux私房菜
# Editor:       JamesKid 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2014-01-13 creat JamesKid
#				2014_01_13 add chapter 14 (see page 501)
#==============================================================
# 第十四章
	# command	
		# user
			# add 
				useradd vbird1	# add user vbird1, it will add home (700),add group ,add /etc/shadow,
								# add /etc/passswd
				useradd -u 700 -g users vibrd2
				useradd -r vbird3 # it will not add home directory
			# password
				passwd vbird2	# add password to vbird2
				passwd			# change current user's password
				passwd -S vbird1 # show vbird1's password setting
				chage -l vbird1	 # shoe the vbird1's detail setting
			# usermod	
				usermod -c "VBird's test" vbird1	# add vbird1 imformation to /etc/passwd
				usermod -e "2009-12-31" vbird1		# add failure time
			# del 
				userdel -r vbird1	# delete user and home directory
			# user's datapath
				/etc/passwd,/etc/shadow
				/etc/group,/etc/gshadow
				/home/username,/var/spool/mail/username..
		# group
			# add 
				groupadd group1	# add group one 
			# modify
				groupmod -g 201 -n mygroup group1	# change group1 to mygroupt and gid to 201
			# del
				groupdel mygroup # delete mygroup group

		# other
			head -n 4 /etc/passwd	# show the first four line
			groups	# show the current user's group
			finger	vbird1	# show the vbird1's finger information
			id		# show current user's id information
			id vbird1	# show the vbird1's id information
	# path
		# path of mailbox
			/var/spool/mail			# path of all mailbox 
			/var/spool/mail/vbird1	# path of vbird1 mailbox
		# path about useradd
			/etc/default/useradd
			/etc/login.defs
			/etc/skel/*

	# file format
		# /etc/passwd
			# format
				1:2:3:4:5:6:7:8
			# sign
				1:	username
				2:	password	# you will always see 'x' there,means password in the file /etc/shdow
				3:	UID			# when UID = 0 then means it have the root authority
				4:	GID			# it relate to /etc/group like /etc/passwd
				5:	user message # it is about the user's message
				6:	home directory 
				7:	shell path
			# exp
				root:x:0:0:root:/root:/bin/bash

		# /etc/shadow
			# format
				1:2:3:4:5:6:7
			# sign
				1:	username
				2:	password
				3:	password latest changes date	# from 1970.1.1 to change
											# you can use echo $(($date --date="2008/09/04"+%s)/86400+1)) 
											# to count 
				4:	password can not change day # 0 means you can change it anytime ,if you set it 20,
												# means you
												# can not change it in 20 days
				5:	how long you need to change passowrd	# deault 99999 is 273 year
				6:	password change note day	# tell user change the password before days
				7:	password endline grace time  # when in enline time how long user can use it 
				8:	password can not use date	# fater the date you set ,the user can't not be used 
				9:	retain
			# exp
				root:$6$AgMtVzcK$FNfc0g8AXqiKsq6TYXlODRCFG77e3pd.
				nlFpxDOfXd8HO3KBF7murJnYVHhWiQ1ttKuVHF173vrQtOseHyywS/:16074:0:99999:7:::
			# if you forgot your root password
				# you can go to the system with single mode ,then make the /etc/shadow 's root 
				# password to null 
				# then you can reboot with root without password 

		# /etc/group
			# format
				1:2:3:4
			# sign
				1:	group name
				2:	group password	# the password is in /etc/gshadow so it default value is x
				3:	group id 
				4:	group member
			# exp
				root:x:0:root
				daemon:x:2:root,bin,daemon


