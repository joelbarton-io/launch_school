# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age  = a * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky
# What is output and why? How could we output a message of our choice instead?

=begin
The above code outputs the name of the class `GoodDog` followed by an encoding the
GoodDog object referenced by `sparky`. This is due to how the `Object#to_s` method
is implemented.  Since we call `puts` and supply it a GoodDog object, `to_s` is
called upon this object and that is what is output to the screen.

To output a message of our choice we would need to define a custom `to_s` method
to override the default `Object#to_s`. It would look something like the following:

def to_s
  "#{name} is #{age} years old!"
end

=end
# How is the output above different than the output of the code below, and why?

=begin
Unlike the above code, here we are passing a `GoodDog` object to `p` as an argument
which in turn invokes `inspect` upon the argument prior to printing it to the screen.

`puts` and `p` have different implementations and this is what accounts for the
differences between the two code snippets.
=end
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky