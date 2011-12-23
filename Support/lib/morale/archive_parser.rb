class ArchiveParser
  include CommentParser
  
  attr_accessor :original
  
  def archive?
    @archive
  end
  
  def initialize(cleansed, original)
    @cleansed = cleansed
    @original = original
    @archive = false
    parse
    check_archive
  end
  
  private
  
  def check_archive
    unless @id.nil?
      @archive = true
      @cleansed = "a ##{@id}"
      @original = @original.gsub(@suffix, '')
    end
  end
end