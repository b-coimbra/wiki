#!/usr/bin/env ruby
# encoding: UTF-8
# USAGE: ruby search.rb <anything you want to search>
require 'win32ole'

BEGIN { abort "\e[31mUsage: ruby search.rb <site> <text>\[0m" if ARGV.empty? }

shell = WIN32OLE.new("Wscript.Shell")

link, *keystrokes = ARGV; link = "www.#{link}.com"; link =~ /www\.(.*)\.com/i
title = $1.capitalize

case RbConfig::CONFIG['host_os']
when /mswin|mingw|cygwin/im
    system "start #{link}"
when /darwin/im
    system "open #{link}"
when /linux|bsd/im
    system "xdg-open #{link}"
end

print "Opening application.. "

sleep 4

(shell.Run(title); sleep 0.5) while !shell.AppActivate(title)

print "[ok]\n"
print "Sending keystrokes.. "

shell.SendKeys(keystrokes*?\s + "{ENTER}")

print "[ok]\n"
puts("Sent command: \e[36m#{keystrokes}\e[0m to: #{link}")