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
Upon each invocation of the various `speak` instance methods and subsequent encounters
with the `super` keyword, Ruby searches for an instance method in the Class' inheritance
hierarchy with the same name as the enclosing method within which `super` is found. Therefore
the `self` on line 3 refers to the calling object (receiver) of `speak`. This fact
is reflected in what is output from lines 25-28; each outputs an encoding of the object's id
as well as the class from which it was instantiated from followed by a specifc string.
=end
