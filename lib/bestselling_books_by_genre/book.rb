require 'pry'

class BestsellingBooksByGenre::Fiction
  attr_accessor :genre, :title, :author, :summary, :link_to_buy

  def self.fiction_bestsellers
    @fiction_books = []
    BestsellingBooksByGenre::Scraper.scrape_fiction.each do |book|
      @fiction_books << book
    end
    @fiction_books
  end

  def self.scrape_fiction
    doc = BestsellingBooksByGenre::Scraper.scrape_fiction
    book = self.new
    book.title = doc.search(".book-body h3.title").text.strip
    book.author = doc.search(".book-body p.author").text.gsub("by ", "").strip
    book.summary = doc.search(".book-body p.description").text.strip
      #Fix this code later:
      #book.link_to_buy = doc.css("section.subcategory footer.book-footer a").first.attr("href").value
    book
  end


end
