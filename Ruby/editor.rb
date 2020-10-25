require 'io/console'

$buffer = []

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

def get_key
  char = read_char

  case char
  when " "
    print " "
  when "\t"
    print "\t"
  when "\b"
    print "\b"
  when "\r"
    print "\r"
  when "\n"
    print "\n"
  when "\e"
    puts "ESCAPE"
  when "\e[A"
    puts "UP ARROW"
  when "\e[B"
    puts "DOWN ARROW"
  when "\e[C"
    puts "RIGHT ARROW"
  when "\e[D"
    puts "LEFT ARROW"
  when "\177"
    puts "BACKSPACE"
  when "\004"
    puts "DELETE"
  when "\e[3~"
    puts "ALTERNATE DELETE"
  when "\u0003"
    puts "CONTROL-C"
    exit 0
  when "\x13"
    puts "Save"
    puts "You typed #{$buffer.join}"
  when /^.$/
    #print char
  else
    #puts "SOMETHING ELSE: #{char.inspect}"
  end
  print char
  $buffer << char
end

loop {
  get_key
}
