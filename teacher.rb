require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization:, age:, name: 'Unknown', id: rand(1..1000))
    super(age: age, name: name, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
