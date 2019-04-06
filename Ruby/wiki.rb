require 'open-uri'
require 'json'
# NOTE: required due to ssl connection issues
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

argu = gets.chomp
url = URI.parse(open("http://en.wikipedia.org/w/api.php?action=opensearch&search=#{URI::encode(argu)}&format=json&limit=1").read)[0]
puts url.inspect
