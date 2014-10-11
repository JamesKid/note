========================================================
#  this is note about qpython in android 
=======================================================
# use 
	# let the script run in the console 
			QPython下可以使用input函数，但是要在终端上执行，QPython脚本单独执行时默认是无终端执行的，input/raw_input函数默认会被输入空值后返回。可以在脚本里加入注释#qpy:console，即可在脚本运行时启动终端，为了保证编码解码正确，程序前两行务必有#!/usr/bin/env python #-*- coding:utf-8 -*-
			举个例子:
			test.py
				#!/usr/bin/env python
				#-*- coding:utf-8 -*-
				#qpy:console
				print raw_input('Input a string:')

			当然QPython是python2.7的，3.2的版本亚马逊市场里有下载，免费的


