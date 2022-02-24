class Person
  attr_writer :last_name
  attr_reader :first_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
  end
end

=begin
What is the attr_accessor method, and why wouldn’t we want to just add attr_accessor methods
for every instance variable in our class? Give an example.

`attr_accessor` is a method defined in `Module` that creates two methods, a getter and a setter for
all specified :attributes. Sometimes we only want the getter functionality or we just want the setter
functionality. These are instances where it makes sense to not just add `attr_accessor`s for every
instance variable. Take the above code for example.

The above code only allows us to modify the value referenced by the `@last_name` instance variable, but
prevents us from modifying the `@first_name` of `Person` objects. If we had just defined our class with
the following: `attr_accessor :first_name, :last_name` we wouldn't have this specific functionality.
While it does sometimes make sense to just use an `attr_accessor` for some trivial class, it doesn't
make sense in our `Person` class since we dont want to be able to change our `@first_name`.
=end
