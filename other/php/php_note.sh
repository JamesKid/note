#======================================================
#!/bin/bash 
# Description:  this program is note about php
# Editor:       zhangshijie 
 # Email:        406358964@qq.com 
 # Version:      1.0 
#======================================================
# 

# function 
	# nl2br 
		# description :将\n 的换行转成<br />

		# use 
			# 若要空格的话要先将空格转了
			$result =  str_replace(" ","&nbsp",$string);
			$result = nl2br($result);
			echo $result;
		

# problem
	# 中文乱码
		在php文件头加入以下一句
		header("Content-Type:text/html;charset=utf8");

# error
