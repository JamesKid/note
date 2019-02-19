# cpu info 
	cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
	cat /proc/cpuinfo  # detail
# memory info
	grep MemTotal /proc/meminfo
