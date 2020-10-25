require 'io/console'

module OS
  class << self
    def windows?
      return !!(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM)
    end

    def mac?
      return !!(/darwin/ =~ RUBY_PLATFORM)
    end

    def unix?
      return !windows?
    end

    def linux?
      return unix? if !mac?
    end
  end
end

def clear
  OS.windows? ? system('cls') : system('clear')
end

clear()

@fruit = [4,1]

def map size, row, column
  print "MAP %#{size-2}dx%d\n" % [column, row]

  axis = 1

  while axis != 10 do
    # fruit = ' ' * (rand(1..size).freeze)
    if axis == 1 || axis == 9
      print "+ #{'-' * size} +\n"
    elsif axis == row
      print "#{"\e[47m|\e[0m"} #{' ' * (column - 1) + "\e[31m♦\e[0m" + ' ' * (size - column)} |\n"
    else
      print "| #{' ' * (size)} |\n"
    end
    axis += 1
  end
end

def read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.cooked!

  return input
end

pos      = 1
map_size = 30
y_axis   = 5
x_axis   = map_size / 2

map(map_size, y_axis, x_axis)

while (y_axis != pos)
  char = read_char

  case char
  when "\u0003"
    exit 0
  when /^.$/
    if char == ?s
      y_axis += 1 unless y_axis >= 8
    elsif char == ?w
      y_axis -= 1 unless y_axis <= 2
    elsif char == ?d
      x_axis += 1 unless x_axis >= map_size
    elsif char == ?a
      x_axis -= 1 unless x_axis <= 1
    end

    clear() if y_axis != (pos - 1)
  end

  map(map_size, y_axis, x_axis)
  $stdout.flush
end

