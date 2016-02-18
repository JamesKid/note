# use 
		# html
				#　使用方法在输入后光标后按ctrl+y 后按,
				# 全文格式类
						html:5     # 打印html5格式
						html:xt    # 用于xhtml过渡文档类型
						html:4s    # 用于html4严格文档类型
				# 部分格式类 
						p.foo		  # <p class="foo"></p>  
						p#foo     # <p class="bar" id="foo"></p>  
						h1{foo}   # <h1>foo</h1>   
						a[href=#] # <a href="#"></a>  
						.foo		  # <div class="foo"></div>

				# 嵌套
						>  #子元素符号，表示嵌套的元素
						+  #同级标签符号
						^  #可以使该符号前的标签提升一行
						p>span   # <p><span></span></p>
						p>span^p # <p><span></span></p> <p></p>
						h1+h2    # <h1></h1> <h2></h2>
				# 分组
						(.foo>h1)+(.bar>h2)  # 
																	<div class="foo">  
																		<h1></h1>  
																	</div>  
																	<div class="bar">  
																		<h2></h2>  
																	</div>  
				# 隐式标签 
						在过去版本中，可以省略掉div，即输入.item即可生成<div class="item"></div>。现在如果只输入.item，则Emmet会根据父标签进行判定。比如在<ul>中输入.item，就会生成<li class="item"></li>。 

				# 多个
						ul>li*3  
									<ul>
										<li></li>
										<li></li>
										<li></li>
									</ul>
						ul>li.item$*3
													<ul>  
															<li class="item1"></li>  
															<li class="item2"></li>  
															<li class="item3"></li>  
													</ul>  
		# css
				w100   # weight:100px;
				h10px  # height:10%;
				p      # 表示%
				e		   # 表示 em
				x		   # 表示 ex
						

		
