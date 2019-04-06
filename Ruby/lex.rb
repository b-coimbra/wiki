#!/usr/bin/env ruby

TOKENS = {
  :INT    => /([int]+)/,
  :STR    => /^([str]+)/,
  :ID     => /\s([\w\d]+)/,
  :EQUALS => /\=/,
  :NUMBER => /\d+/,
  :TIMES  => /\*/
}

expr = "int num = 3 * 21"

def getIndex(str, regx)
  str.enum_for(:scan, regx).map { Regexp.last_match.begin(0) }
end

TOKENS.to_enum.each do |key, val|
  if expr[val]
    puts "#{key} => #{expr[val].strip}, #{getIndex(expr, val)}"
  end
end
