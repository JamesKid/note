(function(){
	$(document).ready(function(){
		__MC.qr.initPage();
	});

	__MC.qr = {
		initPage : function(){
			wx.config({
			    debug: false,
			    appId: $('#appId').val(),
			    timestamp: $('#timestamp').val(),
			    nonceStr: $('#nonceStr').val(),
			    signature: $('#signature').val(),
			    jsApiList: ['scanQRCode']
			});

			wx.ready(function(){
				$('#qr').click(function(){ 
					wx.scanQRCode({
						desc: 'scanQRCode desc',
						needResult: 0, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
						scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
						success: function (res) {
							var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
						}
					});
				});
			}).error(function(res){
				alert(res);
			});
		}
	}
})();
