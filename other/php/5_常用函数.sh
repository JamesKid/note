# 数组类
		array_values  # 重新排列键值 array_values($array)	
# 魔术
	# 魔术变量
			 __FUNCION__   # 获得方法名
			 __CLASS__   # 获得类名
			 __LINE__   # 获得当前行号
			 __FILE__   # 获得文件完整路径和完整文件名
			 __DIR__   # 获得文件所在目录
			 __NAMESPACE__   # 获得命名空间
  # 魔术方法
			 __clone     # 复制实便
			 __construct # 构造函数,实例创建时执行
			 __destruct  # 析构函数,实例销毁时执行
		   __tostring  # 获得对象字符串信息 echo 对象则执行__tostring定义的方法
			 __set
			 __get
			 __sleep
			 __wakeup


			 # detail 
				__tostring
					<?php
						class Person{
							private $name = "";
							function __construct($name = ""){
								$this->name = $name;
							}
							function say(){
								echo "Hello,".$this->name."!<br/>";  
							}
							function __tostring(){//在类中定义一个__toString方法
									return  "Hello,".$this->name."!<br/>";    
							}
						}
						$WBlog = new Person('WBlog');
						echo $WBlog;//直接输出对象引用则自动调用了对象中的__toString()方法
						$WBlog->say();//试比较一下和上面的自动调用有什么不同
					?>

# 格式处理类
		number_format   # 取小数点后几位 
		round           # 四舍五入
		http_build_query # 数组转成url参数形式 key=value&key2=value3&key3=value3
# 获取类
		rand     # 获得随机数　 rand(10,100) 获得10到100的随机数

# 加密类
		# 已被破解的算法
				md5 sha0 sh1
		# sha2 
				# sha256 加密
						hash  # echo hash('sha256','test');
		# 加密算法性能比较
			<?php
				define('testtime', 50000);
				$algos = hash_algos();
				foreach($algos as $algo) {
					$st = microtime();
					for($i = 0; $i < testtime; $i++) {
						hash($algo, microtime().$i);
					}
					$et = microtime();
					list($ss, $si) = explode(' ', $st);
					list($es, $ei) = explode(' ', $et);
					$time[$algo] = $ei + $es - $si - $ss;
				}
				asort($time, SORT_NUMERIC);
				print_r($time);
			?>
		  # 运行结果
				[crc32b] => 1.14942403926
				[crc32] => 1.15080493481
				[adler32] => 1.17250810205
				[md4] => 1.21484698894
				[md5] => 1.25582505324
				[sha256] => 1.31992111638
				[ripemd256] => 1.34005199425
				[ripemd128] => 1.34174097336
				[sha1] => 1.34424093234
				[ripemd160] => 1.36161398381
				[haval128,3] => 1.37490507759
				[haval160,3] => 1.37925811601
				[haval192,3] => 1.37971906387
				[haval224,3] => 1.38690299403
				[haval256,3] => 1.38968507692
				[tiger128,3] => 1.40321999939
				[tiger192,3] => 1.42025405684
				[tiger160,3] => 1.42113689062
				[ripemd320] => 1.42461802158
				[haval128,4] => 1.4465580045
				[haval160,4] => 1.44935391309
				[haval192,4] => 1.45606506625
				[haval224,4] => 1.4650528846
				[tiger128,4] => 1.47951410777
				[tiger192,4] => 1.49081709387
				[haval256,4] => 1.50713596634
				[haval160,5] => 1.51613600436
				[haval224,5] => 1.51645894888
				[haval192,5] => 1.51678603177
				[haval256,5] => 1.51900808377
				[tiger160,4] => 1.52507308815
				[haval128,5] => 1.53689793875
				[whirlpool] => 1.82801189377
				[snefru] => 1.85931909387
				[gost] => 1.89863007236
				[sha384] => 1.95804009064
				[sha512] => 1.97130295938
				[md2] => 4.99702701607

# 其他类
		serialize  # 序列化对象 注意对其内容先进行addslashes()处理，否则序列化的数据中如果有特殊字符就会导致字符串无法使用unserialize()进行反序列化
		unserialize # 序列化恢复
		# example 
			servialize unserialize
				<?php
					$array = array();
					$array['=y'] = 'website';
					$array['value']='www.chhua.com';
					$a = serialize($array);
					echo $a;
					unset($array);
					$a = unserialize($a);
					print_r($a);
				?>

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


