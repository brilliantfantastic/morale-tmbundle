class DeleteCommand
  def self.run(comment)
    # Remove the comment characters, any leading and trailing spaces, carriage returns, and line feeds
    cleansed = CommentCleanser.cleanse comment
  
    # See if this is an update
    pattern = ArchiveParser.new(cleansed, comment)
    if pattern.archive?
      creds = CredentialsStore.fetch

      # Check for valid credentials
      if CredentialsValidator.validate(creds)
        cleansed = pattern.cleansed
        ticket = Ticket.new(creds[0], creds[1], creds[2].to_i).parse(cleansed)
      end
    end
    return ""
  end
end