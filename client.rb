require 'socket'
require 'json'
$hostnamesToIp = Hash.new()
$username = ""
module MessageType
 	USERNAMECHECK = 1
end
def serverFunc
	server = TCPServer.new 0
	# puts "client server socket #{server.addr[1]}"
	# STDOUT.flush
	loop do
  		client = server.accept    # Wait for a client to connect
  	
	end
end
def createMessage(message_type,payload)
	message =""
	if(message_type==MessageType::USERNAMECHECK)

		message= JSON.generate({"type"=>MessageType::USERNAMECHECK,"username"=>payload})
	end
	puts message
	return message
end

def clientFunc
	puts "Please enter hostname Server port"
	port = STDIN.gets 
	puts "here "
	STDOUT.flush
	server = TCPSocket.new 'localhost', port.strip
	puts "connected to port #{port} on the hostname server "
	STDOUT.flush
	establish_username(server)
 
 	sleep(10000)
end
def establish_username(clientSocket)
	username_created= false
	while(not(username_created))
		puts "Please enter username"
 		username = STDIN.gets.strip
 		message = createMessage(MessageType::USERNAMECHECK, username)
 		clientSocket.puts(message)
 		puts "here"
 		username_created = true
 	end
end
def driver()
	clientThread = Thread.new{clientFunc}
	serverThread = Thread.new(serverFunc)
	serverThread.join
	clientThread.join
end

driver