require 'rubygems'
require 'morale/client'

class Ticket
  class << self  
    @instance = nil
    
    def client(subdomain, api_key)
      if @instance.nil? || @instance.subdomain != subdomain || @instance.api_key != api_key
        @instance = Morale::Client.new(subdomain, api_key)
      end 
      @instance
    end
  end
  
  def initialize(subdomain, api_key, project_id)
    @subdomain = subdomain
    @api_key = api_key
    @project_id = project_id
  end
  
  def parse(command)
    client = Ticket.client(@subdomain, @api_key)
    t = client.ticket(@project_id, command)
    ticket = t['task'] unless t['task'].nil?
    ticket = t['bug'] unless t['bug'].nil?
    ticket = t if ticket.nil?
    ticket
  end
end