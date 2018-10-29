module BestsellingBooksByGenre::Book
  attr_accessor :title, :author, :summary

  def initialize(title, author, summary)
    @title = title
    @author = author
    @summary = summary
    self.class.all << self
  end

end
