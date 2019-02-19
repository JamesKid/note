<!DOCTYPE html>
<html lang="zh-cn">
<head>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="/assets/pages/wxadmin/qr.js"></script>

</head>
<body>
	<input id="qr" style="margin-top:100px;padding:30px;font-size:1.2em" type="button" value="点击扫码"/>

	<input id="appId" type="hidden" value="<?php echo $appId; ?>" />
	<input id="timestamp" type="hidden" value="<?php echo $timestamp; ?>" />
	<input id="nonceStr" type="hidden" value="<?php echo $nonceStr; ?>" />
	<input id="signature" type="hidden" value="<?php echo $signature; ?>" />
</body>
</html>
