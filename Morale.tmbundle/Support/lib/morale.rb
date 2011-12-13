#!/usr/bin/env ruby

require 'rubygems'
require 'morale/client'

comment = ARGV[0]

# Remove the comment characters, any leading and trailing spaces, carriage returns, and line feeds
cleansed = ''
comment.each_line do |line|
  cleansed << line.gsub(/^(\# )|(\#)/, ' ').rstrip.chomp
end
cleansed.strip!

Morale::Client.new('bf', 't1kxnkIzCZfvldv2MCF5').projects.each do |project|
  puts "Project: #{project['project']['name']}"
end

puts "Hello! You are supposed to process the comment '#{cleansed}'"