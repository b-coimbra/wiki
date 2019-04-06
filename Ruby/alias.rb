#!/usr/bin/env ruby
# encoding: UTF-8

module Kernel
    alias_method :λ, :lambda 
end

define_method(:fib) { |n| n <= 1 ? n : fib(n-1) + fib(n-2) }

λ { |*i| p i.map(&method(:fib)) }::(3,9,10)