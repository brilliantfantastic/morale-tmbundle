#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/morale/comment_cleanser"
require "#{File.dirname(__FILE__)}/morale/comment_parser"
require "#{File.dirname(__FILE__)}/morale/create_command"
require "#{File.dirname(__FILE__)}/morale/credentials_store"
require "#{File.dirname(__FILE__)}/morale/credentials_validator"
require "#{File.dirname(__FILE__)}/morale/delete_command"
require "#{File.dirname(__FILE__)}/morale/dialog"
require "#{File.dirname(__FILE__)}/morale/ticket"
require "#{File.dirname(__FILE__)}/morale/update_parser"
require "#{File.dirname(__FILE__)}/morale/archive_parser"

command = ARGV[0]
comment = ARGV[1]

if command == "--create"
  puts CreateCommand.run comment
elsif command == "--delete"
  puts DeleteCommand.run comment
end