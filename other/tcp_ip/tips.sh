# learn web 
	http://blog.chinaunix.net/uid-20620288-id-3170583.html
	http://bbs.csdn.net/topics/10382490
	http://blog.csdn.net/hguisu/article/details/7448528　# php socket　程序

# 设计方法
	# from  web 
		http://bbs.csdn.net/topics/10382490
	# detail	
		一、技术概述 
		1.1 基于TCP/IP的通信技术

		基于TCP/IP的通信基本上都是利用SOCKET套接字进行数据通讯，程序一般分为服务器端和用户端两部分。下面简要地讲一下设计思路（VC6.0下）：

		第一部分　服务器端
		　　一、创建服务器套接字（create）。
		　　二、服务器套接字进行信息绑定（bind），并开始监听连接（listen）。
		　　三、接受来自用户端的连接请求（accept）。
		　　四、开始数据传输(send/receive)。
		　　五、关闭套接字（closesocket）。

		第二部分　用户端
		　　一、创建用户套接字（create）。
		　　二、与远程服务器进行连接（connect），如被接受则创建接收进程。
		　　三、开始数据传输(send/receive)。
		　　四、关闭套接字（closesocket）。

		通过以上设计思路，我们可以创建一个简单的面向连接的单用户程序。下面，将介绍多线程技术，以使程序支持多用户。
