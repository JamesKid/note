(function(){
	$(document).ready(function() {
		$(".change").hide();
		/*
		$(".exchangeIn").click(function(){
			  //var i=window.confirm("你确定兑换该奖品么?本活动每人每号只能兑一次奖品,兑后不能再兑其他奖品了哦!");
			  //if(i!=0){
				  var openid = $("#openid").val();
				  var prizeid = $(this).attr('prizeid');
				  var prizename = $(this).attr('prizename');
				  var prizephoto = $(this).attr('prizephoto');
				  window.location.href = "/activity/pointdate?prizeid="+prizeid+'&prizename='+prizename+'&prizephoto='+prizephoto;
			  //}
		});
		*/
		$(".exchangeOut").click(function(){
			alert('金币不足,或该奖品已领完');
		});
		$(".exchangeFail").click(function(){
			alert('您已经兑过一次奖品,或该奖品已领完,领取失效');
		});
		$(".exchangeGet").click(function(){
			alert('您已经兑到该奖品啦,请到智慧商圈公众号查看中奖记录');
		});
		var ticket = $('#jsapi_ticket').val();
		var randStr = 'Wm3WZYTPz0wzccnW';
		var url = location.href.split('#')[0];
		var times = Date.parse(new Date())/1000;
		var str = 'jsapi_ticket='+ticket+'&noncestr='+randStr+'&timestamp='+times+'&url='+url;
		var sign = $.sha1(str);
		var name  = $('#name').val();
		var openid  = $('#openid').val();
		var planid  = $('#planid').val();
		
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

			wx.showMenuItems({ 
				menuList: ['menuItem:share:appMessage','menuItem:share:timeline','menuItem:share:QZone'] // 要显示的菜单项，所有menu项见附录3
			});

			//分享到朋友圈
			wx.onMenuShareTimeline({
    			title: name+'想参加 智慧商圈&国奥村-集金币赢大奖活动', 
				link: 'http://newwx.qucbd.com/activity/pointhelp?name='+name+'&openid='+openid+'&planid='+planid, // 分享链接
    			imgUrl: 'http://newwx.qucbd.com/images/activity/point6.jpg', // 分享图标
    			success: function (res) { 
					alert('分享成功！');
        		// 用户确认分享后执行的回调函数
    			},
    			cancel: function (res) { 
					alert('取消分享！');
        		// 用户取消分享后执行的回调函数
    			}
			});
			
			//分享给朋友
			wx.onMenuShareAppMessage({
    			title: name+'想参加 智慧商圈&国奥村-集金币赢大奖活动', 
				desc: '速度来帮他/她抢', // 分享描述
				link: 'http://newwx.qucbd.com/activity/pointhelp?name='+name+'&openid='+openid+'&planid='+planid, // 分享链接
				imgUrl: 'http://newwx.qucbd.com/images/activity/point6.jpg', // 分享图标
				success: function () { 
					// 用户确认分享后执行的回调函数
					alert('分享成功！');
				},
				cancel: function () { 
					// 用户取消分享后执行的回调函
					alert('取消分享！');
				}
			});
			
			
		});	
		
		wx.error(function(res){
 			//alert(res);
		});
	});
})();

