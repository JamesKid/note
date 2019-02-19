<?php
	//web获取用户openid并保存状态
	public function getOpenidByWeb(){
		$password = 'password';
		$cookieName = Yii::app()->params['wxuserCookie'];
		$expTime = 3600*24;

		try{
			if(!empty($_COOKIE[$cookieName])){
				$auth = json_decode($_COOKIE[$cookieName], true);

				if(!empty($auth['openid']) || !empty($auth['time']) || !empty($auth['sign'])){
					if(abs($auth['time'] - time()) <= $expTime){
						if(sha1($auth['openid'].$auth['time'].$password) == $auth['sign']){
							return $auth['openid'];
						}
					}
				}
			}elseif(!empty($_REQUEST['code'])){
				$token = $this->getToken();
				$url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.Yii::app()->params['wx']['appid'].
					   '&secret='.Yii::app()->params['wx']['appsecret'].'&code='.$_REQUEST['code'].'&grant_type=authorization_code';
				
				$data = file_get_contents($url);
				$data = json_decode($data, true);

				if(!empty($data['openid'])){
					$time = time();
					$sign = sha1($data['openid'].$time.$password);

					$json = json_encode(array('openid'=>$data['openid'], 'time'=>$time, 'sign'=>$sign));
					setcookie($cookieName, $json, time()+$expTime, '/');

					return $data['openid'];
					die;
				}
			}
		}catch(Exception $e){
			die('System Error!');
		}

		$url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$wxurl = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.Yii::app()->params['wx']['appid'].'&redirect_uri='.urlencode($url).'&response_type=code&scope=snsapi_base&state=123#wechat_redirect';
		$this->controller->redirect($wxurl);
		exit();
	}

	//根据openid取得用户数据
	public function getUserInfoByOpenid($openid){
		$token = $this->getToken();
		$url = $userUrl = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token='.$token.'&openid='.$openid.'&lang=zh_CN';

		try{
			$data = file_get_contents($url);
			$data = json_decode($data, true);

			if(!isset($res['errcode'])){
				return $data;
			}
		}catch(Exception $e){
			return false;
		}
	}
	//获得openid
    public function getOpenid($code, $cookieEnable=true) {
		Yii::import('ext.wx.WxapiExt');
		if(!empty($code)){
			$token = WxapiExt::run()->getTokenByCode($code);
			$openid = $token['openid'];

			if($cookieEnable)setcookie("OpenidCookie",$openid,0);
		    return $openid;
		}elseif(!empty($_COOKIE["OpenidCookie"])){
			$openid = $_COOKIE["OpenidCookie"];
		    return $openid;
		}else{
			$this->controller->render('prizeinfo',array('data'=>'网络正忙请重新打开网页。'));
			break;
 		}
   }
	//获取token令牌
	public function getToken(){
		$cache = Yii::app()->cache;
		$key = '__WX_TOKEN__';
		$url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.Yii::app()->params['wx']['appid'].'&secret='.Yii::app()->params['wx']['appsecret'];
		
		$token = $cache->get($key);
		if($token){
			return $token;
		}else{
			$res = $this->getByCurl($url);
			
			if($res != false){
				$data = json_decode($res, true);
				if(!empty($data['access_token'])){
					$token = $data['access_token'];
					$cache->set($key, $token, 3600);
					
					return $token;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
	}
?>
