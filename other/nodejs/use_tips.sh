# ================================JamesKid============================== 
# @author      : JamesKid  
# @description : This is not about nodejs 
# @change      :
# ======================================================================

# useful web 
    # less
        http://lesscss.cn    # less 官网

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
        # modules
            # OS 模块
                # desc
                    # 提供基本的系统操作函数 
                    var os = require("os")   # 引用
                # 方法
                    os.tmpdir()     # 返回操作系统的默认临时文件夹。
                    os.endianness() # 返回 CPU 的字节序，可能的是 "BE" 或 "LE"。
                    os.hostname()   # 返回操作系统的主机名。
                    os.type()       # 返回操作系统名
                    os.platform()   # 返回操作系统名
                    os.arch()       # 返回操作系统 CPU 架构，可能的值有 "x64"、"arm" 和 "ia32"。
                    os.release()    # 返回操作系统的发行版本。
                    os.uptime()     # 返回操作系统运行的时间，以秒为单位。
                    os.loadavg()    # 返回一个包含 1、5、15 分钟平均负载的数组。
                    os.totalmem()   # 返回系统内存总量，单位为字节。
                    os.freemem()    # 返回操作系统空闲内存量，单位是字节。
                    os.cpus()       # 返回一个对象数组，包含所安装的每个 CPU/内核的信息：型号、速度（单位 MHz）、时
                                    # 间（一个包含 user、nice、sys、idle 和 irq 所使用 CPU/内核毫秒数的对象）。
                    os.networkInterfaces()   # 获得网络接口列表。

            # Path 模块
                # desc
                    # 提供了处理和转换文件路的工具。
                    var os = require("path")   # 引用
                # params (属性)
                    path.sep       # 平台的文件路径分隔符，'\\' 或 '/'。
                    path.delimiter # 平台的分隔符, ; or ':'.
                    path.posix     # 提供上述 path 的方法，不过总是以 posix 兼容的方式交互。
                    path.win32     # 提供上述 path 的方法，不过总是以 win32 兼容的方式交互。

                # function(方法)
                    path.normalize(p)  # 规范化路径，注意'..' 和 '.'。
                    path.join([path1][, path2][, ...])  # 用于连接路径。该方法的主要用途在于，会正确使用当前系统的路径分隔符，
                                                        # Unix系统是"/"，Windows系统是"\"。
                    path.resolve([from ...], to)     # 将 to 参数解析为绝对路径。
                    path.isAbsolute(path)            # 判断参数 path 是否是绝对路径。
                    path.relative(from, to)          # 用于将相对路径转为绝对路径。
                    path.dirname(p)         # 返回路径中代表文件夹的部分，同 Unix 的dirname 命令类似。
                    path.basename(p[, ext])  # 返回路径中的最后一部分。同 Unix 命令 bashname 类似。
                    path.extname(p)     # 返回路径中文件的后缀名，即路径中最后一个'.'之后的部分。
                                        # 如果一个路径中并不包含'.'或该路径只包含一个'.' 且这个'.'为路径
                                        # 的第一个字符，则此命令返回空字符串。
                    path.parse(pathString)   # 返回路径字符串的对象。
                    path.format(pathObject)  # 从对象中返回路径字符串，和 path.parse 相反。
                
                    
            # Net 模块
                # web 
                    http://www.runoob.com/nodejs/nodejs-net-module.html
                # desc
                    # 用于底层的网络通信。提供了服务端和客户端的的操作。
                    var net = require("net")   # 引用
                # functions(方法)
                    net.createServer([options][, connectionListener]) # 创建一个 TCP 服务器。参数 connectionListener
                        # 自动给 'connection' 事件创建监听器。
                    net.connect(options[, connectionListener])   # 返回一个新的 'net.Socket'，并连接到指定的地址和端口。 
                                                                 # 当 socket 建立的时候，将会触发 'connect' 事件。
                    net.createConnection(options[, connectionListener])   # 创建一个到端口 port 和 主机 host的 
                                                                          # TCP 连接。 host 默认为 'localhost'。
                    net.connect(port[, host][, connectListener])  # 创建一个端口为 port 和主机为 host的 TCP 连接 。
                        # host 默认为 'localhost'。参数 connectListener 将 会作为监听器添加到 'connect' 事件。返回 'net.Socket'。
                    net.createConnection(port[, host][, connectListener])   # 创建一个端口为 port 和主机为 host的 TCP 连接 。
                        # host 默认为 'localhost'。参数 connectListener 将会作为监听器添加到 'connect' 事件。返回 'net.Socket'。
                    net.connect(path[, connectListener])  # 创建连接到 path 的 unix socket 。参数 connectListener 将会作
                        # 为监听器添加到 'connect' 事件上。返回 'net.Socket'。
                    net.createConnection(path[, connectListener])  # 创建连接到 path 的 unix socket 。参数 
                        # connectListener 将会作为监听器添加到 'connect' 事件。返回 'net.Socket'。
                    net.isIP(input)  # 检测输入的是否为 IP 地址。 IPV4 返回 4， IPV6 返回 6，其他情况返回 0。
                    net.isIPv4(input) # 如果输入的地址为 IPV4， 返回 true，否则返回 false。
                    net.isIPv6(input) # 如果输入的地址为 IPV6， 返回 true，否则返回 false。

            # DNS 模块
                # web 
                    http://www.runoob.com/nodejs/nodejs-dns-module.html
                # desc
                    用于解析域名。

            # Domain 模块
                # web 
                    http://www.runoob.com/nodejs/nodejs-domain-module.html
                # desc
                    简化异步代码的异常处理，可以捕捉处理try catch无法捕捉的。


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


    # fs (文件系统)
        # example
            varfs = require('fs'); 
            fs.readFile('content.txt', function(err, data) { 
                if(err) { 
                    console.error(err); 
                } else{ 
                    console.log(data); 
                } 
            }); 
        # stat
            stats.isFile()      # 如果是文件返回 true，否则返回 false。
            stats.isDirectory() # 如果是目录返回 true，否则返回 false。
            stats.isBlockDevice()    # 如果是块设备返回 true，否则返回 false。
            stats.isCharacterDevice() # 如果是字符设备返回 true，否则返回 false。
            stats.isSymbolicLink()   # 如果是软链接返回 true，否则返回 false。
            stats.isFIFO()           # 如果是FIFO，返回true，否则返回 false。FIFO是UNIX中的一种特殊类型的命令管道。
            stats.isSocket()         # 如果是 Socket 返回 true，否则返回 false。

        # options
            fs.rename(oldPath, newPath, callback)  # 异步 rename().回调函数没有参数，但可能抛出异常。
            fs.ftruncate(fd, len, callback)      # 异步 ftruncate().回调函数没有参数，但可能抛出异常。
            fs.ftruncateSync(fd, len)            # 同步 ftruncate()
            fs.truncate(path, len, callback)     # 异步 truncate().回调函数没有参数，但可能抛出异常。
            fs.truncateSync(path, len)           # 同步 truncate()
            fs.chown(path, uid, gid, callback)   # 异步 chown().回调函数没有参数，但可能抛出异常。
            fs.chownSync(path, uid, gid)         # 同步 chown()
            fs.fchown(fd, uid, gid, callback)    # 异步 fchown().回调函数没有参数，但可能抛出异常。
            fs.fchownSync(fd, uid, gid)          # 同步 fchown()
            fs.lchown(path, uid, gid, callback)  # 异步 lchown().回调函数没有参数，但可能抛出异常。
            fs.lchownSync(path, uid, gid)        # 同步 lchown()
            fs.chmod(path, mode, callback)       # 异步 chmod().回调函数没有参数，但可能抛出异常。
            fs.chmodSync(path, mode)             # 同步 chmod().
            fs.fchmod(fd, mode, callback)        # 异步 fchmod().回调函数没有参数，但可能抛出异常。
            fs.fchmodSync(fd, mode)              # 同步 fchmod().
            fs.lchmod(path, mode, callback)      # 异步 lchmod().回调函数没有参数，但可能抛出异常。Only available on Mac OS X.
            fs.lchmodSync(path, mode)            # 同步 lchmod().
            fs.stat(path, callback)  # 异步 stat(). 回调函数有两个参数 err, stats，stats 是 fs.Stats 对象。
            fs.lstat(path, callback)  # 异步 lstat(). 回调函数有两个参数 err, stats，stats 是 fs.Stats 对象。
            fs.fstat(fd, callback)    # 异步 fstat(). 回调函数有两个参数 err, stats，stats 是 fs.Stats 对象。
            fs.statSync(path)         # 同步 stat(). 返回 fs.Stats 的实例。
            fs.lstatSync(path)        # 同步 lstat(). 返回 fs.Stats 的实例。
            fs.fstatSync(fd)          # 同步 fstat(). 返回 fs.Stats 的实例。
            fs.link(srcpath, dstpath, callback)  # 异步 link().回调函数没有参数，但可能抛出异常。
            fs.linkSync(srcpath, dstpath)   # 同步 link().
            fs.symlink(srcpath, dstpath[, type], callback)  # 异步 symlink().回调函数没有参数，但可能抛出异常。 
                                                            # type 参数可以设置为 'dir', 'file', 或 'junction' (默认为 'file') 。
            fs.symlinkSync(srcpath, dstpath[, type])   # 同步 symlink().
            fs.readlink(path, callback)    # 异步 readlink(). 回调函数有两个参数 err, linkString。
            fs.realpath(path[, cache], callback)   # 异步 realpath(). 回调函数有两个参数 err, resolvedPath。
            fs.realpathSync(path[, cache])    # 同步 realpath()。返回绝对路径。
            fs.unlink(path, callback)  # 异步 unlink().回调函数没有参数，但可能抛出异常。
            fs.unlinkSync(path)        # 同步 unlink().
            fs.rmdir(path, callback)   # 异步 rmdir().回调函数没有参数，但可能抛出异常。
            fs.rmdirSync(path)         # 同步 rmdir().
            fs.mkdir(path[, mode], callback)  # S异步 m[ir(2).回调函数没有参数，但可能抛出异常。 mode defaults to 0777.
            fs.mkdirSync(path[, mode]) #  同步 mkdir().
            fs.readdir(path, callback) # 异步 readdir(3). 读取目录的内容。
            fs.readdirSync(path)       # 同步 readdir().返回文件数组列表。
            fs.close(fd, callback)     # 异步 close().回调函数没有参数，但可能抛出异常。
            fs.closeSync(fd)           # 同步 close().
            fs.open(path, flags[, mode], callback)   # 异步打开文件。
            fs.openSync(path, flags[, mode])    # 同步 version of fs.open().
            fs.utimes(path, atime, mtime, callback) 
            fs.utimesSync(path, atime, mtime)   # 修改文件时间戳，文件通过指定的文件路径。
            fs.futimes(fd, atime, mtime, callback) 
            fs.futimesSync(fd, atime, mtime)    # 修改文件时间戳，通过文件描述符指定。
            fs.fsync(fd, callback)              # 异步 fsync.回调函数没有参数，但可能抛出异常。
            fs.fsyncSync(fd)                    # 同步 fsync.
            fs.write(fd, buffer, offset, length[, position], callback) # 将缓冲区内容写入到通过文件描述符指定的文件。
            fs.write(fd, data[, position[, encoding]], callback)  # 通过文件描述符 fd 写入文件内容。
            fs.writeSync(fd, buffer, offset, length[, position]) # 同步版的 fs.write()。
            fs.writeSync(fd, data[, position[, encoding]])       # 同步版的 fs.write().
            fs.read(fd, buffer, offset, length, position, callback)  # 通过文件描述符 fd 读取文件内容。
            fs.readSync(fd, buffer, offset, length, position)  # 同步版的 fs.read.
            fs.readFile(filename[, options], callback)  # 异步读取文件内容。
            fs.readFileSync(filename[, options])
            fs.writeFile(filename, data[, options], callback)   # 异步写入文件内容。
            fs.writeFileSync(filename, data[, options])  # 同步版的 fs.writeFile。
            fs.appendFile(filename, data[, options], callback)  # 异步追加文件内容。
            fs.appendFileSync(filename, data[, options])  # The 同步 version of fs.appendFile.
            fs.watchFile(filename[, options], listener)  # 查看文件的修改。
            fs.unwatchFile(filename[, listener])   # 停止查看 filename 的修改。
            fs.watch(filename[, options][, listener])  # 查看 filename 的修改，filename 可以是文件或目录。
                                                       # 返回 fs.FSWatcher 对象。
            fs.exists(path, callback)     # 检测给定的路径是否存在。
            fs.existsSync(path)    # 同步版的 
            fs.exists.
            fs.access(path[, mode], callback)  # 测试指定路径用户权限。
            fs.accessSync(path[, mode])        # 同步版的 fs.access。
            fs.createReadStream(path[, options])  # 返回ReadStream 对象。
            fs.createWriteStream(path[, options]) # 返回 WriteStream 对象。
            fs.symlink(srcpath, dstpath[, type], callback)  # 异步 symlink().回调函数没有参数，但可能抛出异常。

    # GET/POST请求


# use 
    # learn web 
        http://www.csdn.net/article/2013-08-28/2816731-absolute-beginners-guide-to-nodejs
        http://www.w3cschool.cc/nodejs/nodejs-module-system.html
        


