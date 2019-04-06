#!/usr/bin/env ruby

require 'eat'

math = -> (y) {print y =~ /[0-9]/ ? y.to_i*2 : y*2}.call(5)

#the same as

math = lambda {|y| print y =~ /[0-9]/ ? y.to_i*2 : x*2}.call(5)

def soma(n)
    return n*2
    print soma(5)
end

calc = -> (a, b) do
	p a[/\d/im] ? a + b : next if b !~ /\w/im
end
