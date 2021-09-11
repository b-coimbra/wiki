require 'io/console'

class Window
  attr_reader :width

  def initialize
    @width = IO.console.winsize[1]
  end

  # sig { returns(String) }
  def center(text)
    spacing = ("\s" * ((@width / 2) - (text.length / 2)))

    print spacing

    spacing + text
  end
end

class Text
  attr_accessor :text

  def initialize(text)
    @text = text
  end

  def typewrite
    letters = @text.split('')

    letters.each_with_index do |letter, i|
      next if letter == "\s" unless letters[i] != "\s"
      print letter
      sleep 0.2
    end
    puts
  end
end

window = Window.new

Text.new(window.center("hello.")).typewrite
