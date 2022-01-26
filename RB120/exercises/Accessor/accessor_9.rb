# Using the following code, multiply @age by 2 upon assignment, 
# then multiply @age by 2 again when @age is returned by the getter method.

class Person

  def age=(age)
    @age = times_two(age)
  end

  def age 
    times_two(@age)
  end

  private
  def times_two(value)
    value*2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age