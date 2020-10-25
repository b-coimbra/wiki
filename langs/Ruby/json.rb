require 'uri'
require 'open-uri'
require 'json'

# NOTE: required due to ssl connection issues
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

argu = gets.chomp
uri = JSON.parse(open("https://api.github.com/users/#{URI::encode(argu)}").read)
name = uri["login"]
url = uri["url"]
puts "#{name} Github is #{url}"
