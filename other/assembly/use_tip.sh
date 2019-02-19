# ================================JamesKid============================== 
# @author		: JamesKid  
# @description :  this is note about assembly in linux
# @change		: add use and assembler
# ======================================================================

# web  (教程网址)
	http://www.ibm.com/developerworks/cn/linux/l-assembly/
	http://linuxassembly.org
	http://blog.chinaunix.net/uid-20384806-id-1954288.html
	
# use 
	# write and compile
		# method 1
			vim hello.s             # write the hell world file 
			as -o hello.o hello.s   # compile file hello.s to hello.o
			ld -s -o hello hello.o  # links hello.o to hello
			./hello					# excute hello file (由汇编器产生的目标代码是不能直接在计算机上运行的，它必须经过链接器的处理才能生成可执行代码。链接器通常用来将多个目标代码连接成一个可执行代码，这样可以先将整个程序分成几个模块来单独开发，然后才将它们组合(链接)成一个应用程序。 Linux 使用 ld 作为标准的链接程序，它同样也包含在 binutils 软件包中。汇编程序在成功通过 GAS 或 NASM 的编译并生成目标代码后，就可以使用 ld 将其链接成可执行程序了：)

		# method 2 
			nasm -f elf hello.asm -g -F stabs 
			gcc -o hello hello.o -g 
			gdb hello


# tips 
	# 1. 
		# write assembly code in linux you need to use AT&T format but not Interl format 


# path
	# 所有系统功能号
		/usr/include/bits/syscall.h
