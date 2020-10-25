#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# mpv script to fetch youtube urls

require 'eat'

abort "Usage: yt.rb <search> <max>" if ARGV[0].nil?

class String
  { :blue           => 34,
    :cyan           => 36,
    :red            => 31,
    :magenta        => 35,
    :bg_magenta     => 45,
  }.each do |color, value|
    define_method color do
      "\e[#{value}m" + self + "\e[0m"
    end
  end
end

error   = false
query   = "https://www.youtube.com/results?q=#{ARGV[0].downcase.strip.gsub(/\s+/m, "+")}&hl=en" rescue (error = true)
max     = ARGV[1].to_i || 15
search  = eat(query)
vinfo   = {}
vinfo_a =
[
  search.scan(/a href=\"\/watch\?v=(.*?)\"/).collect { |i| i.join },
  search.scan(/a href=\"\/watch\?v=.*?\> - Duration: (.*?)\.\</).collect { |i| i.join },
  search.scan(/a href=\"\/watch\?v=.*?dir="ltr"\>(.*?)\</).collect { |i| i.join },
  search.scan(/a href=\"\/user\/(.*?)\"/).collect { |i| i.join },
  search.scan(/a href=\"\/watch\?v=.*?\/li\>\<li\>(.*?)\s*views\</).collect { |i| i.join },
  search.scan(/a href=\"\/watch\?v=.*?li\>(.*?)\</).collect { |i| i.join }
] if !error

vinfo_a[0].each_with_index { |video, index|
  vinfo[video] =
  {
    "time"     => vinfo_a[1][index],
    "title"    => vinfo_a[2][index],
    "user"     => vinfo_a[3][index],
    "views"    => vinfo_a[4][index],
    "created"  => vinfo_a[5][index]
  }
}

videos = []

vinfo.keys[0..(max-1)].each_with_index { |video, i|
  info = vinfo[video]
  videos << video
  print "%s [%s] %s\n└── (%s) ─ (%s views)\n\s\s\s└── https://youtube.com/v/%s \n\n" %
    [
      (-~i).to_s.bg_magenta,
      info["user"].to_s,
      info["title"].to_s.bg_magenta,
      info["time"][-5..-1].to_s.cyan,
      info["views"].to_s.gsub(/\,/, '.').cyan,
      video.cyan
    ]
}

print "Select a video (number): "
num = STDIN.gets.chop.to_i
num = (num == 1) ? 0 : (num - 1)
system "mpv https://youtube.com/v/#{videos[num]}"
