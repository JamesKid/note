# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : use  " cat linux_server_script | grep '#001' | /bin/bash  来执行
# @change		:
# ======================================================================
	# find ip who use ssh password fail and times 
		cat /var/log/secure | awk '/Failed/{print $(NF-3)}' | sort | uniq -c | awk '{print $2" = "$1;}'  #001 find paddword fail in ssh  from /secure

	# find latest Failed password limit 100 line
		cat /var/log/secure | grep 'Failed password' | tail -n 100  #002

