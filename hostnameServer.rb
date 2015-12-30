require 'socket'
$hostnamesToIp = Hash.new()

def serverFunc
	server = TCPServer.new 0
	puts "hostname server socket #{server.addr[1]}"
	STDOUT.flush
	loop do
  		client = server.accept    # Wait for a client to connect
  		client.puts "hello from hostname"
  		puts client.gets
  		STDOUT.flush
	end
end

def clientFunc (portToConnect)
	server = TCPSocket.new 'localhost', portToConnect
	line = server.gets
 	puts line
 	server.close
end

def driver()
	clientThread = Thread.new{clientFunc}
	serverThread = Thread.new(serverFunc)
	serverThread.join
	clientThread.join
end

driver