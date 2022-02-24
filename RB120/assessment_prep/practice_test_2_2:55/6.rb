class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name
=begin
In the code above, we hope to output 'BOB' on line 16. Instead, we raise an error.
Why? How could we adjust this code to output 'BOB'?

When we invoke `change_name` on the `Person` object referenced by local variable `bob`,
we receive a `NoMethodError`. This is because line 9 attempts to initialize a local variable
to its unitialized value upcased; it attempts to `upcase` `nil`, which of course
is impossible as there is no `upcase` method available to `nil`.

This is an easy fix.  All we must do to achieve the desired functionality is prepend `self`
to `name` on line 9 so as to inform Ruby that we are invoking the setter method `name=`
on the `Person` instance `bob`, thus reassigning `@name` to a new string value `BOB`.
=end
