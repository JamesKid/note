<?php
/*
 share 到vimkid 网

1_单例模式

特点: 1. 一个类在整个应用中只有一个实例
      2. 类必须自行创建这个实例
      3. 必须自行向整个系统提供这个实例

缺点: 1.
优点: 1.
 */
class man {
    private static $_instance;
    private function __construct() {
        echo 'i am instantiation';
    }
    //单例方法　
    public static function get_instance() {
        var_dump(isset(self::$_instance));
        if(!isset(sefl::$_instance)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }
    private function __clone() {
        trigger_error('Clone is not allow' , E_USER_ERROR);
    }
    function test() {
        echo ("test");
    }
}
#　调用　
$test = man::get_instance();
$test = man::get_instance();
$test->test();
?>
