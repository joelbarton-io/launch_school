class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"
=begin
What does the above code demonstrate about how instance variables are scoped?

The above code shows that instance varaibles are scoped at the object level. This
means that they only way we can access or modify them is via some instance method
defined within the class of which the object is an instance.

There is no way to access either value referenced by either instance's `@name`
instance variable except via accessor methods the object in question has access
to. Using the reader method `Person#get_name` we can access value referenced by
either `bob` or `joe`'s `@name` instance variable.
=end
