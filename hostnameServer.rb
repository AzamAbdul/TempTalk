require 'socket'
require 'json'
require_relative 'message'
$hostnamesToIp = Hash.new()

def serverFunc
	server = TCPServer.new 0
	puts "hostname server socket #{server.addr[1]}"
	STDOUT.flush
	loop do
  		client = server.accept    # Wait for a client to connect
  	
  		client_message= client.gets
  		message_type = parse_message_type(client_message)
  		puts client.peeraddr
  		response = process(client_message,message_type)
  		client.puts response
  		STDOUT.flush
	end
end


def parse_message_type(message)
	return JSON.load(message)["type"]
end
def process(message,message_type)
	messageHash = JSON.load(message)
	case message_type
	when MessageType::USERNAMECHECK
		return resp_usercheck(messageHash)
	end
	
end
def resp_usercheck(messageHash)
	mess_username = messageHash["username"]
	response = ""
	if($hostnamesToIp[mess_username] == nil)
		$hostnamesToIp[mess_username] = true
		responseHash = {"message_type" => MessageType::USERNAMERESPONSE , "is_valid" => true}
	else
		responseHash = {"message_type" =>  MessageType::USERNAMERESPONSE  , "is_valid" => false}

	end
	return responseHash
end
def driver()

	serverThread = Thread.new(serverFunc)
	serverThread.join

end

driver