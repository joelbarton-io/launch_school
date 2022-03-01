class UberMensche
  def display_titles
    p Person::TITLES
  end
end

class Person < UberMensche
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end

  def self.age
    @age
  end
end

class Me < Person
  def display_titles
    p TITLES
  end
  puts @@total_people
end

puts Person::TITLES
Me.new('joel').display_titles
UberMensche.new.display_titles
=begin
What are the scopes of each of the different variables in the above code?

The scope of `TITLES` is essentially everywhere in the codebase, if we are to use the
constant resolution operator (also known as the namespace resolution operator) `::`.

`@@total_people`, a class variable is accessible from anywhere in the `Person` class
and any subclass of `Person`.

`@age`, as an instance variable is scoped at the object level and can therefore only be
accessed by instance methods. If we try to access it from say a class method defined in
`Person`, we would find that it references `nil` since it is uninitialized.

=end
