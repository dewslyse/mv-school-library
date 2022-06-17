require_relative 'book'
require_relative 'student'
require_relative 'teacher'

class App
  attr_reader :books

  def initialize
    @all_books = []
    @all_persons = []
  end

  def list_books
    puts 'All books'
    @all_books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def create_person
    puts 'Add a person'
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type_of_person = gets.chomp.to_i

    create_person while type_of_person != 1 && type_of_person != 2

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    if type_of_person == 1
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      parent_permission = permission == 'y'
      @all_persons << Student.new(age, name, parent_permission)
    else
      print 'Specialization: '
      specialization = gets.chomp
      @all_persons << Teacher.new(specialization, age, name)
    end
    puts 'Person created successfully'
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
