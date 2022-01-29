

class Student
  def initialize(name)
    @name = name
    @grade = nil
  end
end

ade = Student.new('Adewale')
ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
