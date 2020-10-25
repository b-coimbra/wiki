#!/usr/bin/env ruby
# encoding: utf-8

loop { %w[(>^.^)> <(^.^<)].each { |i| print "\e[31m#{i}\e[0m", ("\b" * i.length); sleep 0.5; $stdout.flush } }
