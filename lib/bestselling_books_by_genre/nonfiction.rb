class BestsellingBooksByGenre::Nonfiction
  attr_accessor :title, :author, :summary

  @@all = []

  def initialize(title, author, summary)
    @title = title
    @author = author
    @summary = summary
    @@all << self
  end

  def self.all
    @@all
  end
end
