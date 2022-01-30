# What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end

puts Cube.new(21)
=begin
We could add either an attr_accessor or an attr_reader instance method.

However, it would make the most sense to define an attr_reader volume method since
all the question asks us to do is be able to read the current value of the @volume instance
variable.

We could then invoke the getter method `.volume` on an instance of the Cube class to read
the current value of the @volume instance variable.



Alternatively, although not recommended by LS, we could invoke the `instance_variable_get` instance
method on an instance of the Cube class, which would return the specified instance variable.
=end