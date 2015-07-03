<?php
class QrAction extends WxadminPublics{
	public function run(){
		//$this->controller->layout='wx';
		$selfurl = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		if(!empty($_GET['k'])){
			$this->checkAuth($_GET['k'], 'dev');
			echo 'if';
			die;
		}else{
			$appId = Yii::app()->params['wx']['appid'];
			$timestamp = time();
			$nonceStr = time();
			$jsapi_ticket = $this->getJsapiTicket();
			$nowurl = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			$params = 'jsapi_ticket='.$jsapi_ticket.'&noncestr='.$nonceStr.'&timestamp='.$timestamp.'&url='.$nowurl;
			$signature = sha1($params);

			$this->checkAuth('', 'dev');
			$this->controller->render('/wxadmin/dev/qr', array(
				'appId'=>$appId,
				'timestamp'=>$timestamp,
				'nonceStr'=>$nonceStr,
				'signature'=>$signature, 
			));
			die;
		}
	}
}
?>

