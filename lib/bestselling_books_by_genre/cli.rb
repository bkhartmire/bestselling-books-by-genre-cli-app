class BestsellingBooksByGenre::CLI
  def call
    genre
    list_books
    get_details
  end

  def list_books
    puts "Would you like to view the NY Times top 5 bestselling fiction or nonfiction books?"
    genre = gets.strip
    if genre == "fiction"
      @books = BestsellingBooksByGenre::Book.fiction_bestsellers
    elsif genre == "nonfiction"
      @books = BestsellingBooksByGenre::Book.nonfiction_bestsellers
    end
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} by #{book.author}"
    end
  end

  def get_details
    puts "Please enter the number of the book you'd like to learn more about (or type exit):"
    input = gets.strip
    if input.to_i.between?(1,5)
      book = genre[input.to_i - 1]
      puts "#{book.summary}"
      #fix later
      #puts "To purchase this book on Amazon, visit: #{book.link_to_buy}"
    elsif input == "exit"
      puts "Goodbye!"
    else
      puts "Not sure what you want...Please try again."
      get_details
    end
  end
end
