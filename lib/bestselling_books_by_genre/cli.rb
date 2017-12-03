class BestsellingBooksByGenre::CLI
  def call
    puts "Hello"
  end

  def list_books
    puts "Would you like to view the NY Times top 5 bestselling fiction or nonfiction books?"
    genre = gets.strip
    if genre == "fiction"
      @fiction_books.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} by #{book.author}"
      end
    elsif genre == "nonfiction"
      @nonfiction_books.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} by #{book.author}"
      end
    end
  end
end
