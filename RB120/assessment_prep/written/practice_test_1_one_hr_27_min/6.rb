class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name
p sir_gallant.speak
=begin
What is output and returned, and why? What would we need to change so that the
last line outputs ”Sir Gallant is speaking.”?

We need to change line 9. Currently, we are directly referencing the instance variable
@name while we should invoke the `Knight#name` instance method defined on lines 14-16.

However, we want to make sure we reference the correct `name` method (the one on lines
14-16). This example demonstrates how `super` works. When we invoke `speak` on `sir_gallant`,
and Ruby begins looking for an instance method called `name`, it begins its search in the
`Knight` class since `sir_gallant` is a `Knight` object. It then concatonates "Sir" to the
return value from `Character#name` (which is the value referenced by `@name`).
=end
