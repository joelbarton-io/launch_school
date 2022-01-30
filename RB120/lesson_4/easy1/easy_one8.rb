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

# You can see in the make_one_year_older method we have used self.
# What does self refer to here?

=begin

Since self is contained within the instance method `make_one_year_older`
`self` refers to the calling object of that method, which must be an instance
of the Cat class. Put differently, self refers to the calling object.