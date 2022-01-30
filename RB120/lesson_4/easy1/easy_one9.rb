class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end


#In the name of the cats_count method we have used self.
# What does self refer to in this context?

=begin

When `self.` prepends a method defined within a class, that method is a
class method; it can only be called upon the Class itself, the class
within which it is defined, which in this case is the Cat class.

Forgot to mention:
`self` represents the class itself.