#!/usr/bin/env ruby
# encoding: utf-8

BEGIN {
	puts "1: URL"
	puts "2: BROWSER"
	puts "3: VIEWS"
	puts "4: REFRESH-TIME"
}

def open(url, browser, views, refresh)
	if RUBY_PLATFORM =~ /cygwin|mswin|mingw|bccwin|wince|emx/
		system "start #{url}"
	elsif RUBY_PLATFORM =~ /darwin/
		system "open #{url}"
	elsif RUBY_PLATFORM =~ /linux|bsd/
		system "xdg-open #{url}"
	else
		puts "Unknown operating system, shutting down program."
		2.times {system "exit"}
	end

	system "taskkill -f -im #{browser}.exe"
	sleep(refresh)

	timer = 0..views
	timer.each do |i|
		begin
			puts "Process #{i}"
			open()
		rescue StandardError
			retry
		end
	end
end
