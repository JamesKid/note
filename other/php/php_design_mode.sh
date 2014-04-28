#====================================================
#!/bin/bash 
# Description:  this is the note about php design mode 
# Editor:       zhangshijie 
# Email:        406358964@qq.com 
# Version:      1.0 
#====================================================
# 要求,背熟这几种模式　
# useful web 
	# php设计模式漫谈
		http://developer.51cto.com/art/201004/195765.htm

# OOP and MODE
	# 1_单例模式
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

	# 2_工厂模式
		# http://blog.csdn.net/zhaoxuejie/article/details/7072878
		# 特点:
		# 优点: 工厂方法模式可以允许系统在不修改工厂角色的情况下引进新产品
		# 缺点: 客户可能仅仅为了创建一个特定的ConcreteProduct对象,就不得不创建一个
		#		Creator子类
		# 适用: 1.当一个类不知道它所必须创建的对象的类的时候
		#		2.当一个类希望由它的子类来指定它所创建的对象的时候
		#		3.当类将创建对象的职责委托给多个帮助子类的某一个，并且你希望将哪
		#		  一个帮助子类是代理者这一信息局部化的时候
		# php
			# 工厂模式实例
			<?php
			//抽象产品 
			interface Work {
				public function doWork();
			}
			//具体产品实现
			class Student implements Work {
				function dowork() {
					echo " student do homework ";
				}
			}
			class Tescher implements work {
				function dowork() {
					eco " teacher read homework";
				}
			}
			//抽象工厂
			interface WorkerFactor {
				public function getWorker();
			}
			//具体抽象工厂实现
			class StudentFactory {
				function getWorker() {
					return new Student();
				}
			}
			class TeacherFactory {
				function getWorker() {
					return new Teacher();
				}
			}
			//客户端
			class Client {
				static function main() {
					$s = new Student();
					$s -> doWork();
					$t = new Teacher();
					$t -> doWork();
				}
			}


			?>

			# 简单工厂模式	(静态工厂方法)
			<?php
			interface Comput {
				public functon getResults();
			}
			//操作类
			class Operation {
				protected $Number_A = 0;
				protected $Number_B = 0;
				protected $Result = 0;
				//赋值
				function setNumber($Number_A,$Number_B) {
					$this->Number_A = $Number_A;
					$this->Number_B = $Number_B;
				}
				//清零
				function clearResult() {
					$this ->Result = 0;
				}
			}
			//加法
			class OperationAdd extends Operation implements Comput {
				function getResults() {
					return $this->Result = ($this->Number_A + $this->Number_B);
				}
			}
			//减法
			class OperationSub extends Operation implements Comput {
				function getResults() {
					return $this->Result = ($this->Number_A - $this->Number_B);
				}
			}
			// 乘除法同理,些处省略
			// 工厂
			class OperationFactory {
				private static $obj;
				public static function CreateOperatoin($type) {
					try {
						$error = " please input the '+','-','*','/' as symbol ";
						switch ($type) {
							case '+' :
								self::$obj = new OperationAdd();
								break;
							case '-' :
								self::$obj = new OperationSub();
								break;
							default:
								throw new Exception($error);
						}
						return self::$obj;
					} catch (Exception $e ) {
						echo 'Caught exception : ', $e->getMessage(), "\n";
						exit;
					}
				}
			}
			//工厂创建实例
			$obj = OperationFactory::CreateOperatoin('-');
			$obj -> setNumber(3,4);
			echo $obj -> getResults();
			?>

	# 3_观察者模式 
		# http://www.cnblogs.com/baochuan/archive/2012/02/22/2362668.html
		# 特点:1.
		# 优点:1. 抽象的耦合,被观察者角色所知道的只是一个具体的观察者列表
		#　		　被观察者并不认识任何一个具体观察者,只知道它们者有一个共
		#		　同的接口
		#      2. 支持广播通讯.被观察者会向所有的登记过的观察者发出通知　
		# 缺点:1.如果一个被观察者对象有很多的直接和间接的观察者的话,将所
		#　		 有的观察者都通知到会花费很多时间　
		#	   2.如果在被观察者之间有循环信赖的千方百计,被观察者会触发它们
		#　　　　之间进行循环调用,导致系统崩溃,在使用这个模式时要注意
		#	   3.如果对观察者的通知是通过另外的线程进行异步投递的话,系统
		#　	　　　必须保证投递是以自恰的方式进行的.
		#	   4. 虽然观察者模式可以随时使观察者知道所观察的对象发生了变化,
		#         但是观察者模式没有相应的机制使观察者知道所观察的对象是怎么
		#　　　　　发生变化的

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





	# 4_命令链模式　
		# http://developer.51cto.com/art/201004/194011.htm
		# 特点: PHP的命令模式相当于程序中的回调（callback）。回调通常使用一个函数
		#	    指针或数据结构如PHP中的字符串和数组实现，Command是在一个方法调用
		#       之上的抽象，它吸收了所有面向对象的好处：合成、继承和处理。
		# 优点 1.
		# 缺点 1.
		# 参与者:	Command(命令): 在一个方法调用之上定义一个抽象
		#			ConcreteCommand (具体的命令) : 一个操作的实现
		#			Invoker (调用者) 引用Command 实例作为它可用的操作

		# php
			# 类
			/**
			* The Command abstration .
			* In this case the implementatoin must return a result,
			* sometimes it only has side effects.
			*/
			interface Valiator {
				/**
				* The method could have any parameters.
				* @param mixed
				* @return boolean
				*/
				public functoin isValid($value);
			}
			/** Concretecommand */
			class MoreThanZeroValidator implements Validator {
				public function isValid($value) {
					return $value > 0;
				}
			}
			/** Concretecommand */
			class EvenValidator implements Validator {
				public function isValid($value) {
					return $value % 2 == 0;
				} 
			}
			/** 
			* The Invoker,An implementation could store more than one 
			* Validator if needed.
			*/
			class ArrayProcessor {
				protected $_rule;
				public function __construct (Valiator $rule) {
					$this -> _rule = $rule;
				}
				public function process( array $numbers) {
					foreach ($numbers as $n ) {
						if ($this -> _rule -> IsValid($n)) {
							echo $n, "\n";
						}
					}
				}
			}
			//Client code
			$processor = new ArrayProcessor ( new EvenValidator());
			$processor -> process (array(1,20,18,5,0,31,42));
			// The output result is ' 20 18 0 42 '

			
			

	# 5_代理模式 
		# http://developer.51cto.com/art/201003/190825.htm
		# 特点: 它是对简单处理程序或指针的增强,用于引用一个对象:这个指针被代理
		#　	　　(Proxy) 对象取代,代理对象位于客户端(Client) 和真实执行程序之间,
		#　		指针有一个可被多个目标利用的钩子

	# 6_责任链模式　
	# 7_结构模式　
	# 8_策略模式
	# 9_调解者模式
	# 10_迭代器模式　
	# 


# tips
	# 1. 静态方法与非静态方法的区别
		1.静态方法可以直接用类名调用 ,非静态方法需要实例化
		2.静态方法占用内存,并放在内存,非静态方法在实例化时才调用内存
		3.静态方法调用速度相对比较快,但占内存
		4.静态方法用多会出现内存溢出,要用垃圾回收机制
	# 2. self 与this 的区别
		self::   -->调用本类
		$this::  -->调用本实例
