require_relative 'navigation'
require_relative 'app'

def menu # rubocop:disable Metrics/CyclomaticComplexity
  app = App.new
  loop do
    navigation

    option = gets.chomp.to_i

    case option
    when 1 then app.list_books
    when 2 then app.list_people
    when 3 then app.create_person
    when 4 then app.create_book
    when 5 then app.create_rental
    when 6 then app.list_rentals
    when 7
      app.on_exit
      puts "Thank you for using this app \n\n"
      abort
    else
      puts "Invalid selection \n\n"
    end
  end
end
