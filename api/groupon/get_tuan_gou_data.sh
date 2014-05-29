#!/bin/bash 
# ==============================================================================
# path of linux:  
# Author:    jameskid
# Date:      2014.5.28
# Des :      get every day groupbuy data 
# ==============================================================================
# remove yestoday file 
	rm -f /tmp/la_shou_today.xml
	rm -f /tmp/mei_tuan_today.xml
# get today's tuangou file 
	wget -O /tmp/la_shou_today.xml http://open.lashou.com/opendeals/lashou/2418.xml
	wget -O /tmp/mei_tuan_today.xml http://www.meituan.com/api/v2/chongqing/deals

