class Person
  attr_reader :name

  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
p joe
=begin
What is output and why? What does this demonstrate about instance variables
that differentiates them from local variables?

output:

nil

`nil` is output to the screen because the `@name` instance variable was never initialized,
thus it references `nil` when we attempt to access it via the `name` getter on line 10.
If we were to call `set_name` on `bob` prior to invoking `name` upon `bob`, "Bob" would be
output since the `name` getter would be returning the current value of `@name` which at this
point would be the String `Bob`.

Instance variables differ from local variables in that if we were to try to reference
an uninitialized local variable, we would receive a `NameError` since you cannot
reference an uninitialized local variable. The same is not true of instance variables, as
demonstrated by the above code.
=end
