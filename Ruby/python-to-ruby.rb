#!/usr/bin/env ruby 
# encoding: UTF-8
define_method(:input) { |str| print str; gets.to_s }
define_method(:len)   { |obj| obj.length }
define_method(:int)   { |num| num.to_i }
define_method(:str)   { |int| int.to_i }

class String
  define_method(:format) { |*args| i = 0; self.scan(/\{\}/m) { |re| p args[i].to_s; i += 1 } }
end

lines = 0

DATA.each_line.with_index { |line, i|
  lines = i
  eval line. \
    gsub(/([if|else|elif|def|while|with|class|for]+\s.*?)\:/im, '\1'). \
    gsub(/\:\n|^\s(.*)/m, '\1end'). \
    gsub(/import\s(\w+)/im, "require '\\1'"). \
    gsub(/(if)\s__name__\s==\s'__main__'/im, '\1 __FILE__ == $0')
} rescue NameError abort "\e[31mPlease check if the Python program is correct.\e[0m"

at_exit { puts "Converted #{lines} lines." }

__END__
import json
'hey {} {}'.format([4,3,2], 3)
name = input("Enter your name: ")
if name == 'john':
    print("it's john!1!!one!1")
