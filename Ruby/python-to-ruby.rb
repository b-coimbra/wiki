#!/usr/bin/env ruby 
# encoding: UTF-8
define_method(:input) { |str| print str; gets.to_s }
define_method(:len)   { |obj| obj.length }
define_method(:int)   { |num| num.to_i }
define_method(:str)   { |int| int.to_i }

class String
  define_method(:format) { |*args| i = 0; self.scan(/\{\}/m) { |re| print args[i].to_s; i += 1 } }
end

def main
  lines = 0
  if file = ARGV[0]
    open(file, 'r+').each_line.with_index { |line, i|
      lines = i
      eval line. \
        gsub(/try/im, 'begin'). \
        gsub(/finally/im, 'ensure'). \
        gsub(/\:\n|^\s(.*)/m, '\1end'). \
        gsub(/while True/im, 'loop do'). \
        gsub(/__init__/im, 'initialize'). \
        gsub(/except\s(.*)/im, 'rescue \1'). \
        gsub(/import\s(\w+)/im, "require '\\1'"). \
        gsub(/for\s(.*)\sin\s(.*)\:\n\s(.*)/im, '\2.map { |\1| \3 }'). \
        gsub(/([if|else|elif|def|while|with|class|for]+\s.*?)\:/im, '\1'). \
        gsub(/(if)\s__name__\s==\s'__main__'/im, '\1 __FILE__ == $0')
    } rescue NameError abort "\e[31mInvalid/corrupted Python file.\e[0m"
  else
    abort "\e[32mUsage: ruby python-to-ruby.rb\e[0m \e[34m<python-file.py>\e[0m"
  end
  fail SyntaxError, "File is not Python/Can't parse syntax."
  at_exit { $> << "\nConverted [#{lines}] lines." }
end

main() if __FILE__ == $0