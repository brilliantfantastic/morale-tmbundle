class CredentialsValidator
  def self.validate(credentials)
    if credentials.nil? || credentials.length < 2 # missing api key or subdomain
      Dialog.new("Invalid credentials. Please run 'morale login' from the command line.").display
    elsif credentials.length == 2 # missing project
      Dialog.new("Invalid project. Please run 'morale projects --change' from the command line.").display
    end

    !credentials.nil? && credentials.length == 3
  end
end