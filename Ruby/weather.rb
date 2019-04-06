require 'open-uri'
require 'json'
# NOTE: required due to ssl connection issues
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

argu = "Paris"
url = JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?q=#{URI::encode(argu)}&units=metric&appid=50a34e070dd5c09a99554b57ab7ea7e2").read)

$g = "#{url["name"]}'s weather: #{url["weather"][0]["description"]}. Temperature: #{url["main"]["temp"]}ºC with #{url["wind"]["speed"]} wind speed, #{url["main"]["humidity"]} humidity, #{url["main"]["pressure"]} pressure."

puts $g.to_s
