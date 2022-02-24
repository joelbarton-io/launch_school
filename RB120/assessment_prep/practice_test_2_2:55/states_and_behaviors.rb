class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def run
    puts "#{@name} went for a jog!"
  end
end

class Child < Person; end

joe = Person.new("joe")
mary = Person.new('mary')
baby = Child.new("baby")

[joe, mary, baby].each(&:run)

=begin
What is the difference between states and behaviors?

'State' is the internal representation of an object; its the entirety of instance variables and
their values specific to some instance of a class. Behavior is what an object is capable of 'doing',
its the methods available to an instance of that class.

In the above code, the instance variable `@name` and the string value it points at ('joe') comprise
the `Person` object referenced by local variable `joe`'s state. `joe`'s ability to `run` is a
behavior available to all `Person` objects (like `joe`, `mary` can also run).

The `run` behavior is also available to objects of classes which inherit from `Person` like the `Child`
class instance `baby`. `baby` can also (suprisingly) run as well!

The state of `joe` is said to be encapsulated by itself since the only way to access information
stored in `joe`'s state is by utilizing some behavior (like the `name` getter) defined in the
`Person` class from which `joe` was instantiated.
=end
