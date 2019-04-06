#!/usr/bin/env ruby
module Enum
  extend self

  define_method :foreach, -> *vec, &args {
    vec.each { |i| args::(i) } if block_given? && !args.parameters.empty?
  }
end

# or with classes
# class Enum
#   define_singleton_method :foreach, -> *vec, &args {
#     vec.each { |i| args::(i) } if block_given? && !args.parameters.empty?
#   }
# end

# example
Enum.foreach([1, 2, 3, 4]) { |i| puts i }
