#!/usr/bin/env ruby
# encoding: utf-8

require 'aes'
require 'fileutils'

system 'title Password Manager'
at_exit { puts 'See ya!' }

def check(key)
    File.open('storage/master_key.txt', 'r').each do |pass|
        begin
            if key == AES.decrypt(pass, key)
                puts "\n\nWelcome! Select an option from the menu below.\n\n".green

                @show_menu = lambda do
                    puts "\n------OPTIONS------\n"
                    %w(add remove show generate quit).each_with_index do |action, num|
                        puts "[#{num += 1}] ".blue + action.to_s
                    end

                    print "\n=> "
                    activate(gets.chomp.to_s)
                end
                @show_menu.call
            end
        rescue StandardError
            print "Wrong master key! Try again\n=> ".red
            check(gets.chomp.to_s)
        end
    end
end

def activate(option)
    key = ''

    case option
    when /(add)/i, '1'
        print "\nAdd a password to the storage\nFormat: <item> <password>\n=> "
        get = gets.chomp.to_s.split

        add = lambda do |string, password|
            File.open('storage/passwords.txt', 'a+') do |item|
                item.puts AES.encrypt(string + ' => ' + password, key)
            end
            puts "\nPassword stored successfully!\n".blue
            @show_menu.call
        end
        if (get[0] && get[1]).nil? == false
            add.call(get[0], get[1])
        else
            puts 'Invalid type'.red
        end
    when /(remove)/i, '2'
        print "Remove an item from the storage\nFormat: <item_keyword>\n=> "
        get_keyword = gets.chomp.to_s

        File.open('storage/passwords.txt', 'r').each do |items|
            items.each_line do |item|
                AES.decrypt(item, key)
                search_keyword = item.gsub(/^(#{get_keyword}).*/im, '')
                File.open('storage/passwords.txt', 'w') { |rewrite| rewrite.puts search_keyword }
                # TODO: check if there's another string with the same name
            end
        end
        puts "#{"\u2713".blue} The item #{get_keyword} has been successfully deleted." unless get_keyword == ''
        @show_menu.call
    when /(show)/i, '3'
        begin
            File.open('storage/passwords.txt', 'r') do |items|
                items.each_line do |item|
                    item = AES.decrypt(item, key)
                    puts item
                end
            end
        rescue SystemCallError
            puts 'The passwords storage is empty.'.red
        end
        @show_menu.call
    when /(generate)/i, '4'
        print "What size?\n=> "
        generate = -> (size) { puts "#{"\u{1f511}".green}: " + ([*('a'..'z'), *('0'..'9')] - %w(0 1 I O)).sample(size.to_i).join }
        generate.call(gets.chomp)
        @show_menu.call
    when /(quit)/i, '5'
        puts 'See ya!'
        exit!
    else
        puts "Invalid option!\n".red
        @show_menu.call
    end
end

BEGIN {
    module Key
        class << self
            attr_accessor :password
        end
    end

    class String
        def red;            "\e[31m#{self}\e[0m" end
        def blue;           "\e[34m#{self}\e[0m" end
        def green;          "\e[32m#{self}\e[0m" end
    end

    puts %{
        █▀▀█ █▀▀█ █▀▀ █▀▀ █░░░█ █▀▀█ █▀▀█ █▀▀▄
        █░░█ █▄▄█ ▀▀█ ▀▀█ █▄█▄█ █░░█ █▄▄▀ █░░█
        █▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ░▀░▀░ ▀▀▀▀ ▀░▀▀ ▀▀▀░

        █▀▄▀█ █▀▀█ █▀▀▄ █▀▀█ █▀▀▀ █▀▀ █▀▀█
        █░▀░█ █▄▄█ █░░█ █▄▄█ █░▀█ █▀▀ █▄▄▀
        ▀░░░▀ ▀░░▀ ▀░░▀ ▀░░▀ ▀▀▀▀ ▀▀▀ ▀░▀▀
    }

    store = lambda do |key|
        FileUtils::mkdir_p 'storage'
        system 'attrib +h storage'

        Key.password = AES.encrypt(key, key)
        File.open('storage/master_key.txt', 'w+') do |store_key|
            store_key << Key.password
            puts "\n#{"\u2713".blue} Key successfully stored!"
        end
        check(key)
    end
}

if Dir['./storage/*'].empty? == true
    print "Set your master key:\n#{"\u{1f511}".green}: "
    get_key = gets.chomp.to_s

    if get_key.nil? || get_key.empty? || get_key !~ /[^[:space:]]/m
        puts "#{"\u274C".red} The master key cannot be empty!"
    else
        store.call(get_key)
    end
else
    print "Please insert your master key\n#{"\u{1f511}".green}: "
    check(gets.chomp.to_s)
end
