(function(){
	$(document).ready(function() {
		__MC.Marathon.Marathon();
	});	

	var __MC = {};
	
	__MC.Marathon = {
	
		Marathon: function(){
			var i = 2;
			$(window).scroll(function () {
				if ($(window).scrollTop() == $(document).height() - $(window).height()) {
					//alert('bottom!!');
					var url = 'http://newwx.qucbd.com/third/marathonshow?page='+i+'&limit=2';
					$.getJSON(url, function(data){
						//alert('bottom!!');
		
						if(data != 1){
							var html='';
							$.each(data,function(i, item){
								
								html+='<div class="list">'+
    '<div class="listLeft"> <img src="'+item.url+'"/> </div>'+
    '<div class="listRight"><div class="code"><img src="'+item.strCode+'"/></div>'+
        '<div class="scan"><img src="/images/third/marathon/pop_scan.png"/></div>'+
        '<div class="era"><img src="/images/third/marathon/logo_era.png"/></div>'+
        '<div class="sponsor">本活动由年代全程赞助</div>'+
    '</div>'+
  '</div>';
							})
							$("#content").append(html);
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
