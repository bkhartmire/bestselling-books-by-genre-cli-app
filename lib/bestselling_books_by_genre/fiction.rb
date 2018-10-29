class BestsellingBooksByGenre::Fiction
  include BestsellingBooksByGenre::Book

  @@all = []

  def self.all
    @@all
  end
end
