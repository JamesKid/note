(function(){
	$(document).ready(function(){
		var ticket = $('#jsapi_ticket').val();
		var randStr = 'Wm3WZYTPz0wzccnW';
		var url = location.href.split('#')[0];
		var times = Date.parse(new Date())/1000;
		var str = 'jsapi_ticket='+ticket+'&noncestr='+randStr+'&timestamp='+times+'&url='+url;
		var sign = $.sha1(str);
		var name  = $('#name').val();
		var openid  = $('#openid').val();
		wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: 'wxb5d0f65d61f37a9f', // 必填，公众号的唯一标识
			timestamp:times, // 必填，生成签名的时间戳
			nonceStr: randStr, // 必填，生成签名的随机串
			signature: sign,// 必填，签名，见附录1
			jsApiList: ['hideAllNonBaseMenuItem','showMenuItems','onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
			wx.hideAllNonBaseMenuItem();
		});	
		wx.error(function(res){
 			//alert(res);
		});
	});
})();
