class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end

class Klass < Person
  def acc
    @name
  end
end

# What are the scopes of each of the different variables in the above code?
=begin
TITLES         -> lexically scoped to its surrounding environment, but accessible
                  elsewhere via the namespace resolution operator `::`
@@total_people -> accessible throughout the Person class as well as other
                  subclasses to Person
@name          -> accessible to instances of the Person class and instances of subclasses
                  who use the initialize method defined in Person
@age           -> @age is unitialized, but accessible to instances of the Person class and
                  instances of subclasses that inherit from Person

=end
p Klass.new("joel").age
