#!/usr/bin/env ruby

f = -> (n) do
    until n == 5
        system "mkdir #{n}"
        n += 1
    end
end
f.(1)

# or
-> (n) {n.times {system "mkdir #{rand(0..9000)}"}}.(gets.to_i)

# == == == == == == #

num = rand(9000)
files = Dir.glob("*.")
files.each do |file|
    File.rename(file, num.to_s)
end

# or
-> (f,i) {File.rename(f, i.to_s)}.(Dir.glob("*."), rand(9000))
