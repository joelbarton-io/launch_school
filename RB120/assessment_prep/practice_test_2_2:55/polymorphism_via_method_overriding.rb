class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
    puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end
=begin
What is output and why? How does this code demonstrate polymorphism?

output:
=> "I eat."
=> "I eat plankton."
=> "I eat kibble."

This is an example of polymorphic behavior since we observe objects of
different types (instances of the `Animal`, `Fish`, and `Dog` classes)
responding differently to the "same" method call (the name of the method
that is invoked for each object is the same: `eat`).

Put differently, we observe polymorphism within the above code because
despite the three objects present in the `array_of_animals` array being
from different classes, they all respond to the `eat` method call since
each object has access to the interface `eat`. Is the implementation for
each different? Yes. But because they can all respond to the same method
call, we achieve polymorphic behavior (despite slightly different
implementations!).

The primary mechanism of this polymorphic behavior is method overriding.
Both `Fish#eat` and `Dog#eat` override `Animal#eat` since both the `Fish`
and `Animal` classes subclass to `Animal`.

=end
