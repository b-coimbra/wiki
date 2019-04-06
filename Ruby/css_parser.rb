#!/usr/bin/env ruby

require 'fileutils'

BEGIN {
    system("title CSS CONVERSOR")
    $path = File.expand_path(File.dirname(__FILE__))
}

class String
    def red;            "\e[31m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
end

$options = "[" + "Y".green + "/" + "N".red + "]: "

class Main
    def out(output, selector, attribute, value)
        @output, @selector, @attribute, @value = output, selector, attribute, value
    end

    def progress
        progress = 'Converting ['.green
        1000.times do |i|
            j=i+1
            if j % 10 == 0
                progress << "=".green
                print "\r"
                print progress + " #{j / 10} %".blue
                $stdout.flush
                sleep 0.002
            end
        end
        puts "\nDone!".blue
    end

    def html(file)
        if File.file?("index.html") then root = File.open(file, 'r+').read() else raise "Oops! index.html not found" end

        html_out = root.gsub(/[class|name|id]*=("\w*")/, "name=\\1").gsub(/^[\<\/\s\>]*(body|html|head|meta(\s\S*)|link(\D*?)|script|title(\D)*|style|(<!doctype html))(\>)|(\D*\{(\D)*\})/im, "").gsub(/^\s$\n|\r/, "")

        html_new = File.new("conversor/xat.html", 'w+') unless File.exist?("xat.html")
        print "(1/3) Compress html? #{$options}"
        _res = gets.chomp
        if _res =~ /[Yy]/
            html_new << html_out.gsub!(/\s\s|\n|\r/, "")
        else
            html_new << html_out
        end
    end

    def open(file)
    	if File.file?("style.css") then root = File.open(file, 'r+').read() else raise "Oops! style.css not found.".red end

        @output = root.gsub!(/^(\.|\#)[\w\d]*/im).each do |selector, attribute, value|
            $selector = "[name=\"#{selector.gsub(/\#|\.|\{(.*?)\}|\{|\}/i, "")}\"]"
        end

        Dir.mkdir("conversor") unless File.directory?("conversor")
        Dir["#{$path}/conversor"].each do |n|
            n = File.new("conversor/xat.css", "w+") unless File.exist?("xat.css")
            begin
                n << "/* #{Time.now.asctime} */"
                print "(2/3) Use css reset? #{$options}"
                ask = gets.chomp
                if ask =~ /[Yy]/
                    n << "*{margin:0}*{padding:0}{-webkit-user-select:none}*{-moz-user-select:none}*{user-selection:none}*{-webkit-user-drag:none}*{user-drag:none}*{text-decoration:none}ul,ol{list-style:none}"
                end
                if @output.include? ";"
                    n << @output.gsub!(/\n|\s/, "").gsub(/([\:]\'\w*\'|\:\#|\:)(\w*)/, "\\1\\2\\3}#{$selector}{").gsub!(/(px|cm|em|ex|\d(in)|mm|pc|pt|px|vh|%|vh|vw|vmin)/, "\\1\s").delete(";").insert(-2, ";")
                end
                _p = Thread.new{progress()}
                _p.join
            rescue StandardError
                raise "Could not write to new file.".red
            ensure
                n.close unless n.nil?
            end
        end
    end

    def readme
        note = "This program does not support the below (for now):\n-> Keyframes\n-> CSS Regular expressions\n\nPC me if you find any bugs/issues."
        _rm = File.new("conversor/README.txt", 'w+')
        _rm << note
    end
end

show = Main::new
html = Thread.new{show.html("index.html")}.join
css = Thread.new{show.open("style.css")}.join
notes = Thread.new{show.readme()}.join

END {
    print "\n\nConversion completed! File generated at #{$path.green}\n".blue
    print "(3/3) Go to folder? #{$options}"
    r = gets.chomp
    system r[/^[yY]/]? ("cd conversor && start.") : ("cls")
}
