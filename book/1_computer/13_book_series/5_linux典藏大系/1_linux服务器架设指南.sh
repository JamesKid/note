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
		route
				'show or manipulate the route table'
				# exp:
				route -n	# show the route talbe,the last line is the default route
		tcpdump 
				'catch the data package'

# 第六章 linux 主机安全
		netstat 
				'show the net work station'
				# exp:
				netstat -anp|grep :22 # grep the 22 port
		nmap 
				'scan the port'
				# exp:
				nmap -sT IP		# check the port and service of the IP 
				nmap -O IP		# check the IP 's operating system
				nmap -sT -Pn	# check it force
				nmap -sT -Pn -p 1-5000 IP	# check the port from 1 to 5000
		/etc/yum.conf
				'path of the yum configuration'
		yum
				'manipulate the soft'
				# exp:
				yum install   # install package
				yum update	  # update package
				yum checkupdate    # checkupdate 
				yum remove	  # remove package
				yum search    # search package
				yum list	  # list all the package
				yum info      # list all the package's infomation include 'name','description','url',and so on
				yum clean     # clean the /var/cache/yum 's download content
		calmscan (p131)
				'a antivirus software'
				# exp 
				clamscan /bin/uame   # scan the uname file
				clamscan			 # scan all the file in this directorv
				clamscan -r /home    # scan all the file and son file in /home directory
				clamscan -d /tmp/newclamdb -r /tmp   # use the /tmp/newclamdb as the virus repo to scan /tmp
		/etc/selinux/config
				'path of the selinux config'

# 第八章 linux 路由配置 
		route (p161)
				'set route'
				# exp:
					route add -net 127.0.0.0 netmask 255.0.0.0 dev lo # add a static route ,destination is 
																	  # 127.0.0.0/8 ,out from lo
					route add -net 192.56.76.0 netmask 255.255.255.0 gw 192.51.1.1
																	  # destination 192.56.76.0/24 's package																		# send to 192.56.1.1 host 
					route add 192.56.1.1 eth0  # destinations 192.56.1.1 's package send from eth0
					route add default gw 10.1.1.1  # set a defult route ,all the unknown package will send to													 # 10.1.1.1
					route add -net 172.16.0.0 netmask 255.255.0.0 reject # all the package sent to 172.16.0.0
																		 # /16 will be reject
					route del -net 127.0.0.0 netmask 255.0.0.0 # del all destination to 127.0.0.0/8 's list
		/etc/sysctl.conf |gref ip_forward
				'path of the package transmit'
				# exp:
					echo "1">/proc/sys/net/ipv4/ip_forward # this will set it once,if reset the system will
					    								   # will lost it's function
					sysctl -p  #  real time fix the kernel parameter, and make it use nowo
		rpm -qa 
				'show all the installed package'
		ip route
				'config ip route'
				# format:
					ip route <del | add | replace> ROUTE
				# exp:
					ip route add 192.168.1.0/24 via 192.168.0.3 table 1 # add a route to table 1,to
																	# 192.168.1.0/24's gatway is 192.168.0.3
					ip route add default via 192.168.0.4 table main # let 192.168.0.4 to the default gatway 
																	# to the main table (254)
					ip route add 192.168.1.0/24 dev eth0 table 10  # all the package to 192.168.1.0/24 will 
																   # go to from eth0 
					ip route delete 192.168.1.0/24 dev eth0 table 10 # delete it 

																	
				

				





			
		


		




		





		





		



				


