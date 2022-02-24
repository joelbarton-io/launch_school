class Mammal
  def born
    # birthing
  end
end

class Whale < Mammal
  def paddle
    # real speed!
  end
end

class Dog < Mammal
  def paddle
    # doggie paddling
  end
end

=begin
When should we use class inheritance vs. interface inheritance?

Class inheritance makes sense when there exists an `is-a` relationship between
two areas (classes) of our code.  Class inheritance lends itself perfectly to
modeling naturally hierarchical concepts and problem domains. In general,
a superclass would be where we define more general behavior, whereas a subclass
would be where we define more specific, detailed behavior.

Interface inheritance makes sense when there exists a 'has-a' relationship
present in the code.
=end
