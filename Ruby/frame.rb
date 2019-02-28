#!/usr/bin/env ruby

require 'io/console'

class Term
  attr_reader :size, :width, :height

  def size
    `tput cols && tput lines`.strip.split(' ').map &:to_i
  end

  def width
    `tput cols`.to_i
  end

  def height
    `tput lines`.to_i
  end
end

class Render
  def initialize current_line
    @term = Term.new
    @cline = current_line

    @width  = @term.width  - 2
    @height = @term.height - 2
  end

  def line(corner = "+", char = "-", number = '-')
    width = @width - number.length

    corner = "\e[41m#{corner}\e[0m"

    if char == '-'
      char = "\e[41m#{char}\e[0m"
    else
      char = "\e[44m#{char}\e[0m"
    end

    line = corner + number + (char * width) + corner

    # if number.to_i == @cline
    #   line = "\e[41m#{line}\e[0m"
    # end

    print line
  end

  def clear
    system 'cls'
  end

  def cols
    (1..@height).each do |n|
      line('|', ' ', n.to_s)
    end
  end

  def screen
    clear

    line
    cols
    line
  end
end

line   = 0
column = 0

loop do
  # get = STDIN.getch

  # if get == 'j'
  #   line += 1
  # elsif get == 'k'
  #   line -= 1 unless line == 0
  # elsif get == 'q'
  #   exit
  # end

  render = Render.new(line)
  render.screen
end

