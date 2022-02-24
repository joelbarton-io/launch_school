class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

=begin
Running the following code will not produce the output shown on the last line.
Why not? What would we need to change, and what does this demonstrate about
instance variables?

Instance variable `@grade` is never initialized. As an unitialized instance variable,
it will not be displayed as part of the `Student` object `ada`'s state since
initialization is a prerequisite for an instance variable to be part of an object's
state.

If we were to place a `binding.pry` inside of our `initialize` method on say line 5,
we could check to see what `@grade`, `@name`, and local variable `grade` reference.
What we will see is that while local variable `grade` does reference `nil`, this
does not mean that instance variable `@grade` will also reference `nil`.

If we changed the code to display the desired output, we would need to initialize
`@grade` = `grade` (which explicitly references `nil`). Basically, explicitly
referencing `nil` versus just being uninitialized (and thus referencing `nil`) are
very different and this difference is reflected in the object's state.
=end
