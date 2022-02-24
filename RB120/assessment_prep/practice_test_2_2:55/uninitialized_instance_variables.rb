module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim
=begin
What is output and why? What does this demonstrate about instance variables?

When we invoke `Dog#swim` on the Dog object `teddy`, the code returns `nil` since instance variable
`@can_swim` was never initialized.  If we instead had invoked `enable_swimming` prior to invoking `swim` on
`teddy`, the string `swimming` would have been printed to the screen.

This demonstrates the fact that uninitialized instance variables reference `nil`. Since `@can_swim` points at
`nil` when we invoke `p teddy.swim` on line 16, the expression to the left of the `if` conditional is not returned
and instead `nil` is returned since the conditional's body is not evaluated (the string `swimming`).

=end
