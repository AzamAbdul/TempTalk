require 'socket'
$hostnamesToIp = Hash.new()

def serverFunc
	server = TCPServer.new 0
	puts server.addr[1]
	STDOUT.flush
	loop do
  		client = server.accept    # Wait for a client to connect
 		#first establish temp username with user
 		line = server.gets
 		puts line
	end
end

def driver()
	serverFunc
end

t = Thread.new{driver}
t.join