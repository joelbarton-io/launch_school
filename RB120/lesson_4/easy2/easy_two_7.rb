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

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

=begin

the @@cats_count class variable keeps track of the amount of times that new
instances of the Cat class are instantiated.  Everytime we call the class method
`Class::new` on the Cat class, the instance method `Cat:initialize` is invoked.

Upon each invocation, the `@@cats_count` class variable is set to its current value
plus 1.

We could demonstrate this by instantiating a few Cat objects and then using the
class getter method `Cat::cats_count` to access the current value of the
class variable `@@cats_count`.

=end

sage = Cat.new('Tabby')
best_cat = Cat.new('Maroon')
puts Cat.cats_count


=begin

can say "object creation process" instead of instantiation of a new Cat object

