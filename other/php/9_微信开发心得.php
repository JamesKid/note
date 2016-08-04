<?php
/*
 *  1. wx js 分享加载有延时，点太快没有加载js-sdk，则不会执行事件
 *
 *  2. 如果需要不关注也能获取用户信息，则需要申请为已认证的服务号
 *
 *  3. 域名需要备案才可以回调
 *
 *  4. openid只对公从号唯一，换个公众号openid就变了,如果需要多个公众平台共用一个id,则可以获取unionid,但需要申请, 将多个公众号绑定到同一个微信开放平台（open.weixin.qq.com）帐号下，即同一个Union下.公众号只有在被绑定到微信开放平台帐号下后，才会获取UnionID。
 *		unionid 参考:http://www.cnblogs.com/txw1958/p/weixin98-get-user-UnionID.html
 *
 *  5. 微信项目需要实时调试的话需要运维映射外网已备案域名到内网环境，如 "action.t9.ipr.zbjwork.com 192.168.142.42  "
 *
 *  6. 微信公众号后台需要设置这两个东西
 *		　1. 安全域名(没有调的话前端js-sdk调用不通过)  菜单: 公众号设置-> 功能设置->js接口安全域名
 *		　2. 回调域名(没有调的话后端微信回调不能通过，获取不了用户信息)  菜单：接口权限->网页账号->修改
 *
 *  7. code 有效期为一次
 *
 *  8. access_token 有两种，不要混了
 *
 *  9. 接口请参考公众号官方手册的最新接口（存在网上教程提供的接口并不是最新，导致接口数据有误)
 *
 *  10. token调用次数有限一天只有2000次，微信会两小时更新,使用时一定要缓存,否则用完就不能用其他一些微信接口了 (重点)
 *
 *  11. 建议使用微信pc端调试工具开发(官网有下载)
 *
 *  12. 测试号开发者需要先关注测试号才能使用微信pc端调用工具, 正式号需要在公众号后台　开发者工具->web开发者工具 将开发者加入
 *
 *
 *  13. 获取code (参考http://www.xiaohuang.cc/post/437.html)
 *		https://open.weixin.qq.com/connect/oauth2/authorize?appid=这里是你的公众号的APPID&redirect_uri=http://www.xx.com/getcode&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect
 *		用户点击确认登录，自动跳转下面地址得到code
 *		http://www.xx.com/getcode 这个是你自己的跳转地址
 *		http://www.xx.com/getcode?code=0064f7afef7af7b395147bfe8b51f7bf&state=123
 *
 *	14. 通过code可以获取用户信息
 *		$code = $_GET['code'];//获取code
 *		$weixin =  file_get_contents("https://api.weixin.qq.com/sns/oauth2/access_token?appid=这里是你的APPID&secret=这里是你的SECRET&code=".$code."&grant_type=authorization_code");//通过code换取网页授权access_token
 *		$jsondecode = json_decode($weixin); //对JSON格式的字符串进行编码
 *		$array = get_object_vars($jsondecode);//转换成数组
 *		$openid = $array['openid'];   //输出openid
 *
 *	15. 常量url地址配置一定要加http头，微信不认不带http头的地址
 *
 *
 */
?>
