#!/usr/bin/env ruby
# encoding: utf-8

require 'open-uri'
require 'json'

config = {}
config[:name] = gets.to_s

config.each do |key, value|
    puts "#{key} is #{value}"
end
