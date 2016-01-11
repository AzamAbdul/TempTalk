module MessageType
 	USERNAMECHECK = 1
 	USERNAMERESPONSE = 2 
end
require 'json'
class Message

	def initialize(message_type,payloadHash)
		@message_type = message_type
		@payloadHash = payloadHash
	end

	def serialize()
		return JSON.generate("message_type"=>@message_type, "payload" => JSON.generate(@payloadHash))
	end

	def self.loadMessage(message_json)
		half_load = JSON.load(message_json)
		return Message.new(half_load["message_type"], JSON.load(half_load["payload"]))
	end
end

a =Message.new(MessageType::USERNAMECHECK, {"username" => "azam"})
puts a.serialize
b =Message.loadMessage(a.serialize)
puts "#{b.serialize}"