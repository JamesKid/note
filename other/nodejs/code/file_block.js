// 阻塞式获取文件
var fs = require("fs");
var data = fs.readFileSync('file/test.txt');
console.log(data.toString());
console.log("程序执行结束!");
