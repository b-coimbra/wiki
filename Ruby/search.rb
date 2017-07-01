#/usr/bin/env ruby

# TODO: search and replace

def open(file)
    @file = file
    if File.file?(file) then @file = File.open(file, 'r+').read() else puts "Couldn't locate #{file} " end

    def search(word)
        @word = word
        @word = @file.gsub(/[a-zA-Z0-9]*/i)
    end
    print "Search for word: \n=> "
    search(gets.chomp)

    def replace(_word)
        _word = @file.gsub("#{@word}", _word) {|x| x = File.open(@file, 'w+')
            x << _word
            x.close
        }
    end
    print "Replace with: \n=> "
    replace(gets.chomp)
end

ext = [".txt", ".doc", ".pdf", ".docx"]

print "Name of the file?\n=> "
open(gets.chomp + "#{ext[0]}")
