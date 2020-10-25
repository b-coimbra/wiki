require 'socket'

port = 12345
client = UDPSocket.open
client.connect("localhost", port)
loop do
    puts "Type your message (quit | kill):"
    msg = gets
    client.send(msg,0)
    break unless !"kill,quit".include? msg.chomp
end
client.close
