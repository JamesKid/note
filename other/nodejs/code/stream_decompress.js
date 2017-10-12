var fs = require("fs");
var zlib = require('zlib');

// 解压 input.txt.gz 文件为 input.txt
fs.createReadStream('file/test.txt.gz')
.pipe(zlib.createGunzip())
.pipe(fs.createWriteStream('file/test.txt'));

console.log("文件解压完成。");
