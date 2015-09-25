# 数组类
		array_values  # 重新排列键值 array_values($array)	
# 魔术方法
		 __FUNCION__   # 获得方法名
		 __CLASS__   # 获得类名
		 __clone     # 复制实便
		 __construct # 构造函数,实例创建时执行
		 __destruct  # 析构函数,实例销毁时执行

# 格式处理类
		number_format   # 取小数点后几位 
		round           # 四舍五入
		http_build_query # 数组转成url参数形式 key=value&key2=value3&key3=value3
# 获取类
		rand     # 获得随机数　 rand(10,100) 获得10到100的随机数

# 服务器类
		#　$_SERVER
				$_SERVER[’PHP_SELF’]
					http://www.yoursite.com/example/ — – — /example/index.php
					http://www.yoursite.com/example/index.php — – — /example/index.php
					http://www.yoursite.com/example/index.php?a=test — – — /example/index.php
					http://www.yoursite.com/example/index.php/dir/test — – — /dir/test

				$_SERVER['REQUEST_URI']
					http://www.yoursite.com/example/ — – — /
					http://www.yoursite.com/example/index.php — – — /example/index.php
					http://www.yoursite.com/example/index.php?a=test — – — /example/index.php?a=test
					http://www.yoursite.com/example/index.php/dir/test — – — /example/index.php/dir/test

				$_SERVER['SCRIPT_NAME']
					http://www.yoursite.com/example/ — – — /example/index.php
					http://www.yoursite.com/example/index.php — – — /example/index.php
					http://www.yoursite.com/example/index.php — – — /example/index.php
					http://www.yoursite.com/example/index.php/dir/test — – — /example/index.php


