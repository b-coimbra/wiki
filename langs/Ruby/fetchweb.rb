require 'socket'

host = 'www.tutorialspoint.com'
port = 80
path = "/ruby/ruby_socket_programming.htm"
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
headers,body = response.split("\r\n\r\n", 2)
print body
