class FarmAnimal
  def speak
    "#{self} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak
p Lamb.new.speak
p Cow.new.speak

# What is output and why?
=begin

The above code has three classes which inherit from `FarmAnimal`. All four classes
define specific implementations of a `speak` instance method.

Each time we invoke `speak` on the various objects, we are invoking a unique `speak` instance
method, each of which is defined with a `super` keyword.  Everytime Ruby reaches `super`,
it looks for a method of the same name as which enclosed `super`. Each time, `self` refers to
calling object of the `speak` method wherein `super` was used.

Printed to the screen are the various object's Class name, followed by an encoding of
the specific object's id and a unique string representing some sound. In order to achieve
the desired result, we need to modify line 3 by appending an invocation of `class` to `self`.
For each invocation of `speak`, `self` references the calling object, while we want to print
each respective calling object's class name.
=end
