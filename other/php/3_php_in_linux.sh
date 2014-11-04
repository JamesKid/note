# 强制卸载php
	查看php版本命令：

	#php -v
	 这个命令是删除不干净的

	 #yum remove php

	 因为使用这个命令以后再用

	 #php -v

	 还是会看到有版本信息的。。。。。

	   必须强制删除

	   #rpm -qa|grep php

	   提示如下

	   #php-pdo-5.1.6-27.el5_5.3
	   #php-mysql-5.1.6-27.el5_5.3
	   #php-xml-5.1.6-27.el5_5.3
	   #php-cli-5.1.6-27.el5_5.3
	   #php-common-5.1.6-27.el5_5.3
	   #php-gd-5.1.6-27.el5_5.3

	   注意卸载要先卸载没有依赖的

	   pdo是mysql的依赖项；common是gd的依赖项；
	   例如：# rpm -e php-pdo-5.1.6-27.el5_5.3
	   error: Failed dependencies:
			   php-pdo is needed by (installed) php-mysql-5.1.6-27.el5_5.3.i386

			   所以正确的卸载顺序是：
			   # rpm -e php-mysql-5.1.6-27.el5_5.3
			   # rpm -e php-pdo-5.1.6-27.el5_5.3
			   # rpm -e php-xml-5.1.6-27.el5_5.3
			   # rpm -e php-cli-5.1.6-27.el5_5.3
			   # rpm -e php-gd-5.1.6-27.el5_5.3
			   # rpm -e php-common-5.1.6-27.el5_5.3

			   再用# php -v

			   查看版本信息已经没有提示
