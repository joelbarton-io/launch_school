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
=begin
What are the collaborator objects in the above code snippet, and what
makes them collaborator objects?

Technically, any object that is referenced by an instance variable of an object
and thus stored as state of that object is a collaborator object. Following this
interpretation, the `Person` object referenced by local variable `sara` and the
String object `Fluffy` are collaborator objects to the `Cat` object referenced
by local variable `fluffy`. The String object `sara` is also a collaborator to
the Person object referenced by the instance variable `sara`.

However, we usually think of collaborator objects as objects instantiated from
user-defined classes that make up part of another object's state (e.g. they (some
object) are referenced by another object's instance variable).

In this interpretation, the Person object referenced by local variable `sara` is
the collaborator object since `sara` is referenced by `fluffy`'s instance variable
`@owner` and thus makes up part of `fluffy's` state.
=end
