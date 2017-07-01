#!/usr/bin/env ruby
# encoding: utf-8

# TODO: ping tool for windows

system('title PING TOOL')

puts "Fill the parameters below: "

# *- PARAMETERS -*
print "Enter ip: "
# IP
ip = gets.chomp
print "Request count: "
# -n
count = gets.chomp
print "Byte size (max 65500): "
# -l
byte = gets.chomp
print "Timeout (in seconds): "
# -w
timeout = gets.chomp
print "How many processes?: "
# cmd processes
processes = gets.chomp

1.upto(processes) do
    system("ping #{ip} -l#{byte} -n#{count} -w#{timeout} && start cmd")
end
