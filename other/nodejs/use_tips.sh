# ================================JamesKid============================== 
# @author      : JamesKid  
# @description : This is not about nodejs 
# @change      :
# ======================================================================

# install
    # install
        yum install gcc-c++ openssl-devel  # install depends
        wget http://nodejs.org/dist/node-v0.6.4.tar.gz    # get file
        tar zxvf node-v0.6.4.tar.gz
        cd node-v0.6.4.tar.gz
        ./configure 
        make && make install  # install 
        node -v  # check the version
    # uninstall 

    # test 
        vim example.js 
            var http = require('http');   
                http.createServer(function (req, res) {   
                res.writeHead(200, {'Content-Type': 'text/plain'});   
                res.end('Hello World\n');   
            }).listen(1337, "192.168.85.xx");   
            console.log('Server running at http://192.168.85.<span style="color:#000000;">xx</span>:1337/');  
        # run 
            root@xxx#   node example.js
            firefox http://192.168.85.xx:1337 
    # update (node 版本更新)

    # module (模块安装)
        npm -v                 #显示版本，检查npm 是否正确安装。
        npm install express    #安装express模块
        npm install -g express  #全局安装express模块
        npm list               #列出已安装模块
        npm show express       #显示模块详情
        npm update             #升级当前目录下的项目的所有模块
        npm update express     #升级当前目录下的项目的指定模块
        npm update -g express  #升级全局安装的express模块
        npm uninstall express  #删除指定的模块


# language (语法)

    # module (模块)
        # 引用模块 require
            var http = require('http');
            # 常用模块
                fs   : 操作文件及文件系统
                http : http服务器及客户端口
        # 创建及调用模块
            # 方法一
                vim file.js
                    var hello = require('hello.js');
                    hello.world();
                vim hello.js
                    exports.world = function() {
                        console.log('hello world');
                    }
                # exports 是公开的模块接口
                # require 获取模块的接口
            #　方法二
                # hello.js 
                function Hello() { 
                    varname; 
                    this.setName = function(thyName) { 
                        name = thyName; 
                    }; 
                    this.sayHello = function() { 
                        console.log('Hello ' + name); 
                    }; 
                }; 
                module.exports = Hello;
                # main.js 
                var Hello = require('./hello'); 
                hello = new Hello(); 
                hello.setName('BYVoid'); 
                hello.sayHello(); 
    # event (事件)
        
    # function (函数)
        function say(word) {
            console.log(word);
        }
        function execute(someFunction, value) {
            someFunction(value);
        }
        execute(say, "Hello");
    # route (路由)
    # golbal (全局对象)
        注意： 永远使用var 定义变量以避免引入全局变量，因为全局变量会污染 命名空间，提高代码的耦合风险。
    # filesystem (文件系统)
        varfs = require('fs'); 
        fs.readFile('content.txt', function(err, data) { 
            if(err) { 
                console.error(err); 
            } else{ 
                console.log(data); 
            } 
        }); 
    # GET/POST请求


# use 
    # learn web 
        http://www.csdn.net/article/2013-08-28/2816731-absolute-beginners-guide-to-nodejs
        http://www.w3cschool.cc/nodejs/nodejs-module-system.html
        


