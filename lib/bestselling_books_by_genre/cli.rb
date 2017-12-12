class BestsellingBooksByGenre::CLI
  def call
    list_books
    get_details
  end


  def list_books
    puts "Would you like to view the NY Times bestselling fiction or nonfiction books?"
    genre = gets.strip
    puts "How many bestselling #{genre} books would you like to see? Please input 1-5:"
    number = gets.to_i
    until number.between?(1, 5)
      puts "Sorry, your input is invalid."
      puts "How many bestselling #{genre} books would you like to see? Please input 1-5:"
      number = gets.to_i
    end
    if genre == "fiction"
      BestsellingBooksByGenre::Scraper.fiction_bestsellers
      @books = BestsellingBooksByGenre::Fiction.all[0..number - 1]
    elsif genre == "nonfiction"
      BestsellingBooksByGenre::Scraper.nonfiction_bestsellers
      @books = BestsellingBooksByGenre::Nonfiction.all[0..number - 1]
    else
      puts "Sorry, invalid input. Please try again."
      return list_books
    end
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} by #{book.author}"
    end
  end

  def get_details
    puts "Please enter the number of the book you'd like to learn more about (or type exit):"
    input = gets.strip
    if input.to_i.between?(1,5)
      book = @books[input.to_i - 1]
      puts "#{book.summary}"
      get_details
    elsif input == "exit"
      puts "Goodbye!"
    else
      puts "Not sure what you want...Please try again."
      get_details
    end
  end
end
