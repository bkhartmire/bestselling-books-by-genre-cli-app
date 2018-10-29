class BestsellingBooksByGenre::Nonfiction
  include BestsellingBooksByGenre::Book

  @@all = []

  def self.all
    @@all
  end
end
