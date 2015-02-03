# jquery
	# 基本使用
		# 输出jquery版本
			alert(jQuery.fn.jquery);      
	# 选择器
		# 选择下一个
			$(this).next();
		# 选择往下所有匹配的第一个 (选择第一个匹配class = conteent的)
			$(this).nextAll(".content:eq(0)");
		# 选择父
			$(this).parents()
		# 选择子
			$(this).child()
		# 选择祖先
			$(this).closest()
		# 选择属性
			$(this).attr('page')
	
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


			

