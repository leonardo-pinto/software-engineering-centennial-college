const connect = require("connect");

const app = connect();

function logger(req, res, next) {
  console.log("I am the logger");
  next();
}

function helloWorld(req, res, next) {
  res.setHeader("Content-Type", "text/plain");
  res.end("Hello World from connect");
}

function goodByeWorld(req, res, next) {
  res.setHeader("Content-Type", "text/plain");
  res.end("Goodbye World from connect");
}

function test(req, res, next) {
  res.setHeader("Content-Type", "text/plain");
  console.log(JSON.stringify(req.method));
  res.end("teste");
}
app.use(logger);
app.use("/good", helloWorld);
app.use("/goodbye", goodByeWorld);
app.use("/", test);
app.listen(3000);
console.log("Server running at 3000");
// const http = require("http");

// const port = 3000;
// http
//   .createServer((_req, res) => {
//     res.writeHead(200, {
//       "Content-Type": "text/plain",
//     });
//     res.end("Hello world");
//   })
//   .listen(port);

// console.log(`Server running at http://localhost:${port}`);
