class CreateCommand
  def self.run(comment)
    creds = CredentialsStore.fetch
    
    if CredentialsValidator.validate(creds)
      # Remove the comment characters, any leading and trailing spaces, carriage returns, and line feeds
      cleansed = CommentCleanser.cleanse comment
    
      # See if this is an update
      pattern = UpdateParser.new(cleansed, comment)
      if pattern.update?
        cleansed = pattern.cleansed
        comment = pattern.original
      end
    
      ticket = Ticket.new(creds[0], creds[1], creds[2].to_i).parse(cleansed)
      return "#{comment} (##{ticket['identifier']})"
    else
      return comment
    end
  end
end