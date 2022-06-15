require_relative 'nameable'
require_relative 'decorator'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = "#{name}#{rand(1..1000)}"
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rental
  attr_accessor :name, :age

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

# Test code
person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
