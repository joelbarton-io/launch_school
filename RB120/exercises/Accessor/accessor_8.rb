# The following code is flawed. It currently allows @name to be modified 
# from outside the method via a destructive method call. Fix the code so 
# that it returns a copy of @name instead of a reference to it.
=begin
-> don't want to let @name be modified from outside the class
-> want name getter to return a copy, not the actual instance variable name
=end
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

person1 = Person.new('James')
reversed = person1.name.reverse!
puts person1.name
puts reversed