# What is encapsulation in Ruby, and why does it matter? Demonstrate with code.
=begin
class definition level vs instance level

allows us to silo off data and functionality, core tenet of OOP, allows for data
privacy, etc.
=end

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def share_name
#     p name[-1, 1]
#   end

#   private :name, :name= # didn't know this part!!
# end

# joe = Person.new("Joe")

# # joe # joe's state is encapsulated

# joe.share_name
# joe.name = 'hi'

# joe.share_name

=begin
What is polymorphism in Ruby? How do we implement it in code?

code flexibility, reduced repeated code, and being able to think at a greater
level of abstraction.

inheritance -> class and interface
=end
# module Climbable
#   def climb
#     puts "#{self.class} is climbing!"
#   end
# end

# class Animal
#   def breath
#     puts "#{self.class} is breathing!"
#   end
# end

# class Dog < Animal; end

# class Cat < Animal
#   include Climbable
# end

# class Monkey < Animal
#   include Climbable
# end

# [Monkey.new, Cat.new].each(&:climb)

# if some object can respond to some interface, we aren't concerned with its class
# a sort of informal grouping based on the ability to respond to the same method

# class Parent
#   def attend
#     puts "cheers!"
#   end
# end

# class Athlete
#   def attend
#     puts "runs!"
#   end
# end

# class Vendor
#   def attend
#     puts "sells hotdogs!"
#   end
# end

# [Parent.new, Athlete.new, Vendor.new].each(&:attend) # informally grouped based on ability to respond to an interface

=begin
How do we control access to methods in Ruby?
- method access modifiers!
- private protected public -> methods defined in Module

=end
# class Person
#   def initialize(name)
#     @name = name
#   end

#   def greets(other)
#     puts "#{name} says hi to #{other.name}"
#   end

#   protected # everything beneath this line is only available within the class

#   attr_reader :name
# end

# joel = Person.new("Joel")
# ben  = Person.new("Ben")

# joel.greets(ben)
# def a_method
#   puts "I'm in #{self}"
# end

# what is main?  It's an instance of Object with the special property that any methods defined
# there are added as private instance methods of Object

# p Object.private_instance_methods # [a_method]

# talk
# module Walkable
#   def walk
#     puts "The #{self.class} instance is walking!"
#   end
# end

# class Being # class Inheritance
#   def talk
#     puts "hi from #{self.class} instance!"
#   end
# end

# class Human < Being
#   include Walkable
# end

# class Dog < Being
#   include Walkable
# end

# class Bird < Being; end

# [Bird.new, Dog.new, Being.new, Human.new].each(&:talk) # class inheritance
# [Dog.new, Human.new].each(&:walk) # interface inheritance

# inheritance is appropriate when we have some behavior that we want
# available to multiple classes.  We can define our classes and modules in
# an inheriting way.  We need inheritance if we are trying to model a naturally
# hierarchical structure; if the is an "is-a" relationship at play.

# What are getter and setter methods in Ruby? How do we create them?
# module Feelable
#   def like_a_stranger
#     "like a stranger"
#   end
# end

# class Entertainer
#   include Feelable

#   def walk(street)
#     "walking #{street} feeling #{like_a_stranger}!"
#   end
# end

# class Singer
#   attr_accessor :possessions

#   def initialize(name)
#     @name = name
#     @possessions = []
#   end
# end

# phoebe_bridgers = Singer.new("The artist currently known as Phoebe Bridgers")

# phoebe_bridgers.possessions << "open heart"
# phoebe_bridgers.possessions << "open container"

# phoebe_bridgers.possessions << "stack of mail"
# phoebe_bridgers.possessions << "tall can"

# p phoebe_bridgers.possessions

# Whats the difference between instance methods and class methods?

# class Person
#   def self.greet
#     puts "Hi there neighbor!"
#   end
# end

# p Person.singleton_class # => Class:Person (Meta class)

# p Person.class # Object

# joel = Person.new

# def joel.greet
#   puts "Hi from #{singleton_class}"
# end

# joel.greet

# what is self? Demonstrate how it is used?

# p self # => main 1

# def a_random_method
#   p self
# end

