// 剪切缓冲区
var buffer1 = new Buffer('runoob');
var buffer2 = buffer1.slice(0,2);
console.log("buffer2 content: " + buffer2.toString());
