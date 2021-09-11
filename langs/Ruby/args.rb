#/usr/bin/env ruby

class String
  define_method(:args) { ARGV.each { |f| self[/[-]+(?<args>#{f[0]}|#{f})\=(?<val>.*)/im]; return $~[:args] } }
end

