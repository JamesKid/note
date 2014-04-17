#====================================================
#!/bin/bash 
# Description:  this is the note about php design mode 
# Editor:       zhangshijie 
# Email:        406358964@qq.com 
# Version:      1.0 
#====================================================

# OOP and MODE
	# 单例模式
		# 特点: 1. 一个类在整个应用中只有一个实例
		# 		2. 类必须自行创建这个实例
		#		3. 必须自行向整个系统提供这个实例
		# 缺点: 1.
		# 优点: 1.
		# php
			# 类
			class man {
				private static $_instance;
				private function __construct() {
					echo 'i am instantiation';
				}
				//单例方法　
				public static function get_instance() {
					var_dump(isset(self::$_instance));
					if(!isset(sefl::$_instance)) {
						self::$_instance = new self();
					}
					return self::$_instance;
				}
				private function __clone() {
					trigger_error('Clone is not allow' , E_USER_ERROR);
				}
				function test() {
					echo ("test");
				}
			}
			#　调用　
			$test = man::get_instance();
			$test = man::get_instance();
			$test->test();

	# 工厂模式

	# 观察者模式 
		# http://www.cnblogs.com/baochuan/archive/2012/02/22/2362668.html
		# 特点:1.
		# 优点:1. 
		# 缺点:1.

		# php
			# 类
			class Paper {
				private $_observers = array();
				public function register($sub) { //注册观察者
					$this->_observers[] = $sub;
				}
				public function trigger() {  //外部统一访问 
					if(!empty($this->_observers)){
						foreach($this->_observers as $observer) {
							$observer->update();
						}
					}
				}
			}
			//观察者要实现的接口
			interface Observerable {
				public function update();
			}
			class Subscriber implements Observerable {
				public functino update() {
					echo "Callback\n";
				}
			}
			//测试代码 
			$paper = new Paper();
			$paper->register(new Subscriber());
			//$paper->register(new Subscriber1());
			//$paper->register(new Subscriber2());
			$paper->trigger();





	# 命令链模式　

	# 策略模式


# tips
	# 1. 静态方法与非静态方法的区别
		1.静态方法可以直接用类名调用 ,非静态方法需要实例化
		2.静态方法占用内存,并放在内存,非静态方法在实例化时才调用内存
		3.静态方法调用速度相对比较快,但占内存
		4.静态方法用多会出现内存溢出,要用垃圾回收机制
	# 2. self 与this 的区别
		self::   -->调用本类
		$this::  -->调用本实例
