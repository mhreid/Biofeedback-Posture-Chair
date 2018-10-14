var MongoClient = require('mongodb').MongoClient;
var assert = require('assert');
var express = requirei('express');
var app = express();

var collection;
var url = 'mongodb://localhost:27017/smartChair';

var sdata = {};

MongoClient.connect(url, function(err, db) {
  assert.equal(null, err);
  console.log("Connected correctly to DB server");
  collection = db.collection('sensorDatav10');
});

var server  = app.listen(process.env.PORT || 6789, function() {
  console.log('Listening on port %d', server.address().port);
});

var SerialPort = require('serialport');

var serialPort = new SerialPort("", {baudrate: 9600, parser: SerialPort.parsers.readLine('\n')});

serialPort.on('data', function(d) {
  sdata = JSON.parse(d);
})

var io = require('socket.io').listen(server);

io.sockets.on('connection', function(socket) {
  console.log('CONNECTION');

  socket.on('hello', function() {
    console.log('received hello');
    socket.emit('helloback');
  });

  setInterval(function() {socket.emit('sensorsData', sdata); console.log(sdata);}, 1000);

})
