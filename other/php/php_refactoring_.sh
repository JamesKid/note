# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is the note about php refactoring
# @change		:
# ======================================================================
# 整体思想
	# 1.　将重复的提练出来
	# 2.  将代码合理分类,方便阅读　
# method

	# 1. 将一些常常变化的提取出来变成常量或数组
		# example
			# const
				const MYSQLHOSTNAME = " 127.0.0.1 ";
			# array
				# 创建数组
				private static $const=array(
					'aa' => 'sdfsdfsf.php',
					'aa' => 'sdfsdfsf.php',
					'aa' => 'sdfsdfsf.php',
					'aa' => 'sdfsdfsf.php',
				);
				# 调用数组
				self::$const['aa'];

	# 2. 将大类分成细类
	# 3. 代码最好简短,尽量不超过140行
# tips 
	
