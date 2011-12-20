#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/morale/comment_cleanser"
require "#{File.dirname(__FILE__)}/morale/credentials_store"
require "#{File.dirname(__FILE__)}/morale/dialog"
require "#{File.dirname(__FILE__)}/morale/pattern_finder"
require "#{File.dirname(__FILE__)}/morale/ticket"

comment = ARGV[0]

creds = CredentialsStore.fetch

# Check for valid credentials
if creds.nil? || creds.length < 2 # missing api key or subdomain
  Dialog.new("Invalid credentials. Please run 'morale login' from the command line.").display
elsif creds.length == 2 # missing project
  Dialog.new("Invalid project. Please run 'morale projects --change' from the command line.").display
end

valid = !creds.nil? && creds.length == 3
if valid
  # Remove the comment characters, any leading and trailing spaces, carriage returns, and line feeds
  cleansed = CommentCleanser.cleanse comment

  # See if this is an update
  pattern = PatternFinder.new(cleansed, comment)
  if pattern.update?
    cleansed = pattern.cleansed
    comment = pattern.original
  end

  ticket = Ticket.new(creds[0], creds[1], creds[2].to_i).parse(cleansed)
  puts "#{comment} (##{ticket['identifier']})"
else
  puts comment
end