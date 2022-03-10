# CONSTANT = "constant"

# module Earth
#   CONSTANT = self

#   class Person
#     # CONSTANT = "I'm a person!" # => error
#     def initialize
#       puts CONSTANT
#     end
#   end
# end

# Earth::Person.new # => "I'm Earth!"

class Parent
  def self.class_var
    @@class_var
  end
  @@class_var = 1
end

class Child < Parent
  @@class_var = 2
end

p Child.class_var
