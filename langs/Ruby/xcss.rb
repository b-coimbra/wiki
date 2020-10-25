#!/usr/bin/env ruby
# coding: utf-8

# TODO: module string into hex

$: << File.join(File.dirname(__FILE__), './lib')

require_relative 'lib/colors'

class XCSS
    extend Color

    def initialize(files)
        files.each do |file|
            begin
                $current_file = File.open(file, 'r+').read()
                parse() unless $current_file.empty? || $current_file.nil?
            rescue StandardError => e
                puts "Oops! This directory doesn't have any CSS files. #{e}"
            end
        end
    end

    def parse()
        # converting everything to an array
        parsed = -> (file) {
            file.split.map(&:to_s)
        }.call($current_file)

        # Global regex variables
        syntax = {
            $selector => /^(\.|\#)[\w\d]*/im,
            $attribute => /(\w*)(:)/i,
            $value => /\d|\w*(;)$/i
        }

        parsed.each do |struct|
            if struct =~ $selector
                $str = "[name=\"#{struct.gsub(/(\.|\#)/, '')}\"]{"
            elsif struct =~ $attribute
                $str << struct.gsub($attribute)
            end
        end

        # IDEA: split array into 3 pieces (index 0)
        timer = 0
        print "[name=\"#{parsed[0].gsub(/(\.|\#)/i, '')}\"]"
        until timer == 4
            timer +=1
            print "#{parsed[timer]}"
        end
    end
end

main = XCSS::new(Dir.glob("*.css"))
