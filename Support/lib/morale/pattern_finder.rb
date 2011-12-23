class PatternFinder
  attr_accessor :cleansed, :original
  
  def update?
    @update
  end
  
  def initialize(cleansed, original)
    @cleansed = cleansed
    @original = original
    @update = false
    check_update
  end
  
  private
  
  def check_update()
    matches = /( \(#\d+\))/.match(@cleansed)
    unless matches.nil?
      suffix = matches[0]
      matches = /\d+/.match(suffix)
      unless matches.nil?
        @update = true
        id = matches[0]
        @cleansed = "u ##{id}: #{@cleansed.gsub(suffix, '')}"
        @original = @original.gsub(suffix, '')
      end
    end
  end
end