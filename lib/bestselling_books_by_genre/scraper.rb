class BestsellingBooksByGenre::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end

  def scrape_fiction
    self.get_page.css("section.subcategory")[0]
  end

  def scrape_nonfiction
    self.get_page.css("section.subcategory")[2]
  end

  def make_fiction_books
  end

  def make_nonfiction_books
  end
end
