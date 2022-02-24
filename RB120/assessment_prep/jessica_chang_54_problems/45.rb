class Student
  attr_accessor :grade

  def initialize(name, grade = nil)
    @name = name
    # @grade = grade
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">


# Running the following code will not produce the output shown on the last line.
# Why not? What would we need to change, and what does this demonstrate about instance variables?

=begin
The output is different because we never initialize `@grade` instance variable. We would
expect to initialize it within our `initialize` method, however what actually happens is that
we initialize parameter variable `grade` to `nil`.

Uninitialized instance variables reference `nil`, however this reality isn't reflected in an
object's state unless we explicitly initalize the said instance variable to `nil`.
=end
