require_relative 'book'

class App
  attr_reader :books

  def initialize
    @all_books = []
  end

  def list_books
    puts 'All books'
    @all_books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def create_book
    puts 'Create a book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    puts 'Book created successfully'
    @all_books << Book.new(title, author)
  end
end
