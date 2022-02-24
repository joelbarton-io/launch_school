module Walkable
  def walk
    puts " walking!"
  end
end

class Parent
  include Walkable
  def initialize(name)
    @name = name
  end
end

class Child < Parent
  attr_reader :name
end

=begin
How do class inheritance and mixing in modules affect instance variable scope? Give an example.

Neither class inheritance nor mixin modules affect the scope of instance variables.

When we define a class, we establish the additional available behaviors instances
of that class have access to upon instantiation. Upon instantiation, an object's
instance variables are typically initialized in the implementation of an `initialize`
method.

The scope of instance variables is still at the level of the object.
=end
