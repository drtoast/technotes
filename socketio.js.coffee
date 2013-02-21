// http://socket.io/


// SERVER: (node.js)
io = require('socket.io').listen(80)

io.sockets.on 'connection', (socket) ->
  socket.emit 'news',
    hello: 'world'
  socket.on 'my other event', (data) ->
    console.log(data)

// CLIENT:
socket = io.connect("http://localhost")
socket.on "news", (data) ->
  console.log data
  socket.emit "my other event",
    my: "data"
