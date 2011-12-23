module CommentParser
  attr_accessor :cleansed
  
  def parse
    matches = /( \(#\d+\))/.match(@cleansed)
    unless matches.nil?
      @suffix = matches[0]
      matches = /\d+/.match(@suffix)
      unless matches.nil?
        @id = matches[0]
      end
    end
  end
end