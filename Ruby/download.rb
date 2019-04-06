require 'net/http'

Net::HTTP.start('www.google.com') {|http|
    resp = http.get("/yourfile.xml")
    open("yourfile.xml", 'w+') {|file|
        file.write(resp,body)
    }
}
