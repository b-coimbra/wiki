
Dir['*'].each_slice(5).to_a.each do |file|
  file.each do |f|
    print "%-20s" % [
      File.directory?(f) ? ("\e[31m%-20s\e[0m" % [f]) : f
    ]
  end
  puts "\n"
end