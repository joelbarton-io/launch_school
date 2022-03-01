module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape

=begin
What is output and why? What does this demonstrate about constant scope?
What does self refer to in each of the 3 methods above?

Lines 25 and 26 both print `4` to the screen while line 27 triggers a NameError exception.

On line 25, we invoke the class method `self.sides` upon the `Square` class. Since the class method
`self.sides` is defined in a class (`Shape`) that is one of `Square`'s ancestors, `Square` has access
to this method. Upon invocation, the body of the method is evaluated, involving the `::` namespace
resolution operator which, since `self` references the `Square` class, Ruby begins its search for `SIDES`
within the `Square` class, checking the immediate lexical scope and then, after not finding it, moving up
to `Square`'s super class `Quadrilateral` where `SIDES` is resolved and thus printed to the screen.

On line 26, we invoke the instance method `sides` on an instance of the `Square` class. Since `sides` is
defined in a class (`Shape`) that is one of `Square`'s ancestors, `Square` has access to this method via class
inheritance. Upon invocation, the body of the method is evaluated. `self.class` resolves to `Square` since
the calling object is an instance of the `Square` class. Via the namespace resolution operator, `Square::SIDES`
is where it begins its search to resolve the `SIDES` constant lookup. Not finding it in the lexical scope
of `Square` it looks up `Square`'s inheritance hierarchy and finds and resolves `SIDES` on line 20.

On line 27, we invoke the instance method `describe_sides` on an instance of the `Square` class.
Since the calling object of `describe_sides`


of the `Square` class inherit `sides` and `describe_shape` through class (`sides`) and interface
inheritance (`describe_shape`).

`self` on line 3 references the calling object, in this case an instance of the `Square class`.
`self` on line 11 references the calling object, in this case the `Square` class.
`self` on line 15 references the calling object, in this case an instance of the `Square` class.


=end
