class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name

=begin
What is output and why?
output:

=> "bark! bark! bark! bark!"

Instance variable `@name` is never initialized. When we try to directly access its value
on line 11, `nil` is returned since uninitialized instance variables point at `nil`.

The sequence is as follows.

On line 15, we initialize a new `Dog` object. `::new` triggers the `initialize` method
defined on line 8 where the string `Teddy` is assigned to parameter variable `name`.
Sinced we didn't use `super`, Ruby never gets to evaluate the `initialize` method defined
in `Dog`'s superclass `Animal`, thus `@name` is never initialized to the value referenced by
parameter variable `name`.
=end
