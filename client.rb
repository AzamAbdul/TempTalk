require 'socket'

def clientFunc
	server = TCPSocket.new 'localhost', 39932
	
end
def driver
	clientFunc()
end

t=Thread.new{driver}
t.join