#!/usr/bin/env ruby
# coding: utf-8

a,b,c = 1,5,6

d = (b**2) - (4*a*c)

if d < 0
	print "Não há uma solução real."
elsif d == 0
	x = (-b + Math.sqrt(d)) / (2*a)
	print "Há uma solução: #{x}"
else
	x1 = (-b + Math.sqrt(d)) / (2*a)
	x2 = (-b - Math.sqrt(d)) / (2*a)
	print "Há duas soluções: #{x1} e #{x2}"
end