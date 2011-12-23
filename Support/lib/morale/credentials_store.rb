class CredentialsStore
  
  def self.fetch
    #TODO: Use the morale/storage stuff && morale/credentials_store
    # Get the subdomain from the .morale directory
    path = "#{ENV['HOME']}/.morale/credentials"
    if File.exists? path
      credentials = File.read path
      credentials.split("\n") if credentials
    end
  end
  
end