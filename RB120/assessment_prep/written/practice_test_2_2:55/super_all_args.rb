class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno
=begin
What is output and why? What does this demonstrate about super?

Line 17 prints to the screen the `GoodDog` object referenced by `bruno`.

Called without specified arguments or without empty "()", `super` grabs all
arguments from the enclosing method wherein it was invoked (so the value referenced
by parameter variable `color`) and passes this argument up to the `initialize` method
defined in its superclass. In this example, the string `brown` is passed to the
`initialize` method defined on lines 4-7, assigned to parameter `name`, which is
then referenced by the instance variable `@name`. Super then returns to the
context of the `initialize` which encloses it wherein the instance variable `@color`
is initialized to the string value `"brown"` referenced by the parameter variable
`color`.

All of this is evidenced by the output from line 17.
=end
