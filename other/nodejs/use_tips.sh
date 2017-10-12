# ================================JamesKid============================== 
# @author      : JamesKid  
# @description : This is not about nodejs 
# @change      :
# ======================================================================

# install
    # install
        # 方法一
            yum install gcc-c++ openssl-devel  # install depends
            wget http://nodejs.org/dist/node-v0.6.4.tar.gz    # get file
            tar zxvf node-v0.6.4.tar.gz
            cd node-v0.6.4.tar.gz
            ./configure 
            make && make install  # install 
        # 方法二
            https://nodejs.org/dist/  # 查看最新版本
            wget https://nodejs.org/dist/v8.6.0/node-v8.6.0-linux-x86.tar.gz # 获取已编译好的版本
            tar zxvf node-v8.6.0-linux-x86.tar.gz
            cd node-v8.6.0-linux-x86
            cd bin
            cp node /usr/bin/

            # zsh 环境变量引用
            vim /etc/myconf/my-zsh.sh
                # 添加/usr/local/node/bin  作为环境变量

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

# doc (文档)
    # web 

# language (语法)

    # npm (包管理工具)
        # web (公共包地址)
            https://www.npmjs.com/
        # 创建模块
            npm init      # 自动创建package.json 文件
            npm install   # 安装package.json

        # 常用命令
            npm -v                 # 显示版本，检查npm 是否正确安装。
            npm install express    # 本地安装express模块
            npm install -g express # 全局安装express模块
            npm list               # 列出已安装模块
            npm list express       # 列出已安装模块版本
            npm show express       # 显示模块详情
            npm update             # 升级当前目录下的项目的所有模块
            npm update express     # 升级当前目录下的项目的指定模块
            npm update -g express  # 升级全局安装的express模块
            npm uninstall express  # 删除指定的模块
            npm adduser            # 添加用户
            npm publish            # 发布模块

        # 版本号
            X.Y.Z
            1. 如果只是修复bug，需要更新Z位。
            2. 如果是新增了功能，但是向下兼容，需要更新Y位。
            3. 如果有大变动，向下不兼容，需要更新X位。

        #  使用淘宝的cnpm 
            npm install -g cnpm --registry=https://registry.npm.taobao.org
            cnpm install [name]

    # module (模块)
        # 引用模块 require
            var http = require('http');
            # 常用模块
                fs    # 操作文件及文件系统
                http  # http服务器及客户端口
                url   # 
                event # 事件模块
                Express  # 轻量灵活的Nodejs Web应用框架
                Log4js   # 日志
                forever  # nodejs的守护进程，能够启动，停止，重启我们的app应用

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
        on   # 为指定事件注册监听器
        once # 为指定事件注册一个单次监听器，即 监听器最多只会触发一次，触发后立刻解除该监听器。  
        removeListener  #  移除指定事件的某个监听器，监听器必须是该事件已经注册过的监听器。
                        # 它接受两个参数，第一个是事件名称，第二个是回调函数名称。
            # example
                var callback = function(stream) {
                    console.log('someone connected!');
                };
                server.on('connection', callback);
                server.removeListener('connection', callback);

        removeAllListeners([event]) # 移除所有事件的所有监听器， 如果指定事件，则移除指定事件的所有监听器。
        setMaxListeners(n)  # 默认情况下， EventEmitters 如果你添加的监听器超过 10 个就会输出警告信息。 
                            # setMaxListeners 函数用于提高监听器的默认限制的数量。
        listeners(event)    # 返回指定事件的监听器数组。
        listenerCount(emitter, event)   # 返回指定事件的监听器数量。

        
    # function (函数)
        # example
            function say(word) {
                console.log(word);
            }
            function execute(someFunction, value) {
                someFunction(value);
            }
            execute(say, "Hello");
        # functions
            # console
                # use 
                    console.log([data][, ...])   # 向标准输出流打印字符并以换行符结束。
                    console.info([data][, ...])  # 该命令的作用是返回信息性消息，这个命令与console.log差别并不大，
                                                 # 除了在chrome中只会输出文字外，其余的会显示一个蓝色的惊叹号。
                    console.error([data][, ...]) # 输出错误消息的。控制台在出现错误时会显示是红色的叉子。 
                    console.warn([data][, ...])  # 输出警告消息。控制台出现有黄色的惊叹号。 
                    console.dir(obj[, options])  # 用来对一个对象进行检查（inspect），并以易于阅读和打印的格式显示。 
                    console.time(label)          # 输出时间，表示计时开始。
                    console.timeEnd(label)       # 结束时间，表示计时结束。
                    console.trace(message[, ...]) # 当前执行的代码在堆栈中的调用路径，这个测试函数运行很有帮助，
                                                  # 只要给想测试的函数里面加入 console.trace 就行了。
                    console.assert(value[, message][, ...])  # 用于判断某个表达式或变量是否为真，接收两个参数，
                                                             # 第一个参数是表达式，第二个参数是字符串。只有当第一个参数
                                                             # 为false，才会输出第二个参数，否则不会有任何结果。
                # example 
                    console.log('Hello world'); 
                    console.log('byvoid%diovyb'); 
                    console.log('byvoid%diovyb', 1991); 

                    // 输出

                    Hello world 
                    byvoid%diovyb 
                    byvoid1991iovyb 

            # process
                # common use (常用)
                    process.cwd();         # 输出当前目录
                    process.version();     # 输出当前版本
                    process.memoryUsage(); # 输出内存使用状况
                    process.execPath;      # 获取执行路径
                    process.platform;      # 获取平台信息
                # attribute (属性)
                    stdout    # 标准输出流。
                    stderr    # 标准错误流
                    stdin     # 标准输入流
                    argv      # argv 属性返回一个数组，由命令行执行脚本时的各个参数组成。 
                              # 它的第一个成员总是node，第二个成员是脚本文件名，其余成员是脚本文件的参数。
                    execPath  # 返回执行当前脚本的 Node 二进制文件的绝对路径。
                    execArgv  # 返回一个数组，成员是命令行下执行脚本时，在Node可执行文件与脚本文件之间的命令行参数。
                    env       # 返回一个对象，成员为当前 shell 的环境变量
                    exitCode  # 进程退出时的代码，如果进程优通过 process.exit() 退出，不需要指定退出码。
                    version   # node版本
                    versions  # 一个属性，包含了 node 的版本和依赖.
                    config    # 一个包含用来编译当前 node 执行文件的 javascript 配置选项的对象。它与运行 
                              # ./configure 脚本生成的 "config.gypi" 文件相同。
                    pid       # 当前进程的进程号
                    title     # 进程名，默认值为"node"，可以自定义该值。
                    arch      # 当前 CPU 的架构：'arm'、'ia32' 或者 'x64'。
                    platform  # 运行程序所在的平台系统 'darwin', 'freebsd', 'linux', 'sunos' 或 'win32'
                    mainModule # require.main 的备选方法。不同点，如果主模块在运行时改变，
                               # require.main可能会继续返回老的模块。可以认为，这两者引用了同一个模块。
                    
                # functions (方法)
                    abort()       # 这将导致 node 触发 abort 事件。会让 node 退出并生成一个核心文件。
                    chdir(directory)  # 改变当前工作进程的目录，如果操作失败抛出异常。
                    cwd()         # 返回当前进程的工作目录
                    exit([code])  # 使用指定的 code 结束进程。如果忽略，将会使用 code 0。
                    getgid()      #  获取进程的群组标识（参见 getgid(2)）。获取到得时群组的数字 id，而不是名字。仅POSIX可用
                    setgid(id)    #  设置进程的群组标识（参见 setgid(2)）。可以接收数字 ID 或者群组名。
                                  # 如果指定了群组名，会阻塞等待解析为数字 ID 。
                    getgroups()   # 返回进程的群组 iD 数组。POSIX 系统没有保证一定有，但是 node.js 保证有。
                    setgroups(groups)   # 设置进程的群组 ID。这是授权操作，所有你需要有 root 权限，或者有 CAP_SETGID 能力。
                    initgroups(user, extra_group)  # 读取 /etc/group ，并初始化群组访问列表，使用成员所在的所有群组。
                                                   # 这是授权操作，所有你需要有 root 权限，或者有 CAP_SETGID 能力。
                    kill(pid[, signal])  # 发送信号给进程. pid 是进程id，并且 signal 是发送的信号的字符串描述。
                                         # 信号名是字符串，比如 'SIGINT' 或 'SIGHUP'。如果忽略，信号会是 'SIGTERM'。
                    memoryUsage()   # 返回一个对象，描述了 Node 进程所用的内存状况，单位为字节。
                    nextTick(callback)   # 一旦当前事件循环结束，调用回到函数。
                    umask([mask]) # 设置或读取进程文件的掩码。子进程从父进程继承掩码。如果mask 参数有效，返回旧的掩码。否则，
                    uptime()   # 返回 Node 已经运行的秒数。
                    hrtime()   # 返回当前进程的高分辨时间，形式为 [seconds, nanoseconds]数组。它是相对于过去的任意事件。                                # 该值与日期无关，因此不受时钟漂移的影响。主要用途是可以通过精确的时间间隔，来衡量程序的性能。

    # route (路由)
                              url.parse(string).query
                                                    |
                    url.parse(string).pathname      |
                                |                   |
                                |                   |
                              ------ -------------------
          http://localhost:8888/start?foo=bar&hello=world
                                          ---       -----
                                           |          |
                                           |          |
             querystring.parse(queryString)["foo"]    |
                                                      |
                                  querystring.parse(queryString)["hello"]

    # golbal (全局对象)
        # tips
            注意： 永远使用var 定义变量以避免引入全局变量，因为全局变量会污染 命名空间，提高代码的耦合风险。
        # use 
            # 路径
                console.log( __filename );   // 输出全局变量 __filename 的值
                console.log( __dirname );    // 输出全局变量 __dirname 的值
            # 定时器
                function printHello(){
                    console.log( "Hello, World!");
                }
                // 两秒后执行以上函数
                var t = setTimeout(printHello, 2000);
                // 清除定时器
                clearTimeout(t);
                // 每两秒执行一次pringHello
                setInterval(printHello,2000);


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
        


