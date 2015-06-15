# ================================JamesKid============================== 
# @author		: JamesKid  
# @description :
# @change		:
# ======================================================================
	# find ip who use ssh password fail and times 
		cat /var/log/secure | awk '/Failed/{print $(NF-3)}' | sort | uniq -c | awk '{print $2" = "$1;}'  #001 find paddword fail in ssh  from /secure
