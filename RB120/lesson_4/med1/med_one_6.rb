class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

p Computer.instance_variables
# what's the difference in these two methods?

=begin
Main difference is the use of self in both
instance methods.  In `create_template` `self`
takes the place of the `@` symbol. This demonstrates
that using a setter method and setting the instance
variable directly can be used interchangeably.

In the `show_template` method, the `self` is unnecessary
since we are just invoking the getter method for
`:template`. 
=end