require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, name: 'Unknown', classroom: nil, parent_permission: true, id: rand(1..1000))
    super(age: age, name: name, parent_permission: parent_permission, id: id)
    @classroom = classroom
    classroom.students << self if classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
