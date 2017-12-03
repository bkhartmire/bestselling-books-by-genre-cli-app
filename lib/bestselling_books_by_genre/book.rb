require 'pry'

class BestsellingBooksByGenre::Book
  attr_accessor :genre, :title, :author, :summary, :link_to_buy



  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    book = self.new
    book.title = doc.search(".book-body h3.title").text.strip
    book.author = doc.search(".book-body p.author").text.gsub("by ", "").strip
    book.summary = doc.search(".book-body p.description").text.strip
    #Fix this code later:
    #book.link_to_buy = doc.css("footer.book-footer a").first.attr("href").value
    book

  end
end
