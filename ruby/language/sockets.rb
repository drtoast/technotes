require 'socket'

host = '127.0.0.1'
port = 12349

# server side
server = TCPServer.new(host, port)
client = server.accept

# client side
socket = TCPSocket.open(host, port)

# server side
client.puts "hello world"

# client side
socket.gets
# => "hello world\n"
socket.puts "hello back"

# server side
client.gets
# => "hello back\n"

# client side
client.write "blah"
client.write "blah"

# server side
client.recv(8)
# => "blahblah"
