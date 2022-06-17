require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :all_books, :all_persons, :all_rentals

  def initialize
    @all_books = []
    @all_persons = []
    @all_rentals = []
  end

  def list_books
    puts 'All books'
    @all_books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    puts 'All persons'
    @all_persons.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
    @all_books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @all_books.each_with_index do |book, index|
      puts "#{index} Title: \"#{book.title}\", Author: #{book.author}"
    end
    selected_book = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @all_persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end 
    selected_person = gets.chomp.to_i

    puts 'Enter rental date [yyyy/mm/dd]'
    print 'Date: '
    date = gets.chomp

    @all_rentals << Rental.new(date, @all_books[selected_book], @all_persons[selected_person])
    puts 'Rental created successfully'
  end
end
