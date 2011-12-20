class CommentCleanser
  def self.cleanse(comment)
    cleansed = ''
    comment.each_line do |line|
      cleansed << line.gsub(/^(\# )|^(\#)/, ' ').rstrip.chomp
    end
    cleansed.strip!
  end
end