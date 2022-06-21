require_relative 'nameable'
require_relative 'decorator'

class Person < Nameable
  def initialize(age:, name: 'Unknown', parent_permission: true, id: rand(1..1000))
    super()
    @id = "#{id}"
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

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
