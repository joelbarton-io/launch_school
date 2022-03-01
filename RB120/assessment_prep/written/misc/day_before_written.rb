# class Circle
#   include Math
#   def initialize(radius)
#     @radius = radius
#   end

#   def >(other)
#     area > other.area
#   end

#   def area
#     Math::PI * (radius * radius)
#   end

#   # attr_reader :radius
# end

# circle_a = Circle.new(5)
# circle_b = Circle.new(4)

# p circle_a > circle_b # true
# p circle_a.area     # a NoMethodError should occur here
# p circle_a.radius   # a NoMethodError should occur here

# This is the sport class

# class Sport
#   def stretch
#     'general stretching routine'
#   end
# end

# class Basketball < Sport; end

# class Soccer < Sport; end

# class Running < Sport; end

# [Sport.new, Basketball.new, Soccer.new, Running.new].each(&:stretch)

# Sport.new.asdfasdf

# class Foo
#   attr_accessor :bar
#   attr_reader :baz
#   attr_writer :qux

#   def initialize(bar, qux)
#     @bar = bar
#     self.qux = qux
#   end
# end

# foo = Foo.new(1, 2)

# p foo.bar # => 1              -> :bar and :bar=
# foo.bar = 2
# p foo.bar # => 2
# p foo.baz # => nil            -> @baz is uninitialized and thus references nil
# foo.baz = 3 # NoMethodError   -> :baz only
# p foo.qux # NoMethodError     -> :qux= only

# class Parent
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def change_name_to(new_name)
#     # below, `self` refers to the calling object of change_name_to
#     self.name = new_name # using `self` to invoke an instance method (`name`)
#   end

#   def self.greet
#     puts "I'm being called on the #{self} class."
#   end

#   def greet
#     puts "I'm being called on an instance of #{self.class}."
#   end
# end

# class Child < Parent; end

# # calling a class method on two classes:
# Parent.greet # I'm being called on the Parent class.
# Child.greet # I'm being called on the Child class.

# # calling an instance method on two instances:
# Parent.new('A').greet # I'm being called on an instance of Parent.
# Child.new("Z").greet # I'm being called on an instance of Child.

# jeremy = Parent.new('Jeremy')
# jeremy.change_name_to('Sean')
# p jeremy # #<Parent:0x... @name="Sean">, we reassigned @sean using the setter Writer#name=

# module Action
#   def self.whistle
#     puts "*whistles*"
#   end
# end

# class Parent
#   def some_method
#     Action.whistle # Action::whistle also works, but using `::` in this way feels wrong
#   end
# end

# Parent.new.some_method # => *whistles*

# Action.whistle # => *whistles*

# class Circle
#   def initialize(radius)
#     @radius = radius
#   end

#   def >(other)
#     area > other.area
#   end

#   protected # added

#   def area
#     Math::PI * (radius * radius)
#   end

#   attr_reader :radius
# end

# circle_a = Circle.new(5)
# circle_b = Circle.new(4)

# p circle_a > circle_b # true
# circle_a.area     # a NoMethodError should occur here
# circle_a.radius   # a NoMethodError should occur here

# # We use `Module#protected` to limit access to `Circle#area` and `Circle#radius` to within the `Circle` class while keeping `Circle#>` part of the public interface of the class. This addition brings about the desired output since we can still invoke `>` from

# Problem by Natalie Thompson
class Person
  def initialize(name, job)
    @name = name
    @job = job
  end

  def to_s; "My name is #{@name} and I am #{@job}"; end
end

roger = Person.new("Roger", "Carpenter")
puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method.


#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"
# Hmm, this one seems really weird. The only thing I can think of is a one liner for the to_s that just directly accesses the i-vars like:
