# 一、简单图形，整套的属性和方法专门用于绘制矩形：
		1、fillStyle可以设置为CSS颜色、一个图案或一种颜色渐变。fillStyle默认是纯黑色，你可以设置成你喜欢的任意颜色。只要页面打开着，每个绘图上下文都会记录自己的属性，除非你重置过它。
		2、fillRect(x,y,width,height)绘制一个矩形，并以当前的fillStyle来填充。
		3、srtokeStyle和fillStyle一样，可以设置为CSS颜色、一个图案或一种颜色渐变。
		4、strokeRect（x,y,width,height）使用当前的storke style来绘制一个矩形，strokeRect并不填充中间区域，而只绘制矩形的边缘。
		5、clearRect(x,y,width,height)清除指定矩形区域的像素。
# 二、路径
		按照惯例，不论开始绘制何种图形，第一个需要调用的就是beginPath。这个简单的函数不带任何参数，它用来通知canvas将要开始绘制一个新的图形了。对于canvas来说，beginPath函数最大的用处是canvas需要据此来计算图形的内部和外部的范围，以便完成后续的描边和填充。
		路径会跟踪当前坐标，默认值是原点。canvas本身也跟踪当前坐标，不过可能通过绘制代码来修改。
		每一个canvas都有一个路径，定义路径就如同用铅笔作画。你可以任意作地画，但它不一定是最终作品的一部分，直到你拿起画笔沾上墨水描绘这条路径。
		moveTo(x,y)：不绘制，只是将当前位置移动到新目标坐标（x,y），并作为线条开始点。
		lineTo(x,y)：绘制线条到指定的目标坐标(x,y)，并且在两个坐标之间画一条直线。不管调用它们哪一个，都不会真正画出图形，因为我们还没有主，调用stroke（绘制）和fil（填充）函数。当前，只是在定义路径的位置，以便后面绘制时使用。
		closePath()，这个函数跟lineTo很像，唯一的差别在于closePath会将路径的起始坐标自动作为目标坐标。closePath还会通知canvas当前绘制的图形已经闭合或者形成了完全封闭的区域。起连接起点，闭合路径的作用。
# 三、文本
		操作canvas文本的方式与操作其他路径对象的方式相同：可以描绘文本轮廓和填充文本内部，同时，所有能够应用于其他图形的变换和样式都能用于文本。context对象的文本绘制功能由两个函数组成：
		fillText(text,x,y,maxwidth)
		trokeText(text,x,y,maxwidth)
		两个的参数完全相同，必选参数包括文本参数以及用于指定文本位置的坐标参数。maxwidth是可选参数，用于限制字体大小，它会将文本字体强制收缩到指定尺寸。此外，还有一个measureText函数可供使用，该函数会返回一个度量对象，其包含了在当前context环境下指定文本的实际显示宽度。
		为了保证文本在各浏览器下都能正常显示，在绘制上下文里有以下字体属性
		1、font可以是CSS字体规则中的任何值。包括：字体样式、字体变种、字体大小与粗细、行高和字体名称。
		2、textAlign控制文本的对齐方式。它类似于（但不完全相同）CSS中的text-align。可能的取值为：start,end,left,right,和center.
		3、textBaseline控制文本相对于起点的位置。可以取值有top,hanging,middle,alphabetic,ideographic和bottom。对于简单的英文字母，可以放心的使用top,middle或bottom作为文本基线。
# 四、颜色渐变
		一旦我们拥有了绘图上下文，就可以开始定义一个颜色渐变。渐变是两种或更多颜色的平滑过度。canvas的绘图上下文支持两种类型的渐变：
		1、createLinearGradient(x0,y0,x1,x1)沿着直线从（x0,y0)至(x1,y1)绘制渐变。
		2、createRadialGradient(x0,y0,r0,x1,y1,r1)沿着两个圆之间的锥面绘制渐变。前三个参数代表开始的圆，圆心为（x0,y0），半径为r0。最后三个参数代表结束的圆，圆心为(x1,y1)，半径为r1。
# 五、图片
		canvas的绘图上下文中定义了几种绘制图片的方法：
		1、drawIamge(image,dx,dy)接受一个图片，并将之画到canvaa中。给出的坐标（dx,dy）代表图片的左上角。比如，坐标（0，0）将把图片画到canvas的左上角。
		2、drawIamge(image,dx,dy,dw,dh)接受一个图片，将其缩放为宽度dw和高度dh，然后把它画到canvas上的(dx,dy)位置。
		3、drawIamge(image,sx,sy,sw,sh,dx,dy,dw,dh)接受一个图片，通过参数（sx,sy,sw,sh）指定图片裁剪的范围，缩放到(dw,dh)的大小，最后把它画到canvas上的(dx,dy)位置。
		要在canvas上绘制图像，需要一先有一个图片。这个图片可以是已经存在的<img>元素，或者通过JS创建。无论采用哪种方式，都需要在绘制canvas之前，完全加载这张图片。浏览器通常会在页面脚本执行的同时异步加载图片。如果试图在图片未完全加载之前就将其呈现到canvas上，那么canvas将不会显示任何图片。
