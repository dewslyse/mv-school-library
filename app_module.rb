module Exit
  def on_exit
    on_exit_books

    all_persons = []
    @all_persons.each do |person|
      json_object = if person.class.to_s == 'Student'
                      { type: 'Student', id: person.id.to_s, age: person.age.to_s, name: person.name.to_s,
                        parent_permission: person.parent_permission.to_s }
                    else
                      { type: 'Teacher', id: person.id.to_s, age: person.age.to_s, name: person.name.to_s,
                        specialization: person.specialization.to_s }
                    end
      all_persons << json_object
    end
    all_rentals = []
    @all_rentals.each do |rental|
      json_object = { date: rental.date.to_s, title: rental.book.title.to_s, author: rental.book.author.to_s,
                      person_id: rental.person.id.to_s }
      all_rentals << json_object
    end
    File.write('rentals.json', JSON.generate(all_rentals))
    File.write('people.json', JSON.generate(all_persons))
  end
end
