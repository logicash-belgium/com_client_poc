var SerialPort = require('serialport');
const port = new SerialPort('COM1', {baudRate: 9600});

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

io.on('connection', function(socket){
  socket.on('pos message', function(msg){
    port.write("0C","hex");
    port.write(msg);
  });
  
  socket.on('disconnect', function(){
  });
});

http.listen(3001, function(){
  console.log('listening on *:3001');
});