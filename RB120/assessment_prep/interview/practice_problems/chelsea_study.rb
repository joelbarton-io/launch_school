# Why should a class has as few public methods as possible?

# allows for hidden behaviors; privatize some behavior that you dont want to
# have accessible from outside the class.

# private, protected (access modifiers) ->

# class Person
#   # attr_reader :name

#   def initialize(name) # private
#     @name = name # i-var; inaccessible
#   end

#   def im_public; end

#   private # method or keyword?

#   def say_hi; end
# end

# joel = Person.new('Joel')
# p joel.instance_variable_get(:@name)

# why as few as possible? simplicity in how a class is used

# What is the goal of inheritance?  Describe inheritance (types); why it's important for OO.
# Why is it helpful?

=begin
inheritance: the process by which behaviors are inherited

class -> super/sub relationship -> 'is-a'

interface -> mixin modules -> 'has-a'

"getting" methods from a superclass
DRY-er code; less repetition

classes super class and subclass, 'is-a'

'extracting' general behavior
=end

# attribute??  i-var and the value it references; getters/setters (inherited)

# ivars scoped at object-level

# attr_accessors able to be inherited (thus have the potential to have instance var)

# module Walkable
#   def can_walk
#     puts "A #{self.class} is walking!"
#   end
# end

# class Animal
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age  = age
#   end

#   def breathe
#     puts "An instance of the #{self.class} class is breathing."
#   end
# end

# class Fish < Animal; end # all are 'is-a'

# class Bird < Animal
#   include Walkable # Birds have an ability to walk

#   def can_walk
#     puts 'tippy tappy'
#   end
# end

# class Dog < Animal
#   include Walkable
# end

# class Cat < Animal
#   include Walkable
# end

# 'same' method call (interface)
# [Cat.new, Dog.new, Bird.new, Fish.new].each(&:breath) # polymorphic behavior is achieved via??

# # polymorphism via class inheritance

# [Cat.new, Dog.new, Bird.new].each(&:can_walk) # via interface inheritance

# Cat.new # some_instance_method [Cat,Walkable,Animal,Object, Kernel, BasicObject]

# Cat class -> Walkable resolves!
# Bird class resolves!
# invoke some method can_walk : Method lookup path


# polymorphism -> class inheritance (inheritance hierarchy), interface inheritance (inheritance hierarchy)

# duck typing! -> alt way to achieve.

# no formal relationship; can you respond? informal grouping

# new_arr = [1, '1', [], 1.3].map { |el| el.*(3) }

# p new_arr # [3, "111", [], 3.9000000000000004]

# class SportsGame
#   def play(attendees)
#     attendees.each(&:attend)
#   end
# end

# # define classes for each type of object that attends the sports game
# class Athlete
#   def attend
#     puts "Plays Sport!"
#   end
# end

# class Fan
#   def attend
#     puts "Cheers and eats popcorn!"
#   end
# end

# class Vendor
#   def attend
#     puts "Sells hotdogs!"
#   end
# end

# SportsGame.new.play([Athlete.new, Fan.new, Vendor.new]) # informal grouping based on their shared interface (attend)

=begin
foundation of OO; silo information and behavior (objects and class)

abstraction and polymorphism

class-level: grouping behaviors, method access control (visibility of behaviors from outside of classes)
object-level: instance variables being scoped at the object-level; access/modify the info stored as state in custom objects

objects encapsulate themselves! @i-vars
=end

class Person # 'open'
  private # 'private'

  def a_method
    puts "hi"
  end
end

Person.new.a_method
Person.new.send(:a_method)

# objects as being more enclosed than classes.
