class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    puts self.age
    self.age += 1
  end
end

cat = Cat.new('tabby')

cat.make_one_year_older
puts cat.age
=begin
In the make_one_year_older method we have used self. What is another way we could
write this method so we don't have to use the self prefix?


We could simply call the setter method for :age.  This would result in the same
functionality.

the 'self' on line 10 refers to the calling object, which since `make_one_year_older`
is an instance method, is whatever instance of the Cat class is invoking `make_one_year_older`.



GOT THIS ONE WRONG

self.age += 1    ~    @age += 1

in this context, self.age and @age refer to the same instance variable
=end