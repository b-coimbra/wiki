require 'open-uri'
require 'uri'
require 'json'
# NOTE: required due to ssl connection issues
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

argu = gets.chomp
url = JSON.parse(open("http://api.duckduckgo.com/?q=#{argu}&format=json&pretty=1").read)
url["RelatedTopics"].each do |res|
   link = res["FirstURL"]
   text = res["Text"]
   text = "#{text[0..64]} ..." if text.length > 64
end