# a_random_method # => main 2

# class Person
#   attr_accessor :name

#   p self # => Person 3

#   def change_name(new_name)
#     self.name = new_name
#   end

#   def an_instance_method
#     p self
#   end

#   def self.a_class_method
#     p self
#   end
# end

# Person.new.an_instance_method # => <Person: sdfjslfj> 4
# Person.a_class_method # Person 5

# joel = Person.new

# p joel.name

# # joel.name = "Ross"

# joel.change_name("Ross")

# p joel.name

# What are modules? When is it appropriate to use them?

=begin
modules are similar structures to classes in that they can store
methods, constants, and various types of variables. however, they
cannot be instantiated; we cannot create an instance of a module
in the way we would a class.

When working with modules, there are three primary uses cases.
Mixins, namespacing, and module methods.

A mixin is module we use to store some desired behavior that
we can then include into a class' definition, thus making that
behavior accessible to instances of that class and subclass
instances of that class. (interface inheritance).

A using a module as a namespace essentially provides a shared
space for similar classes to occupy together
=end

# What are modules? When is it appropriate to use them?

# instances of the Module class; cannot be used to instantiate new objects; do not inherit behaviors from a superclass

# module A; end

# p A.ancestors # [A]

# What is the attr_accessor method, and why wouldn’t we want to just add attr_accessor methods for every instance variable in our class?

# instance method defined in the Module class; metaprogramming; creates two instance methods (attribute getter/setter)
# we wouldn't add an attr_accessor for every instance variable in our class because sometimes we don't want to expose the
# internal state of our objects, since this is the point of accessor methods, it makes sense why we wouldn't always
# want to have both accessors for all of an object's attributes.
# class Person
#   attr_writer :age
#   attr_accessor :name

#   def initialize(name, age)
#     @name = name
#     @age  = age
#   end
# end

# joe = Person.new("Joe", 65)

# p joe.name
# joe.name = "anya"
# p joe.name

# joe.age = 66
# p joe


=begin
How is Method Access Control implemented in Ruby? Provide examples of when we would use public,
protected, and private access modifiers.

designate some method or methods as being of a certain visibility.
=end

# class Person # public interface is comprised of the :name getter and setter methods
#   def initialize(name)
#     @name = name
#   end

#   def ==(other)
#     name == other.name
#   end

#   protected

#   attr_accessor :name
# end

# joe = Person.new("Joe")
# sal = Person.new("Sal")

# p joe == sal
# p joe.name
# joe.name = "Joseph"
# p joe.name

# instance only? or class methods too?

# those instance methods which are capable of being exposed from outside of the class; as in upon an object of that class (or obj of subclass)

=begin
Why is it generally safer to invoke a setter method (if available) vs. referencing the instance
variable directly when trying to set an instance variable within the class? Give an example.

safer? -> human error catching with method lookups vs initialization of a new instance variable
also, it's a better practice to be sending and receiving messages (invoke methods) versus direct implementation (directly ref @i-var)
=end

# class Person
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def change_name(new_name)
#     self.naem = new_name # built-in protection against human error (typos!)
#     # @naem = new_name # create a new instance variable, assigning it to the passed-in string value
#   end
# end

# joel = Person.new("Joel")

# joel.change_name("Sage")

# p joel
=begin
Give an example of when it would make sense to manually write a custom getter method vs. using attr_reader.

custom getter > attr_reader

: -> say over how state information is presented
=end

# class Person
#   def initialize(address, name)
#     @address = address
#     @name    = name
#   end

#   attr_reader :name

#   def address
#     @address.last(2).join(" ") # by defining a custom getter, we have more control over how state information is shared/displayed
#   end
# end

# joel = Person.new("3330 Sundance Drive Bozeman MT".split(", "), 'Joel')

# p joel.address
# p joel.name

=begin
What is the difference between states and behaviors?

behavior -> method (attr_reader, some_method, class_method)
states   -> objects have state (@ivars and their 'values')
=end

# class Person
#   attr_reader :name

#   def initialize(address, name)
#     @address = address
#     @name    = name
#   end

#   def self.greet; end

