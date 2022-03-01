class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")
=begin
What is output and why? What does this demonstrate about super?

`ArgumentError` is output to the screen, informing us that the `initialize`
method defined on line 2-3 wasn't expecting an argument but was supplied one.

Since we know that `super` called sans arguments or an empty parens "()", passes
all available arguments that are supplied to it from the method which encloses
it. This being the case, this output makes perfect sense since Ruby finds
the `initialize` defined in `Bear`'s superclass `Animal` and attempts to
evaluate it with the wrong number of arguments.

If instead, we had invoked `super` with empty parens, no error would have been
raised.  This demonstrates the three ways in which we can use `super` and how
the way we invoke `super` is extremely important to achieving the proper, desired
functionality.
=end
