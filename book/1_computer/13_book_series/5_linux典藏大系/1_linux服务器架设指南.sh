# bookname:			linux 服务器架设指南
# date:				2013.12.19
# format:			in the ' ', means description


# 第一章 预备知识
		sysctl (p76)
				'show the kernal parameter ,or fixed the kernal parameter'
				# exp:	
					sysctl -a |more		# show all kernal parameter,about 500 parameter
					sysctl -n kernel.hostname     # show the hostname
					sysctl -w kernel.hostname="example.com"		# fixed the hostname to example.com
				# other:
					echo "myhost.com"> /proc/sys/kernel/hostname		# change host name to "myhost.com"

# 第五章 linux网络管理与故障诊断
		cat /etc/services (p80)
				'show the port of services'

		traceroute (p101)
				'trace the route'
				# exp:
					traceroute -n www.sohu.com		# tracer the sohu.com
					traceroute -n -f 8 -q 1 www.sohu.com		# trace it from 8 route 
		arp (p103)
				'Address Resolution Protocol'
				# exp:
					arp -n		# show the arp address
					arp -s 10.10.1.254 12:34:56:78:9a:bc	# add a static arp address
					arp -an 10.10.1.254	 # show the 10.10.1.254 's arp address 
				# other:
					cat /etc/resolv.conf # show the dns server
		dig (p104)
				'find the domain name'
				# exp:
					dig @61.153.177.196 www.sohu.com	# find www.sohu.com 's ip
					dig @61.153.177.196 sohu.com MX		# find the mailserver of the sohu.com
					dig 202.57.120.228 PTR		# find the DNS 202.57.120.228's PTR record
					dig sohu.com +nssearch	  # find the ack server of sohu.com
					dig sohu.com +trace		# trace the sohu.com's resolution 
		/etc/sysconfig/network (p105)
				'network file path'
		/etc/rc.d/init.d/network stop 
				'stop the network function'
				# ohter: 
					/etc/rc.d/init.d/network start  # start the network function
					/etc/rc.d/init.d/network restart	# restart the network function 
		/etc/sysconfig/network-scripts/ifcfg-eth0 (p106)
				'path of the eth0 setting '
		/etc/hosts
				'path of the hosts'
		dmesg 
				'show the tips of the system up ' 
				# exp:
					dmesg | grep eth	# grep the eth information 	
		lspci	
				'list the pci device of the system'
		ethtool 
				'ethernet tools, to check the ethernet'
				# exp:
					ethtool eth0	# check the eth0's status 
		/lib/modules/2.6.18-8/kernel/drivers
				'path of the driver modules,the file with .ko is the driver program'
		lsmod 
				'show the model'
				# exp: 
					lsmod | grep pcnet32	# show the model of pcnet32
		modinfo (p111) 
				'see the .ko file'
				# exp:
				modinfo /lib/modules/2.6.18/kernel/drivers/net/pcnet32.ko # show the pcnet32.ko





		





		



				

