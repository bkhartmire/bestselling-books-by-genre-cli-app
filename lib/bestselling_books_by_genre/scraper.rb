class BestsellingBooksByGenre::Scraper

  def self.scrape_fiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    doc.css("section.subcategory")[0].search("article.book")
  end

  def self.scrape_nonfiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    doc.css("section.subcategory")[2].search("article.book")
  end

  def self.fiction_bestsellers
    scrape_fiction.each do |article|
      title = article.search("h3.title").text.strip
      author = article.search("p.author").text.gsub("by ", "").strip
      summary = article.search("p.description").text.strip
      BestsellingBooksByGenre::Fiction.new(title, author, summary)
    end
  end

  def self.nonfiction_bestsellers
    scrape_nonfiction.each do |article|
      title = article.search("h3.title").text.strip
      author = article.search("p.author").text.gsub("by ", "").strip
      summary = article.search("p.description").text.strip
      BestsellingBooksByGenre::Nonfiction.new(title, author, summary)
    end
  end
end
