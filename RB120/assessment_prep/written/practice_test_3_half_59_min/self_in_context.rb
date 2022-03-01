class Klass
  attr_writer :name

  def initialize(name)
    self.name = name
  end

  def self.method_name
  end
  self

  def some_instance_method
    self
  end
end

module A
  self
end
=begin
What are the use cases for self in Ruby, and how does self change based on the scope it is used in?
Provide examples.

`self` refers to the receiver or calling object of the currently executing code.

Prepending to a method name, `self` refers to the enclosing class. So in our above example
the `self` on line 8 refers to `Klass` since the `method_name` class method is defined upon
the `Klass` class.

Used outside of both a class method and an instance method, but within the `Klass` class definition
like on line 10, `self` refers to `Klass`.

On line 13, since it is located within an instance method definition, `self` refers to the calling
object of that instance method, presumably some instance of the `Klass` class.

As used on line 18, `self` refers to the module within which it is used, so `self` refers to the
`A` module.

It is used to disambiguate when we are calling a setter method versus initializing a new local variable.
=end
