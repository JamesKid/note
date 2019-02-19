# web
	# html5  3D 效果
		http://madebyevan.com/
		# 化学分子式网站
			http://alteredqualia.com/canvasmol/#Daptomycin
		# 各种html特效
			http://alteredqualia.com
# 1.页面html乱码处理方法    在head加下如下这句
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
# 禁止查看源代码
	<head>
	<script>
	function stop(){
		return false;
	}
	document.oncontextmenu=stop;
	</script>
	</head>
	<body oncontextmenu=self.event.returnValue=false>
	<script   language=javascript>
	window.onselectstart=function()   {return   false;}       //禁用选择
	window.oncopy=function()   {return   false;}       //禁止复制
	</script> 
	a;lkj;lkej
	</body>
