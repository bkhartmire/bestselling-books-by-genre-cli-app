require 'pry'

class BestsellingBooksByGenre::Fiction
  attr_accessor :title, :author, :summary, :link_to_buy

  @@all = []

  def self.all
    @@all
  end

  def self.scrape_fiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    doc.css("section.subcategory")[0].search("article.book")
  end

  def self.fiction_bestsellers
    scrape_fiction.each do |article|
      book = self.new
      @@all << book
      book.title = article.search("h3.title").text.strip
      book.author = article.search("p.author").text.gsub("by ", "").strip
      book.summary = article.search("p.description").text.strip
      #book.link_to_buy = article.search("footer.book-footer a").first.attr("href").value

    end
  end



  #Fix this code later:
  #def link_to_buy
  #  @link_to_buy = self.class.scrape_fiction.search("footer.book-footer a").first.attr("href").value
#  end


end
