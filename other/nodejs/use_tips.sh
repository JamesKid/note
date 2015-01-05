# install
	# install
		wget http://nodejs.org/dist/node-v0.6.4.tar.gz  
		tar zxvf node-v0.6.4.tar.gz
		cd node-v0.6.4.tar.gz
		./configure 
		make && make install  # install 
		node -v  # check the version
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



