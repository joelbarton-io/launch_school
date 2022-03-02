








# example 1
# class Person
#   def initialize(name)
#     @name = name
#   end

#   public

#   attr_reader :name   # define a getter for @name
# end

# friend = Person.new('Hans Gruber')    # instantiate an instance of the Person class
# puts friend.name    # => Hans Gruber


# example 2

class Person
  def initialize(name, age)
    @name = name
    @age  = age
  end

   def display_age
    puts (age > 70) ? "Some would say it's rude to ask such questions dear." : age
  end

  private

  attr_reader :name, :age
end

friend = Person.new("Hans Gruber", 42)

# puts friend.age # => private method `age' called for #<Person:0x00007fbc3b918ee0 @name="Hans Gruber", @age=42> (NoMethodError)
friend.display_age # 42


=begin
class Person
  attr_reader :name

  def initialize(name, age)
    @name = name
    @age  = age
  end

  def ==(other)
    name == other.name
  end

  private
  attr_reader :age
end


# example 4
class Person

  def initialize(name)
    @name = name
  end

  def ==(other)
    name == other.name
  end

  protected

  attr_reader :name

end

=end