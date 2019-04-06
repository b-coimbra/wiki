#!/usr/bin/env ruby
# encoding: utf-8

# TODO: find and replace program

require 'open-uri'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

uri = JSON.parse(open("https://baconipsum.com/api/?type=all-meat&paras=3&start-with-lorem=1&format=json").read)
text = uri[0]

begin
    file = File.new("text.txt", 'w+') unless text == ''
    file << text
rescue IOError => e
    raise "Could not generate file.", e
ensure
    file.close unless file.nil?
end

=begin

puts "ORIGINAL: #{text}"
puts "Find: "
find = gets.chomp.to_s
if find != nil && find != ''
    puts "Replace with: "
    replace = gets.chomp.to_s

    modified = text.gsub(/#{find}/, replace) unless replace == '' && replace == nil
    print modified
else
    puts "Nothing has been changed."
end

=end
