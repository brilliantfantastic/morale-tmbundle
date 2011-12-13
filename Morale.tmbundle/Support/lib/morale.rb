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

#TODO: Store the subdomain, api key, and project # (use same storage as CLI)
client = Morale::Client.new('bf', '')
# client.projects.each do |project|
#   puts "Project: #{project['project']['name']}"
# end
t = client.ticket(100, cleansed)
ticket = t['task'] unless t['task'].nil?
ticket = t['bug'] unless t['bug'].nil?
ticket = t if ticket.nil?

puts "Hello! You are supposed to process the comment '#{cleansed}' with ticket ##{ticket['identifier']}"