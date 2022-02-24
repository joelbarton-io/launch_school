class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")

# Do molly and max have the same states and behaviors in the code above?
# Explain why or why not, and what this demonstrates about objects in Ruby.

=begin
They do not have the same states, however they do have identical behaviors.
Since they are both instances of the `Cat` class, they have access to the
exact same interface. Both can `purr`, `jump`, `sleep`, and `eat`.

Their states are entirely their own. The instance variables `@name` and `@coloring`
reference unique string objects ("Max" is not the same object as "Molly"). Even if
both Cat instances had the 'same' name and coloring, e.g. both were named "Max" and
both were "gray", they would still not have the same state since, while these strings
might have the same value, they are NOT the same string objects and thus their states
would not be the same (since instance variables track information about the state of
objects).

Every object has a unique id, and since the two cat objects referenced by
local variables molly and max are discrete objects, they do not have the
same state.
This demonstrates how objects are
=end
