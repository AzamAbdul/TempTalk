require 'socket'
require 'json'
$hostnamesToIp = Hash.new()
$username = ""
module MessageType
 	USERNAMECHECK = 1
end

def createMessage(message_type,payload)
	message =""
	if(message_type==MessageType::USERNAMECHECK)

		message= JSON.generate({"type"=>MessageType::USERNAMECHECK,"username"=>payload})
	end
	return message
end

def clientFunc
	puts "please enter hostname server ip"
	STDOUT.flush
	host_ip = STDIN.gets
	puts "Please enter hostname Server port"
	STDOUT.flush
	port = STDIN.gets 
	puts "here "



	server = TCPSocket.new host_ip.strip, port.strip
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
 		response = clientSocket.gets
 		puts "response #{response}" 
 		username_created = true
 	end
end
def driver()
	clientThread = Thread.new{clientFunc}
	
	clientThread.join
end

driver