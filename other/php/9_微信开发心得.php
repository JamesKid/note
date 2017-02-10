<?php
/*
 *  1. (前端注意) wx js 分享不同网络情况加载有延时，点太快没有加载js-sdk，则不会执行事件 
 *
 *  2. (产品注意) 如果需要不关注也能获取用户信息，则需要申请为已认证的服务号,订阅号必须用户关注才能获取用户信息
 *
 *  3. (产品及技术注意) 线上域名需要备案微信才允许回调  
 *
 *  4. (技术注意) openid只对公从号唯一，换个公众号openid就变了,如果需要多个公众平台共用一个id,则可以获取unionid,但需要申请, 将多个公众号绑定到同一个微信开放平台（open.weixin.qq.com）帐号下，即同一个Union下.公众号只有在被绑定到微信开放平台帐号下后，才会获取UnionID。
 *		unionid 参考:http://www.cnblogs.com/txw1958/p/weixin98-get-user-UnionID.html
 *
 *  5. (技术注意) 微信项目需要手机端调试的话需要运维映射外网已备案域名到内网环境，如 "xxx.com 192.168.142.42  "
 *
 *  6. (产品及技术注意) 微信公众号后台需要设置这两个东东 
 *		　1. 安全域名(没有调的话前端js-sdk调用不通过)  菜单: 公众号设置-> 功能设置->js接口安全域名
 *		　2. 回调域名(没有调的话后端微信回调不能通过，获取不了用户信息)  菜单：接口权限->网页账号->修改
 *
 *  7. (技术注意) code 有效期为一次  
 *
 *  8. (技术注意) access_token 有两种，不要混了,一种是全局，一种是用户access_token,需要用户access_token才能获取用户信息,全局access_token不可以
 *
 *  9. (技术注意) 接口请参考公众号官方手册的最新接口（存在网上教程提供的接口并不是最新，导致接口数据有误)  
 *
 *  10. (技术注意) token调用次数有限一天只有2000次，微信会两小时更新,使用时一定要缓存,否则用完就不能用其他一些微信接口了 
 *
 *  11. (技术注意) 建议使用微信pc端调试工具开发(官网有下载) 
 *
 *  12. (技术注意) 测试号开发者需要先关注测试号才能使用微信pc端调用工具, 正式号需要在公众号后台　开发者工具->web开发者工具 将开发者加入  
 *
 *
 *  13. (技术注意) 获取code (参考http://www.xiaohuang.cc/post/437.html) 
 *		https://open.weixin.qq.com/connect/oauth2/authorize?appid=这里是你的公众号的APPID&redirect_uri=http://www.xx.com/getcode&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect
 *		用户点击确认登录，自动跳转下面地址得到code
 *		http://www.xx.com/getcode 这个是你自己的跳转地址
 *		http://www.xx.com/getcode?code=0064f7afef7af7b395147bfe8b51f7bf&state=123
 *
 *	14. (技术注意) 通过code可以获取用户信息  (技术)
 *		$code = $_GET['code'];//获取code
 *		$weixin =  file_get_contents("https://api.weixin.qq.com/sns/oauth2/access_token?appid=这里是你的APPID&secret=这里是你的SECRET&code=".$code."&grant_type=authorization_code");//通过code换取网页授权access_token
 *		$jsondecode = json_decode($weixin); //对JSON格式的字符串进行编码
 *		$array = get_object_vars($jsondecode);//转换成数组
 *		$openid = $array['openid'];   //输出openid
 *
 *	15. (技术注意，重点) 常量url地址配置一定要加http头，微信不认不带http头的地址 (测试及技术需要注意，重要！！)
 *
 *	16. (技术注意) 压力测试php方只需要供给入参($_GET,$_POST,$_REQUEST),及出参这些参数给压力测试同学即可  (技术)
 *
 *	17. (技术注意) 如果压力测试不过，可以查看xxx.com（例子为t9测试环境) 下的xhprof日志，去查看具体哪一步占用资源,正常来说测试环境php需要开启 opcache 扩展,否则压测会占用很高的io和cpu.   (技术)
 *
 *  18. (技术注意) 使用cookie时，当前微信用户退出后，同一个手机切换微信用户，会用上一个用户的cookie,导致数据不正确 (技术)
 *
 *  19. (技术注意) 新建soa项目时，composer 的依赖版本分支要写成"^v1.0.10 || dev-master",否则git代码下载后版本不是最新。
 *
 *  20. (java技术注意) 提交接口时记得注册接品xml文件 
 *
 *  21. (技术注意) 前端的入参尽可能少，尽可能php能获取的参数就不让前端传,可以减少后期需求更改对接的成本
 *
 *  22. (前端注意) 单页面逻辑，尽量不要将过多的模快放在一个页面里然后让php传模块参数，尽量分成多个页面，否则后期需求变更，或流程变更，对接这些模块逻辑将非常费时间，也容易的出错，并且其他PHP接入时，读代码也会非常困惑,可读性差.
 *
 *
 */
?>
