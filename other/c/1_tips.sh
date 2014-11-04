# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is the note about c language and gcc
# @change		:
# ======================================================================



# c

# gcc
	# use
		# compile
			gcc test.c
		# run 
			./a.out
		# filename
			# compile to the filename I want (生成指定的文件名)
			gcc -o i_want.out test.c
			gcc -o i_want.exe test.c

# path 
	# path of .h
		/usr/include
		/usr/local/include
	# <sys/头文件名> <net/文件名>
		/usr/include/sys
	# 4.如果想在指定路径下检索头文件，可加选项-I。如我的/home/Desktop目录下有个头文件local1.h，在编译包含local1.h的test.c文件时，可用：
		gcc test.c -o test -I /root/Desktop。 
		
