var SerialPort = require('serialport');
// Note: this cannot work within Docker on a Node-based image on Windows, since only Windows containers have access to COM ports, and only within the procedure explained underneath
// https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/hardware-devices-in-containers
// 86E0D1E0-8089-11D0-9CE4-08003E301F73 --> COM ports
// docker run --isolation=process --device="class/{interface class GUID}" mcr.microsoft.com/windows/servercore:1809
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