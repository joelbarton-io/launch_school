class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    self.grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade
# In the above code snippet, we want to return ”A”. What is actually returned
# and why? How could we adjust the code to produce the desired result?

=begin
`nil` is returned because we never reassign `@grade`. Where we attempt to reassign
it on line 10, we are actually initializing a new local variable `grade`. The only
adjustment we would need to make would be to prepend `self` to `grade` on line 10.
This would express to Ruby that what we want to do is invoke the `grade` setter
method, defined on line 2 via `attr_accessor :grade`, and thus reassign the instance
variable `@grade` to the desired value of "A".
=end
