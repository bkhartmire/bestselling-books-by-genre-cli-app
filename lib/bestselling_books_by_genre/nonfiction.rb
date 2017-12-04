require 'pry'

class BestsellingBooksByGenre::Nonfiction
  attr_accessor :title, :author, :summary, :link_to_buy

  @@all = []

  def self.all
    @@all
  end

  def self.nonfiction_bestsellers
    scrape_nonfiction.each do |book|
      book = self.new
      @@all << book
    end
  end

  def self.scrape_nonfiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    doc.css("section.subcategory")[2]
  end

  def title
    @title = self.class.scrape_nonfiction.search(".book-body h3.title").text.strip
  end

  def author
    @author = self.class.scrape_nonfiction.search(".book-body p.author").text.gsub("by ", "").strip
  end

  def summary
    @summary = self.class.scrape_nonfiction.search(".book-body p.description").text.strip
  end

  #Fix this code later:
  #def link_to_buy
    #@link_to_buy = self.class.scrape_nonfiction.search("footer.book-footer a").first.attr("href").value
  #end
end
