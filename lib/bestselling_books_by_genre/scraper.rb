require 'pry'

class BestsellingBooksByGenre::Scraper

  def self.scrape_fiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    doc.css("section.subcategory")[0].search("article.book")
  end
  
  def self.scrape_nonfiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    doc.css("section.subcategory")[2].search("article.book")
  end
end
