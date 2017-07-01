#!/usr/bin/env ruby
# coding: utf-8

# TODO: check for platform
# IDEA:
# BUG:
# NOTE:

$: << File.join(File.dirname(__FILE__), "./lib")

require_relative 'lib/os_module'
require_relative 'lib/color_module'

class Main
    extend OS
    extend Color

    self.title
    def initialize()
        begin
            ask()
        rescue StandardError => e
            raise "Something happened. #{e}"
        end
    end

    def ask()
        puts "Your file is at #{__dir__}\n
        Go to folder?"

        $answer = gets.chomp

        self.files if $answer =~ /^[Yy]/
    end
end
Main::new()
