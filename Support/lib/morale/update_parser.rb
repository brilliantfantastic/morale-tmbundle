class UpdateParser
  include CommentParser
  
  attr_accessor :original
  
  def update?
    @update
  end
  
  def initialize(cleansed, original)
    @cleansed = cleansed
    @original = original
    @update = false
    parse
    check_update
  end
  
  private
  
  def check_update
    unless @id.nil?
      @update = true
      @cleansed = "u ##{@id}: #{@cleansed.gsub(@suffix, '')}"
      @original = @original.gsub(@suffix, '')
    end
  end
end