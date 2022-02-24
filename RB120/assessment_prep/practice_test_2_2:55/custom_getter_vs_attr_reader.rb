=begin
Give an example of when it would make sense to manually write a custom getter method vs. using attr_reader.

The code below is a great example of when we might want to write a custom getter method.
Since `@ssn` should be more protected than `@name`, it makes sense to write a custom getter.

Our custom `ssn` getter method only displays the last four digits of our object's
`@ssn` instance variable's value. We can make decisions about how we want our data
presented.
=end

class Person
  attr_reader :name

  def initialize(name, ssn)
    @name = name
    @ssn = ssn.to_s
  end

  def ssn
    puts @ssn.chars.last(4).join("-")
  end
end

Person.new("joel", 123456789).ssn
