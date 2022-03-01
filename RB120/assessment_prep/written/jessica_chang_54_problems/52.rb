class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# In the `make_one_year_older` method we have used `self`. What is another way
# we could write this method so we don't have to use the `self` prefix? Which
# use case would be preferred according to best practices in Ruby, and why?
=begin
Alternatively, we could replace `self.age` with a direct reference to the
instance variable `@name`. Generally speaking, the original code is
prefered to this alternative directly accessing the `@instance_variable` itself.
Using the setter method `self.age=` grants for a greater level of specificity in
how we present the value stored in the instance variable. While in this case
it's a fairly straight-forward use here, but in most situations it makes sense
to use the already-defined setter.
=end
