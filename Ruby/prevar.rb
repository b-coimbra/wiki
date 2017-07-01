#!/usr/bin/env ruby
# encoding: UTF-8

# pre-defined variables

-> (n) { n <= 21 ? 21 - n : (n - 21) * 2 }::(19)

lambda { |n| n < 21 ? 21 - n : (n - 21) * 2 }::(19)

-> (*list) { p list }::(1,2,3,4,5,6)
