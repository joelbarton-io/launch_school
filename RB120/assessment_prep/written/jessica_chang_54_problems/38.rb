module Swimmable
  def swim; end # specific behavior accessible to 
end

class Mammal
  def eat; end
end

class Whale < Mammal
  include Swimmable
end

class Cat < Mammal; end

class Seal < Mammal
  include Swimmable
end

# When should we use class inheritance vs. interface inheritance?

=begin
The purpose or goal of implementing inheritance is to reduce code duplication and
allowing for more flexible, maintainable, and reusable code. It allows us to abstract
code that is commonly used to a single place that we can then either selectively include
or allow subclasses to access.

We reach for class inheritance when there is an 'is-a' relationship in play. Say we
have one superclass and three subclasses. We would put common behaviors that we want
all subclasses to have access to within our superclass because we would only have
to write that behavior once.  However, say we only want two of our subclasses to
have access to this behavior. This is the circumstance when we would reach for
interface inheritance since it allows us to selectively `include` some functionality
where we need it while only writing that functionality in one place but being
able to use it in multiple places (e.g. the two subclasses where we included the
module wherein we defined some behavior).
=end
