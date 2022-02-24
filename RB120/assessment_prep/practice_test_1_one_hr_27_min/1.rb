class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak
# What does this code output and why?

=begin
When we invoke the instance method `Cow#sound` on the `Cow` object `daisy`,
the string "Daisy says moooooooooo!" is output the the screen.

Upon invocation, Ruby searches for an instance method `sound` in the class
of the calling object, which is the `Cow` class.  It finds it here, however
once it encounters the `super` keyword, Ruby searches `Cow`'s superclass
for a method of the same name as the method which encloses `super`.  It finds
this method in `Animal` and invokes it.

The value of the instance variable @name is accessed directly and interpolated
into the string containing 'says', all of which is returned by `Animal#speak`
to the location of the `super` keyword. This string "Daisy says" is then
concatonated with 'moooooo!' and returned on line 22.
=end
