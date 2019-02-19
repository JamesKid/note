hostname="JamesKid"
# ifconfig_em0="DHCP"
ifconfig_em0="inet 192.168.1.130 netmask 255.255.255.0"
defaultroute="192.168.1.1"
sshd_enable="YES"
moused_enable="YES"
ntpd_enable="YES"
powerd_enable="YES"
# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
dumpdev="AUTO"
# static route by JamesKid
# static_routes=" static_route1 static_route2 "
# static_route1=" -net default 192.168.72.2 "
# static_route2=" -net 192.168.1.0/24 192.168.72.2 "

route add default 192.168.1.1	# add an default route
#===============JamesKid=======================
# add screen mode 
# vidcontrol -i mode| grep G # to show mode
# vidcontrol mode_321	     # use mode_321 no
#=============================================
allscreens_flags="MODE_321"

