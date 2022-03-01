class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.jump
=begin
We raise an error in the code above. Why? What do kitty and bud represent
in relation to our Person object?

The error is raised because, in its current implementation, our code attempts to
invoke the `Pet#jump` instance method upon the Array object referenced by
instance variable `@pets`.  No such method exists for Array objects.

The `Cat` and `BullDog` object referenced by `kitty` and `bud` are collaborator
objects to the `Person` object referenced by local variable `bob`. This is the case
because both pets comprise part of the `bob`'s state; they are stored as state
within the array referenced by the `@pets` instance variable.  As such, they
are thought of as collaborator objects.

If we wanted to achieve the assumed desired output, all we would have to do is
change line 28 to read: `bob.pets.each(&:jump)`.  This would allow us to invoke
`Pet#jump` upon the elements (`Cat` and `BullDog` objects) contained within
the array referenced by `@pets`.

Technically, any object that comprises another object's state (e.g. referenced
by some object's instance variable) is a collaborator object, but usually we only refer
to instances of custom classes as being collaborators objects since almost everything
in Ruby is in fact an object...
=end
