require 'pry'

class BestsellingBooksByGenre::Fiction
  attr_accessor :genre, :title, :author, :summary, :link_to_buy

  def self.scraper
    BestsellingBooksByGenre::Scraper.new
  end

  def self.fiction_bestsellers
    @fiction_books = []
    scraper.scrape_fiction.each do |book|
      @fiction_books << book
    end
    @fiction_books
  end

  def self.scrape_fiction
    doc = scraper.scrape_nonfiction
    book = self.new
    book.title = doc.search(".book-body h3.title").text.strip
    book.author = doc.search(".book-body p.author").text.gsub("by ", "").strip
    book.summary = doc.search(".book-body p.description").text.strip
    #Fix this code later:
    #book.link_to_buy = doc.css("section.subcategory footer.book-footer a").first.attr("href")[0].value
    book
  end

end
