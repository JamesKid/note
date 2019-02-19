# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is note about gdb use
# @change		: add gdb use
# ======================================================================

# debug  file 
	# debug c 
		gdb				    # go into gdb 
		(gdb) file filename # add a file to debug 
		(gdb) r			    # run the debug file
		(gdb) b main		# add an interrupt in main 
			(gdb) r			# run the debug in main interrupt
			(gdb) s         # run the next line code 
			(gbd) p  n      # print the 'n' value

				(gdb) p/a n # 以十六进制输出n
					# option
						x 按十六进制格式显示变量。
						d 按十进制格式显示变量。
						u 按十六进制格式显示无符号整型。
						o 按八进制格式显示变量。
						t 按二进制格式显示变量。
						a 按十六进制格式显示变量。
						c 按字符格式显示变量。
						f 按浮点数格式显示变量。
		(gdb) list			# show some code
		(gdb) help list		# show how list use
		(gdb) list 10		# show code between 10 line
		(gdb) list compute  # show compute function
		(gdb) list 10,15    # show code from 10 to 15
		(gdb) break 7       # make a break point in 7 line
		(gdb) break fun		# break in fuction

		(gdb) next			# 单步执行不进入函数
		(gdb) step			# 单步执行进入函数
		(gdb) kill			# stop the program 
		(gdb) watch sum		# 监视sum 值的变动
			(gdb) rwatch sum # 当sum 变量被读时，停住程序
			(gdb) awatch sum # 当sum 变量被写时，停住程序
			(gdb) info watchpoints  # show all the watch point
		(gdb) info stack    # 查看调用堆栈
		(gdb) info source   # 查看源文件信息
		(gdb) set n=4       # set the n value =4 
		(gcb) c				# continue the debug

		(gdb) bt			＃查看函数堆栈
		(gdb) finish		# 退出函数


	# debug python
	

	# test example
		gcc test.c -o gdb-sample -g  #  -o 编译生成的可执行文件名为gdb-sample，
									 # -g 将源代码信息编译到可执行文件中。如果不使用参数 -g，会给后面的GDB调试造成不便。
		gdb 
		(gdb) file gdb-sample		# load gdb-sample
		(gdb) r			# run 
		(gdb) b main	# 第19行处设置断点；这是本程序的第一个断点（序号为1）；断点处的代码地址为 0x804835c（此值可能仅在本次调试过程中有效）
		(gdb) p n		 # print the 'n' value 
		(gdb) b 26      # make a break point in 26 line
		(gdb) b tmpFunction      # make a break point in tmpFunction function
		(gdb) c			# continue the debu
		(gdb) p a		# print a value
		(gdb) p b		# print b value
		(gdb) d			# delete all the breake point
		(gdb) b *main   # 
		(gdb) r 
		(gdb) delete breakpoint 1  
		(gdb) disable breakpoint 1 #禁止使用某个断点
		(gdb) q			# quit 

		
		# 查看生成的汇编代码
			(gdb) displa /i $pc
			(gdb) si          # 每次中断都显示汇编代码
			(gdb) i r		  # 显示寄存器中的当前值  information register
			(gdb) i r eax     # 查看eax寄存器的值
				
			# option 
				$pc ：程序计数器
				$fp ：帧指针（当前堆栈帧）
				$sp ：栈指针
				$ps ：处理器状态




