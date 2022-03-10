# class Klass   # checks
#   CONSTANT = self # Klass
# end

# CONSTANT = self

# class A < Klass
#   def a
#     p CONSTANT
#   end
#   # checks
#   module B
#     def b
#       puts CONSTANT
#     end

#     module C # not included, yet!
#       def c
#         puts CONSTANT # looks in C, then B -> resolves!
#       end

#       module D # not included, yet!
#         def d
#           puts CONSTANT
#         end

#         class EE # => Object
#           A.new.a
#           # include A
#           include B
#           include C
#           include D
#         end
#       end
#     end
#   end
#   # checks
# end

# # What are some of the differences between constant lookup and method lookup?
# # Talk through an example of each in the above code.
# instance = A::B::C::D::EE.new

# instance.a
# # instance.b
# # instance.c # A::...EE -> D -> C -> lookup resolved!
# # instance.d
# # class Klass; end # instance of the Class class, subclasses to?

# class Person
#   def initialize(name)
#     @name = name
#   end

#   def say_name
#     "My name is #{name}"
#   end

#   private

#   attr_reader :name
# end

# class Baby < Person
#   def invoke_name_getter
#     name
#   end

#   private

#   def name
#     "My name is #{super} and I'm defined in #{self.class}"
#   end
# end

# joel = Person.new("Joel")
# # p joel.instance_variables
# p joel.instance_variable_get(joel.instance_variables.first)
# p joel.class.instance_methods.first
# p joel.send(joel.class.instance_methods.first)

# baby = Baby.new("Charlie")
# p baby.invoke_name_getter

# class Art
#   private

#   def self.priv_class_method
#     puts "I'm a class method"
#   end
# end

# p Art.singleton_methods

# class Painter
#   def paint; end
# end

# class Designer
#   def design; end
# end

# painter = Painter.new
# designer = Designer.new

# painter.design
# designer.paint
