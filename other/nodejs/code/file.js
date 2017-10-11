// 获取文件
var fs = require("fs");

fs.readFile('file/test.txt', function (err, data) {
    if (err) return console.error(err);
    console.log(data.toString());
});

console.log("程序执行结束!");
