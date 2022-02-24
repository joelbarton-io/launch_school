class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels # 4

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels # 2
p Vehicle.wheels # 2

class Car < Vehicle; end

p Vehicle.wheels # 2
p Motorcycle.wheels # 2
p Car.wheels # 2
=begin
What does the code above output, and why? What does this demonstrate about class variables, and
why we should avoid using class variables when working with inheritance?

output:

4
2
2
2
2
2

Class variables are treacherous to use within the context of inheritance.  This is because there is
only ever one 'copy' of a class variable throughout an inheritance hierarchy.  This fact is what
accounts for the code's output.

When we invoke `self.wheels` upon the `Vehicle` class, at this point in the execution, `@@wheels`
points at `4`. However, as soon as ruby processes the reassignment of `@@wheels` on line
12, now all references to `@@wheels` point at this new value `2` (as evidenced by the `p` method
invocations on lines 15-16).

Basically, any modifications to the value of a class variable within a subclass will be evident in superclasses
to that subclass where the modification occurred. Furthermore, this change also propogates throughout other
subclass which subclass to the superclass wherein the class variable was initially defined.
=end
