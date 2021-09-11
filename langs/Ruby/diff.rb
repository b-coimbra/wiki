def spellcheck(a, b)
  longer = [a.size, b.size].max
  same = a.each_char.zip(b.each_char).select { |a, b| a == b }.size
  (longer - same) / a.size.to_f
end

words = %w{hello john cal cmds curry aheyo hehe cowsay}

# words.each { |w| puts spellcheck(w, "cm").round(2) }

approx = {}
words.each { |w| puts approx.store(w, spellcheck(w, "c").round(2).to_s).to_f }
minimum = approx.values.map(&:to_f).min 
if minimum < 0.6
    approx.each { |k, v| puts "Did you mean #{k}?" if v.to_f == minimum }
else
    puts "Nope"
end