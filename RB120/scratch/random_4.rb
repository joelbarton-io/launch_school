require 'pry'
class Person
  attr_accessor :name, :age, :occupation, :gender

  def initialize(name, age, occupation, gender)
    self.name = name
    self.age = age
    self.occupation = occupation
    self.gender = gender
  end

  def update_person(n, a, o, g)
    p self             # calling object
    p binding.receiver # calling object
    binding.receiver.name = n
    binding.receiver.age = a
    binding.receiver.occupation = o
    self.gender = g
  end

  def to_s
    "#name is a #{self.age} year old #{self.gender} who is a #{self.occupation}."
  end
end

# joel = Person.new("joel", 25, 'student')

[Object.new, Person.new("joel", 25, 'student', 'M')].each { |obj| puts obj }

