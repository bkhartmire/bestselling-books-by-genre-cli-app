require 'pry'

class BestsellingBooksByGenre::Fiction
  attr_accessor :title, :author, :summary, :link_to_buy

  @@all = []

  def self.all
    @@all
  end

  def self.scrape_fiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    doc.css("section.subcategory")[0].search(".book-body")
  end

  def self.fiction_bestsellers
    scrape_fiction.each do |book_body|
      book = self.new
      book.title = book_body.search("h3.title").text.strip
      book.author = book_body.search("p.author").text.gsub("by ", "").strip
      book.summary = book_body.search("p.description").text.strip
      binding.pry
      book.link_to_buy = book_body.search("footer.book-footer a").first.attr("href").value
      @@all << book
    end
  end

#  def title
#    @title = self.class.scrape_fiction.search("h3.title").text.strip
#  end

#  def author
#    @author = self.class.scrape_fiction.search(".book-body p.author").text.gsub("by ", "").strip
#  end

  def summary
    @summary = self.class.scrape_fiction.search(".book-body p.description").text.strip
  end

  #Fix this code later:
  def link_to_buy
    @link_to_buy = self.class.scrape_fiction.search("footer.book-footer a").first.attr("href").value
  end


end
