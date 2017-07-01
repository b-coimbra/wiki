require 'socket'

host = "52.201.84.91"
port = "5000"

s = TCPSocket.new(host, port)
s.write "m"=>{
            "t"=>"test",
            "u"=>"0"
        }.to_json
s.close
