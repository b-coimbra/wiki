#!/usr/bin/env ruby

require 'fileutils'

def ext folder
  Dir[folder + '/*'].each do |dir|
    Dir[dir + '/*'].each do |f|
      if f != ('./' + $0)
        puts "Moving #{f}"

        FileUtils.mv f, './'
      end
    end
  end
end

ext(File.dirname($0))

puts 'Done!'