#   def address
#     @address.last(2).join(" ") # by defining a custom getter, we have more control over how state information is shared/displayed
#   end
# end

# joel = Person.new('address', 'Joel')

# p joel

# <Person:0x00007f9a0a123ad0 @address="address", @name="Joel"> # say there's no initialize @i-vars; the Person object still has state

=begin
What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

-> key component of how we can model relationships in our code.
-> allows for working and thinking at a greater level of abstraction.
=end

# class Library
#   attr_reader :book_shelf

#   def initialize
#     @book_shelf = []
#   end

#   def shuffle_books
#     book_shelf.shuffle!
#   end
# end

# class Book
#   def initialize(name, page_count)
#     @name = name
#     @page_count = page_count
#   end

#   def turn_page; end

#   def high_light; end
# end

# public_library = Library.new
# notw = Book.new("Name of the Wind", 775) # using collaborators helps us abstract our thinking
# public_library.book_shelf << notw
# public_library.book_shelf.first.high_light

# How do class inheritance and mixing in modules affect instance variable scope?
# Give an example.

=begin
They don't. Instance variables are scoped at the object level.  Attribute getters/setters on the other hand are methods and thus inherited
and influenced by class inheritance and mixin modules.

If an instance variable is initialized under an object’s execution, it is scoped to that object.

Therefore, the scope  of instance variables is the
=end

=begin
How does encapsulation relate to the public interface of a class?

public interface of a class consists of the public methods available to be exposed from outside the class
classes encapsulate behaviors; we can use access modifiers to further encapsulate behavior and limit the public interface of a class.
inaccessible from outside the context of the class definition
=end

=begin
When does accidental method overriding occur, and why? Give an example.

override the `Object#send` instance method
=end

class PostOffice
  def send(greeting)
    puts "#{greeting} There it goes!"
  end
end

# PostOffice.new.send('Hello there!')
# PostOffice.new.send()

=begin
Describe the distinction between modules and classes.

modules -> do not 'inherit' behaviors in the way that classes can inherit via class inheritance
  - mixins, namespacing, module methods
  - bundle related classes, or methods and constants, or a module method

classes -> can be use to instantiate objects; by default subclass from Object
  - group a set of behaviors for an object
  -
=end
# p Module.class # Module
# p Module.superclass # Object

# p Class.class # Class
# p Class.superclass # Module

# p Object.class # Class
# p Object.superclass # BasicObject

=begin
What is Object Oriented Programming, and why was it created?
What are the benefits of OOP, and examples of problems it solves?

When does accidental method overriding occur, and why? Give an example.
  -

How does inheritance work in Ruby? When would inheritance be appropriate?
=end

# class NameFormatter
#   def initialize(name)
#     @name = name
#   end

#   def upcased_and_exclaimed
#     "#{@name[-1].upcase}!!!"
#   end

#   def kebabbed
#     @name[-14].chars.join("-")
#   end

#   def snake_cased_letters
#     @name[-1].chars.join("_")
#   end
# end

# joe = NameFormatter.new("Joe")

# p joe.upcased_and_exclaimed
# p joe.kebabbed
# p joe.snake_cased_letters

# What is encapsulation? How is it achieved in Ruby?

# hide functionality and data from parts of our code.

# at the class level -> bundle together a group of behaviors
#   - further encapsulation can be achieved via method access control

# at the object level -> objects have state; (all i-vars and their values)
#   - the only way to expose this information is through methods available
#     to that object


# # modules & self
# # fix the implementation to produce the correct output

# module Nameable
#   def random
#     self.class::NAMES.sample
#   end

#   def self.names
#     ["Tom", "Bob"]
#   end
# end

# class Person
#   include Nameable

#   NAMES = ["Tom", "John", "Dave"]

#   attr_accessor :name

#   def initialize
#     @name = random
#   end
# end

# person = Person.new
# p person.name # should return one of the names from the NAMES constant

class ShellyBoys
  class Testudines; end

  class SoftShellTurtle < Testudines; end

  class Tortoise < Testudines; end

  class LeatherBackTurtle < Testudines; end
end

turtle = ShellyBoys::SoftShellTurtle.new

p turtle.class.ancestors
