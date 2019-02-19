# php 解析 html代码教程
	http://www.jb51.net/article/27942.htm
	http://blog.csdn.net/suiye/article/details/7825002

# 注意!! 用完一定要清除对象否则占用内存
	<?php $html->clear();?>

# load simple_html_dom 
	include_once('simple_html_dom.php'); 
# 获得html的三种方式

	// Create a DOM object from a string
	$html = str_get_html('<html><body>Hello!</body></html>');
	// Create a DOM object from a URL
	$html = file_get_html('http://www.google.com/');
	// Create a DOM object from a HTML file
	$html = file_get_html('test.htm'); 	

# 取dom对象的操作
	// Find all anchors, returns a array of element objects
	$ret = $html->find('a');
	// Find (N)th anchor, returns element object or null if not found (zero based)
	$ret = $html->find('a', 0);
	// Find lastest anchor, returns element object or null if not found (zero based)
	$ret = $html->find('a', -1);
	// Find all <div> with the id attribute
	$ret = $html->find('div[id]');
	// Find all <div> which attribute id=foo
	$ret = $html->find('div[id=foo]'); 

# 这里可以使用各种css选择器，就像在jQuery中进行DOM操作一样，非常方便。此外，还有两个特殊的属性可以得到文本和注释的内容 
	// Find all text blocks
	$es = $html->find('text');
	// Find all comment (<!--...-->) blocks
	$es = $html->find('comment'); 

# 当然，还是类似于jQuery，PHP Simple HTML DOM Parser也支持链式操作，以及各种访问DOM元素的简单方法  
	// Example
	echo $html->find("#div1", 0)->children(1)->children(1)->children(2)->id;
	// or
	echo $html->getElementById("div1")->childNodes(1)->childNodes(1)->childNodes(2)->getAttribute('id'); 


# php 实例 
===============================================
    <?php  
      
    //查找html文档中的超链接元素  
      
    $a = $html->find(‘a’);  
      
    //查找文档中第(N)个超链接，如果没有找到则返回空数组.  
      
    $a = $html->find(‘a’, 0);  
      
    // 查找id为main的div元素  
      
    $main = $html->find(‘div[id=main]‘,0);  
      
    // 查找所有包含有id属性的div元素  
      
    $divs = $html->find(‘div[id]‘);  
      
    // 查找所有包含有id属性的元素  
      
    $divs = $html->find(‘[id]‘);  
      
    ?>  
==================================================
    <?php  
      
    // 查找id=’#container’的元素  
      
    $ret = $html->find(‘#container’);  
      
    // 找到所有class=foo的元素  
      
    $ret = $html->find(‘.foo’);  
      
    // 查找多个html标签  
      
    $ret = $html->find(‘a, img’);  
      
    // 还可以这样用  
      
    $ret = $html->find(‘a[title], img[title]‘);  
      
    ?>  
================================================
    <?php  
      
    // 查找 ul列表中所有的li项  
      
    $ret = $html->find(‘ul li’);  
      
    //查找 ul 列表指定class=selected的li项  
      
    $ret = $html->find(‘ul li.selected’);  
      
    ?>  
================================================
    <?php  
      
    // 返回父元素  
      
    $e->parent;  
      
    // 返回子元素数组  
      
    $e->children;  
      
    // 通过索引号返回指定子元素  
      
    $e->children(0);  
      
    // 返回第一个资源速  
      
    $e->first_child ();  
      
    // 返回最后一个子元素  
      
    $e->last _child ();  
      
     // 返回上一个相邻元素  
      
    $e->prev_sibling ();  
      
    //返回下一个相邻元素  
      
    $e->next_sibling ();  
      
    ?>  
