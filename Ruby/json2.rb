#!/usr/bin/env ruby
# coding: utf-8

require 'json'

# TODO: toggle json input

file = File.read("config.json")

current = JSON.parse(file)
