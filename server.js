const http = requirt('http');

const hostname = '0.0.0.0';
const port = 3000;

const sever = htpp.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Zeet Node');
});

server.listen(port, hostname, () => {
  console.log(`Server Running at http://${hostname}:${port}/`);
});
