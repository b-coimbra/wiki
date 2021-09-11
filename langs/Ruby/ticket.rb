#!/usr/bin/env ruby

def is_lucky(ticket)
    t = ticket.split("")
    if t[0..2].map(&:to_i).inject(:+) == t[3..-1].map(&:to_i).inject(:+)
        if t =~ /[0-9]/
            return true
        else
            return false
        end
    elsif t =~ /[a-z]/i || t.length != 6
        puts false
    else
      puts false
    end
end
is_lucky("1233a21")
