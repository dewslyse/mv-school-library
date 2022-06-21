require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'app_module'
require 'json'

class App
  include Exit
  attr_reader :all_books, :all_persons, :all_rentals

  def initialize
    @all_books = saved_books
    @all_persons = saved_people

    rentals_file = File.open('rentals.json')
    rentals = JSON.parse(rentals_file.read)
    rentals_array = []
    rentals.each do |rental|
      person = @all_persons.find { |item| rental['person_id'] == item.id }
      book = @all_books.find { |item| rental['title'] == item.title && rental['author'] == item.author }
      rentals_array << Rental.new(rental['date'], book, person)
    end
    rentals_file.close

    @all_rentals = rentals_array
  end

  def saved_books
    book_file = File.open('books.json')
    books = JSON.parse(book_file.read)
    book_array = []
    books.each do |book|
      book_array << Book.new(book['title'], book['author'])
    end
    book_file.close
    book_array
  end

  def saved_people
    people_file = File.open('people.json')
    people = JSON.parse(people_file.read)
    people_array = []
    people.each do |person|
      if person['type'] == 'Student'
        permission = person['parent_permission'] == 'true'
        people_array << Student.new(age: person['age'].to_i, name: person['name'], parent_permission: permission,
                                    id: person['id'].to_i)
      else
        people_array << Teacher.new(specialization: person['specialization'], age: person['age'].to_i,
                                    name: person['name'], id: person['id'].to_i)
      end
    end
    people_file.close
    people_array
  end

  def list_books
    puts "\nAll books"

    if @all_books.length.zero?
      puts 'Please choose option (4) to add a book'
    else
      @all_books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

  def list_people
    puts "\nAll persons"

    if @all_persons.length.zero?
      puts 'Please choose option (3) to add a person'
    else
      @all_persons.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def create_person
    puts "\nAdd a person"
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type_of_person = gets.chomp.to_i

    case type_of_person
    when 1 then create_student
    when 2 then create_teacher
    else
      puts 'Please choose (1) or (2)'
      create_person
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase
    parent_permission = permission == 'y'
    @all_persons << Student.new(age: age, name: name, parent_permission: parent_permission)
    puts "Person created successfully\n\n"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @all_persons << Teacher.new(specialization: specialization, age: age, name: name)
    puts "Person created successfully\n\n"
  end

  def create_book
    puts
    puts 'Create a book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @all_books << Book.new(title, author)
    puts 'Book created successfully'
    puts
  end

  def create_rental
    puts "\nSelect a book from the following list by number"
    @all_books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    selected_book = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @all_persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i

    puts "\nEnter rental date [yyyy/mm/dd]"
    print 'Date: '
    date = gets.chomp

    @all_rentals << Rental.new(date, @all_books[selected_book], @all_persons[selected_person])
    puts "Rental created successfully \n\n"
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp

    person = @all_persons.find { |item| id == item.id }

    if person
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'Person ID does not exist'
    end
    puts
  end

  def on_exit_books
    all_books = []
    @all_books.each do |book|
      json_object = { title: book.title.to_s, author: book.author.to_s }
      all_books << json_object
    end
    File.write('books.json', JSON.generate(all_books))
  end
end
