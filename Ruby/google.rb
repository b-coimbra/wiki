#!/usr/bin/env ruby
# encoding: UTF-8
# USAGE: ruby google.rb <anything you want to search>
require 'win32ole'

shell = WIN32OLE.new("Wscript.Shell")

link = "www.google.com"
link =~ /www\.(.*)\.com/i
title = $1.capitalize

case RbConfig::CONFIG['host_os']
when /mswin|mingw|cygwin/im
    system "start #{link}"
when /darwin/im
    system "open #{link}"
when /linux|bsd/im
    system "xdg-open #{link}"
end

sleep 2

(shell.Run(title); sleep 0.5) while !shell.AppActivate(title)

shell.SendKeys(ARGV.join(' ') + "{ENTER}")