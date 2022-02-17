module Constantable
  CONSTANT = "constant"
end

class Person
  include Constantable

  def print_constant
    puts CONSTANT
  end
end

Person.new.print_constant # => NameError
