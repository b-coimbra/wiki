#!/usr/bin/env ruby
# encoding 'utf-8'

bins    = 'binaries.txt'
drive   = Dir.pwd[0..1]
command = {}

# exit unless File.exist?(bins)

# File.open(bins, 'r+') do |f|
#   f.each_line.with_index do |line, i|
#     line = line.gsub(/\w\:/, drive) if line[0..1] != drive
#     command[i += 1] = line

#     puts "\e[45m #{i} \e[0m #{line[/\/(\w+\.exe)$/][1..-1]}"
#   end
# end

# print "\n=> "

# !(OPT, *FLAGS = gets.chomp.split(' ')).nil? && ~/$/ > 0 \
#   ? (system "#{command[OPT.to_i]} #{FLAGS.join('\s')}") \
#   : (abort 'Select an option and pass the arguments.')

def to_hex(data)
  data.unpack('H*')
end

app, data = File.read(__FILE__).split(/^__END__$/, 2)

File.open('binf-x.rb', 'w+') { |f| f << app << "__END__\n"; data.each_line { |line| f.puts to_hex(line) } }

__END__
usuario senha
usuario1 senha1
usuario2 senha2
