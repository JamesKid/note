# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is note about gdb use
# @change		: add gdb use
# ======================================================================

# debug  file 
	gdb				    # go into gdb 
	(gdb) file filename # add a file to debug 
	(gdb) r			    # run the debug file
	(gdb) b main		# add an interrupt in main 
		(gdb) r			# run the debug in main interrupt
		(gdb) s         # run the next line code 
		(dbd) p  n      # print the 'n' value
	

