class BestsellingBooksByGenre::Book
  attr_accessor :genre, :title, :author, :summary, :link_to_buy

  def self.
    books = []
  end

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    book = self.new
    book.title = doc.search(".book-body.title").text.strip
    book.author = doc.search(".book-body p.author").text.strip.gsub("by ", "")
    book.summary = doc.search(".book-body p.description").text.strip
    book.link_to_buy = doc.search(".book-body.menu li").first.attr("href").strip
    book
  end
end
