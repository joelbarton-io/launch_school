# class Dog
#   attr_reader :name, :breed

#   def self.speak
#     "Woof Woof!"
#   end

#   def initialize(name, breed)
#     @name  = name
#     @breed = breed
#   end
# end

# doge = Dog.new("Lucky", "Shiba Inu")

# def doge.speak # defined in the the singleton class of `doge`!
#   %w(so very many much wow).sample
# end

# def doge.pose # defining another method in the singleton class `doge`!
#   puts "#{speak} downward dog!"
# end

# p doge.class # Dog
# p doge.class.speak # Woof Woof!
# doge.pose # wow downward dog!

# p doge.singleton_methods

# class Person
#   def self.greet
#     "*waves*"
#   end
# end

# class Parent < Person
#   def self.greet

#   end
# end

# class Child < Parent
#   def self.greet
#     "#{super} baba booeyy!"
#   end
# end

# puts Person.greet
# puts Parent.greet
# puts Child.greet

# class Person
#   def jump
#     puts "A #{self.class} object jumped in the air!"
#   end

#   def self.run
#     puts "A #{self.class} object ran down the road!"
#   end
# end

# joel = Person.new

# # joel.jump
# def joel.jump
#   puts "A #{singleton_class.superclass} object jumped in the air!"
# end

# # joel.jump
# p joel.singleton_methods
# p Person.singleton_methods
# p Person.singleton_class.superclass
# p Person.singleton_class.superclass.superclass

