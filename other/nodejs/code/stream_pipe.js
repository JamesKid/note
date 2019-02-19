var fs = require("fs");

// 创建一个可读流
var readerStream = fs.createReadStream('file/test.txt');

// 创建一个可写流
var writerStream = fs.createWriteStream('file/output.txt');

// 管道读写操作
// 读取 test.txt 文件内容，并将内容写入到 output.txt 文件中
readerStream.pipe(writerStream);

console.log("程序执行完毕");
