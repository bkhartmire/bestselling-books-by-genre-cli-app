class BestsellingBooksByGenre::CLI
  def call
    puts "Hello"
  end

  def list_books
    puts "Would you like to view the NY Times top 5 bestselling fiction or nonfiction books?"
    @@genre = gets.strip
    if @@genre == "fiction"
      @fiction_books.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} by #{book.author}"
      end
    elsif @@genre == "nonfiction"
      @nonfiction_books.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} by #{book.author}"
      end
    end
  end

  def get_details
    if @@genre == "fiction"
      book_array = @fiction_books
    elsif @@genre == "nonfiction"
      book_array = @nonfiction_books
    end
    puts "Please enter the number of the book you'd like to learn more about (or type exit):"
    input = gets.strip
    if input.to_i.between?(1,5)
      book = book_array[input.to_i - 1]
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
