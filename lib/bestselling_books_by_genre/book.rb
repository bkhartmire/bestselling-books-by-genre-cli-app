class BestsellingBooksByGenre::Book
  attr_accessor :genre, :title, :author, :summary, :link_to_buy

  def self.
    books = []
  end

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    book = self.new
    book.title = doc.search("").text.strip
    book.author = doc.search("").text.strip
    book.summary = doc.search("").text.strip
    book.link_to_buy = doc.search("").attr("href").strip
    book
  end
end
