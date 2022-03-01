class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)

# What are the collaborator objects in the above code snippet, and what makes them collaborator
# objects?
=begin
Technically, so long as an object is part of another object's state, it is a collaborator object.
That being said, we usually think of instances of user-defined classes as being collaborator
objects. This being the case, the `Person` object referenced by local variable `sara` is the
sole collaborator object in this above code since the the 'sara' instance of the user-defined
`Person` class comprises part of the state of the `Cat` object referenced by local variable
`fluffy` on line 15.
=end
