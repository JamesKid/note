# useful web 
    http://www.w3school.com.cn/jsref/dom_obj_anchor.asp  # js && dom 参考手册*****
    
# javascript 
	# 变量
		# 全局变量
			var  string
		# 局部变量
			string
	# 字符串链接
		string1 = "lkjlkjlk";
		string2 = "lkjlkjlk";
		string3 = string1+string2;
	# function
# debug
		cosole.log('test'); # 在firefox的控制台，全部下面查看
# jquery
	# 输出jquery版本
		alert(jQuery.fn.jquery);      
	# 选择器
		# 选择下一个
			$(this).next();
		# 选择往下所有匹配的第一个 (选择第一个匹配class = conteent的)
			$(this).nextAll(".content:eq(0)");

# 判断是pc端还是手机端

	function IsPC() {
		 var userAgentInfo = navigator.userAgent;
		 var Agents = ["Android", "iPhone",
		 "SymbianOS", "Windows Phone",
		 "iPad", "iPod"];
		 var flag = true;
		 for (var v = 0; v < Agents.length; v++) {
			 if (userAgentInfo.indexOf(Agents[v]) > 0) {
				 flag = false;
				 break;
			 }
		 }
		 return flag;
	}

# 模式
		# 单例模式
				<!doctype html>  
				<html>  
					<head lang="zh-CN">  
					</head>
					<body>
						<script>
						console.log('test5');
						var SingletonTester = (function () { 
								//参数：传递给单例的一个参数集合 
								function Singleton(args) { 
								console.log('mainfunc');
										this.name = 'SingletonTester'; 
										this.pointX = 6; 
										this.pointY = 7; 
								} 
								//实例容器 
								var instance; 
								var _static = { 
										name: 'SingletonTester', 
										//返回Singleton的实例 
										getInstance: function (args) { 
												if (instance === undefined) { 
														instance = new Singleton(args); 
												} 
												return instance; 
										} ,
										setName: function (args) { 
									this.name = args;
										} ,
								}; 
								return _static; 
						})(); 
						//var singletonTest = SingletonTester.getInstance({ pointX: 5 }); 
						var test = SingletonTester.setName('abc'); 
						var singletonTest2 = SingletonTester.name; 
						console.log(singletonTest2); // 输出 5  
						</script>
					</body>  
				</html>
