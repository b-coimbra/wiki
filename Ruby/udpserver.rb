require 'socket'

port = 12345
server = UDPSocket.new
server.bind("localhost", port)
puts "Server connected at #{port}, waiting ..."
loop do
    msg, sender = server.recvfrom(256)
    host = sender[3]
    puts "Host #{host} sent an UDP packet: #{msg}"
    break unless msg.chomp != "kill"
end
puts "Kill received, closing server."
server.close
