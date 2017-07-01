#!/usr/bin/env ruby
# coding: utf-8

# TODO: Spotify API search

require 'json'
require 'open-uri'
# NOTE: required due to ssl connection issues
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

argu = "Skrillex"

uri = JSON.parse(open("https://api.spotify.com/v1/search?type=artist&q=#{URI::encode(argu)}").read)
uri["artists"]["items"].each do |res|
    name = res["name"]
    followers = res["followers"]["total"]
    link = res["external_urls"]["spotify"]
    if res["genres"] != []
        genre = res["genres"]
    else
        genre = "Not specified."
    end

    $u = "#{name} has #{followers} followers. Genre: #{genre} -> #{link}"
    puts $u
    sleep(1)
end
