# Which of these two classes has an instance variable and how do you know?
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin
The Pizza class has an instance variable.  Instances variables are defined by having an @
symbol at the beginning of the variable name.  This is what distinguishes them from local
variables, class variables, and constants.


Didn't mention: you can also ask objects if they have any instance methods by using the
`instance_variables` instance method (defined in the Object class).
=end