# 六、渐变
		渐变是指在颜色集上使用逐步抽样算法，并将结果应用于描边样式和填充样式中。使用渐变需要三个步骤：
		（1）创建渐变对象
		（2）为渐变对象设置颜色，指明过渡方式
		（3）在context上为填充样式或者描边样式设置渐变
		要设置显示哪种颜色，在渐变对象上使用addColorStop函数即可。这个函数允许指定两个参数：颜色和偏移量。颜色参数是指开发人员希望在偏移位置描边或填充时所使用的颜色。偏移量是一个0.0到1.0之间的数值，代表沿着渐变线渐变的距离有多远。
		除了可以变换成其他颜色外，还可以为颜色设置alpha值（例如透明），并且alpha值也是可以变化的。为了达到这样的效果，需要使用颜色值的另一种表示方法，例如内置alpha组件的CSSrgba函数.
		除了线性渐变以外，HTML5 Canvas API还支持放射性渐变，所谓放射性渐变就是颜色会介于两个指定圆间的锥形区域平滑变化。放射性渐变和线性渐变使用的颜色终止点是一样的：参数如下：
		createRadialGradient(x0,y0,r0,x1,y1,r1)
		代码中，前三个参数代表以(x0,y0)为圆心，r0为半径，后三个参数代表以(x1,y1)为圆心，r1为半径的另一个圆。渐变会在两个圆中间的区域出现。
# 七、背景图
		直接绘制图像有很多用处，但在某些情况下，像CSS那样使用图片作为背景也非常有用。HTML5 Canvas API还支持图片平铺。调用createPattern函数。
# 八、绘制曲线（二次曲线）
		quadraticCurveTo函数绘制曲线的起点是当前坐标，带有两组（x,y）参数，第二组是指曲线的终点。第一组代表控制点。所谓控制点位于曲线的旁边（不是曲线之上），其作用相当于对曲线产生一个拉力。通过调整控制点的位置，就可以改变曲线的曲率。
		HTML5 Canvas API的其他曲线功能还涉及bezierCurveTo、arcTo和arc函数。这些函数通过多种控制点（如半径、角度等）让曲线更具可塑性。
# 九、缩放canvas对象
		scale(x,y)，这个函数带有两个参数来分别代表在x,y两个维度的值。每个参数在canvas显示图像的时候，向其传递在本方向轴上图像要放大（或者缩小）的量。如果x值为2，就代表所绘制图像中全部元素都会变成两倍宽。如果y值为0.5，绘制出来的图像全部元素都会变成之前的一半高。
		注：要在原点执行图形和路径的变换操作，执行完成以后再统一平移。理由是绽放（scale）和旋转（rotate）等变换操作都是针对原点进行的。如果对一个人不在原点的图形进行旋转变换，那么rotate变换函数会将图形绕着原点旋转而不是在原地旋转。与之类似，如果进行缩放操作时没有将放置到合适的坐标上，那么所有路径坐标都会被同时缩放。取决于缩放比例的大小，新的坐标可能会全部超出canvas范围，进而给开发人员带来困惑，为什么我的缩放操作会把图像删了？
# 十、变换
		变换操作并不限于缩放和平移，我们可以使用函数context.rotate(angle)来旋转图像，甚至可以直接修改底层变换矩阵以完成一些高级操作，如剪裁图像的绘制路径。如：context.rotate(1.57)，旋转角度参数以弧度为单位。
		beginPath()：开始
		moveTo(x,y)：起点坐标
		lineTo(x,y)：目标坐标
		closePath()：连接起点，闭合路径
		translate()：移动
		rotate()：旋转
		restore()：恢复
		scale()：缩放
		save()：保存
		rotate(angle)：旋转图像
		quadraticCurveTo()：绘制曲线
		stroke()：绘制
		strokeText()：描绘文本轮廓
		strokeStyle()：颜色设置
		strokeRect()：使用当前的storke style来绘制一个矩形，而只绘制矩形的边缘。
		fill：填充
		fillRect()：绘制一个矩形，并以当前的fillStyle来填充
		fillStyle()：样式填充
		fillText：填充文本内容
		drawIamge()：图片填充
		createPattern()：使用背景图片填充
		addColorStop()：渐变填充
		createRadialGradient()：放射性渐变
		clearRect()：清除指定矩形区域的像素
		.lineCap（butt | square | round）：指定线条末端的样式
		.fillStyle：设置为CSS颜色、一个图案或一种颜色渐变
		.lineWidth：线条宽度设置
		.lineJoin(round)：修改当前形状中线段的连接方式，让拐角变得更圆滑
		.shadowColor：任何css中的颜色值，可以使用透明度(alpha)
		.shadowOffsetX：像素值，值为正数，向右移动阴影;值为负数，向左移动阴影
		.shadowOffsetY：像素值，值为正数，向下移动阴影;值为负数，向上移动阴影
		.shadowBlur：高斯模糊值，值越大，阴影越模糊
