# jquery mobile
		# learn web 
				http://www.runoob.com/jquerymobile/jquerymobile-install.html
		# port (引用)
				<head>
					<!-- meta使用viewport以确保页面可自由缩放 -->
					<meta name="viewport" content="width=device-width, initial-scale=1">
					<!-- 引入 jQuery Mobile 样式 -->
					<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
					<!-- 引入 jQuery 库 -->
					<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
					<!-- 引入 jQuery Mobile 库 -->
					<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
				</head>
		

# jquery
		# json跨域 (用 jsonp解决)
				http://www.cnblogs.com/yeminglong/archive/2013/06/24/3152976.html
		# 手机触摸事件
				$(document).ready(function(){
					var touchEvents = {
								touchstart: "touchstart",
								touchmove: "touchmove",
								touchend: "touchend",
								/**
								 * @desc:判断是否pc设备，若是pc，需要更改touch事件为鼠标事件，否则默认触摸事件
								 */
								initTouchEvents: function () {
										if (isPC()) {
												this.touchstart = "mousedown";
												this.touchmove = "mousemove";
												this.touchend = "mouseup";
										}
								}
						};
						$(".imgHead").bind(touchEvents.touchstart,function(){
							$("#up_01").css("display","none");
							$("#up_01_down").css("display","block");
						});
					});
		
	# 基本使用
		# 输出jquery版本
			alert(jQuery.fn.jquery);      
  # 弹出框
		var i=window.confirm("将转入百度页面");
		if(i!=0){
			window.location="http://www.baidu.com";
		}
  # 禁止缓存js
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-control" content="no-cache, no-store, must-revalidate">
		<meta http-equiv="Cache" content="no-cache">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
	# 选择器
		# 选择下一个
			$(this).next();
		# 选择往下所有匹配的第一个 (选择第一个匹配class = conteent的)
			$(this).nextAll(".content:eq(0)");
		# 选择父元素
			$(this).parent()
		# 选择所有祖先元素,不限于父元素
			$(this).parents()
		# 选择子
			$(this).child()
		# 查找所有子元素，只会找到直接的孩子节点，不会返回所有子孙
			$(this).children(expr)        
		# 选择祖先
			$(this).closest()
		# 选择属性
			$(this).attr('page')
		# 上一个兄弟元素
			$(this).prev()
	  # 查找所有之前的兄弟节点
			$(this).prevAll()
    # 查找下面的所有内容，包括节点和文本。
			$(this).contents()
	  #查找兄弟节点，不分前后
			$(this).siblings()
	  #查找兄弟节点，不分前后
			$(this).find()
			# 跟jQuery.filter(expr)完全不一样，jQuery.filter(expr)是从初始的
			# jQuery对象集合中筛选出一部分，而jQuery.find()的返回结果，不会有初始集中
			# 筛选出一部分，而jQuery.find()的返回结果，不会有初始集合中的内容，比如：
			# $("p").find("span")是从元素开始找，等于$("p span")=kjk

	# 语法
		# 事件重新绑定
				$('xx').unbind('click').click(function(){
				});
				$('xx').bind('click').click(function(){
				});
		# 函数转递归
			定义函数时不需要定义参数
			调用函数时直接转参数,后函数即可直接使用参数
			packSaveBtn: function() {
				$('xxxx').click(function(){
					alert(son);	
				});
			},
			son = 3 ;
			__MC.Homeset.packSaveBtn(son);
		# if 语句
			if($('#pack').val() 



			

