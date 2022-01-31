class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

=begin
When objects are created they are a separate realization of a particular class.
Given the class below, how do we create two different instances of this class
with separate names and ages?

We instantiate multiple instances of the class AngryCat with diff names/ages.
These values, stored in the instance variables, make up each object's state.
=end
