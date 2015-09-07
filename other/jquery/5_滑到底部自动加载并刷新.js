(function(){
	$(document).ready(function() {
		__MC.Marathon.Marathon();
	});	

	var __MC = {};
	
	__MC.Marathon = {
	
		Marathon: function(){
			var i = 2;
			$(window).scroll(function () {
				isRefresh=false;//当用户再操作时将自动刷新判断字段设置为false
				if ($(window).scrollTop() == $(document).height() - $(window).height()) {
					//alert('bottom!!');
					//var url = 'http://newwx.qucbd.com/third/marathonshow?page='+i;
					var url=$("#murl").val()+'?type=4&page='+i;
					$.getJSON(url, function(data){
						//alert('bottom!!');
		
						if(data != 1){
							var html='';
							$.each(data,function(i, item){
								
								html+='<div class="list">'+
    '<div class="listLeft"> <img src="'+item.url+'"/> </div>'+
    '<div class="listRight"><div class="code"><img src="'+item.strCode+'"/></div>'+
        '<div class="scan"><img src="/images/third/graduationseason/pop_scan.png"/></div>'+
    '</div>'+
  '</div>';
							})
							$("#listBody").append(html);
							//document.getElementById("content").innerHTML += html
							//alert(i);
							i++;
						}else{
						}
					});
				
				}
			});
		}
	};
	
})();

//再没用户操作时定时自动刷新页面
var isRefresh=true;
function myrefresh(){ 
if(isRefresh){
	window.location.reload(); 
}else{
	isRefresh=true;
	setTimeout('myrefresh()',20000); //指定30秒刷新一次 
}

} 
setTimeout('myrefresh()',20000); //指定30秒刷新一次 
