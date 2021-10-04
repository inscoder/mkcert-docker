const https = require('https');
const fs = require('fs');

const options = {
  key: fs.readFileSync( 'localhost+2-key.pem' ),
  cert: fs.readFileSync( 'localhost+2.pem' )
};

https.createServer(options, (req, res) => {
  res.writeHead(200);
  res.end('hello world\n');
}).listen(8080);
