#!/usr/bin/env ruby

string = "Ruby&Rails"
string.gsub(/([Rr])uby&\1ails/){|i| puts i}
