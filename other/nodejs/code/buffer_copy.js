// 拷贝一个缓冲区
var buffer1 = new Buffer('ABC');
var buffer2 = new Buffer(3);
buffer1.copy(buffer2);
console.log("buffer2 content: " + buffer2.toString());
