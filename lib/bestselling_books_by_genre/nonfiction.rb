require 'pry'

class BestsellingBooksByGenre::Nonfiction
  attr_accessor :title, :author, :summary

  @@all = []

  def self.all
    @@all
  end

  def self.nonfiction_bestsellers
    BestsellingBooksByGenre::Scraper.scrape_nonfiction.each do |article|
      book = self.new
      @@all << book
      book.title = article.search("h3.title").text.strip
      book.author = article.search("p.author").text.gsub("by ", "").strip
      book.summary = article.search("p.description").text.strip
    end
  end
end
