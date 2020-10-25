#!/usr/bin/env ruby

packet = Object.new

def packet.set=(raw) @raw = raw end
def packet.get; @raw end

packet.set = "\x39d"
print packet.get # => x39d

# ------ #

class CRUD
  METHODS = %[create update delete edit]

  METHODS.each do |meth|
    define_method("do_#{meth}") do |*args, &block|
      args.send(block)
    end
  end
end

