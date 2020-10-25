#!/usr/bin/env ruby

module Enum
  extend self

  define_method :foreach, -> *args, &block {
    args.each { |i| block::(i) } if block_given? && !args.parameters.empty?
  }
end

Enum.foreach([1, 2, 3, 4]) { |i| puts i }
