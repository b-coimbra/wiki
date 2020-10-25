#!/usr/bin/env ruby
# encoding: UTF-8

Dir['*'].each { |f|
  File.rename(f, ((File.binread(f.to_s)[0x10..0x18].unpack('NN')*?x + ' ' + f) if File.extname(f)[/\.png/])) if f != $0
} rescue Errno::ENOENT abort '[!] Run as admin.'