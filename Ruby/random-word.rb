#!/usr/bin/env ruby
# encoding: utf-8

require 'net/http'

# TODO: generate random word

url = URI.parse('http://randomword.setgetgo.com/get.php')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
}
puts res.body
