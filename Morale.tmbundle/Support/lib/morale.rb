#!/usr/bin/env ruby

require 'rubygems'
require 'morale/client'

comment = ARGV[0]

#TODO: Store the subdomain, api key, and project # (use same storage as CLI)
#TODO: Use the morale/storage stuff && morale/credentials_store
#TODO: Check that the credentials are there
# Get the subdomain from the .morale directory
credentials = File.read "#{ENV['HOME']}/.morale/credentials"
creds = credentials.split("\n") if credentials

# Remove the comment characters, any leading and trailing spaces, carriage returns, and line feeds
cleansed = ''
comment.each_line do |line|
  cleansed << line.gsub(/^(\# )|(\#)/, ' ').rstrip.chomp
end
cleansed.strip!

client = Morale::Client.new(creds[0], creds[1])
t = client.ticket(creds[2].to_i, cleansed)
ticket = t['task'] unless t['task'].nil?
ticket = t['bug'] unless t['bug'].nil?
ticket = t if ticket.nil?

puts "Hello! You are supposed to process the comment '#{cleansed}' with ticket ##{ticket['identifier']}"