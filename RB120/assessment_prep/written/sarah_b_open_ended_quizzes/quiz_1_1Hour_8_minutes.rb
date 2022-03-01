# 1 Which problems led to the creation of OOP?
=begin
Programmers were dealing with projects of greater and great complexity and needed a way to separate and organize the
different component parts of their programs.  Problems like running out of viable unique variable names, name collision
with methods, and having all of your data available throughout a program were major issues that led to OO design.
=end
# 2 what is the relationship between classes and objects?
=begin
Classes are blueprints for objects; they're where we define an object's behaviors and attributes and from which we
instantiate our objects. Objects have state and use the behaviors and attributes defined in their class to expose
both state information (the values referenced by an object's ivars) as well as expose functionality defined in the
class itself.
=end
# 3 What are modules in Ruby?
=begin
Modules are class-like containers for classes, methods, and constants and can be used in a number of ways. The two
primary ways are as mixins and namespaces.  We use mixins to mix-in some desired behavior or access to constants into
some class. We use namespace modules to organize related classes under an organizing concept.

Modules differ from classes in that they cannot be used to instantiate objects; only classes can do this. The naming
conventions around modules are, if used as a mixin, it should have an '-able' suffix, whereas if it is used as a
namespace, the module's name should speak to purpose or organizing principle that aligns with the grouped classes.
=end
# 4 What is encapsulation?
=begin
Encapsulation is a goal of OO design that manifests in a variety of ways. Generally, encapsulation is the idea
of hiding functionality behind an interface wherein we selectively expose behaviors. At the object-level, it
can be said that objects encapsulate themselves given the fact that instance variables are scoped at the
object-level and can thus only be accessed via the methods defined for that instance. This means that since objects
have state (the combination of an object's instance variables and the values they reference) and this state is only
accessible via methods defined for that object (e.g. getters/setters), the internal representation of the object is
encapsulated.

At the class level, we say that classes encapsulate behavior by making certain methods only available from within
the class itself (these behaviors are only accessible from within the class; they must be invoked by other methods).
This has to do with a class' public interface which is composed of all the methods that are public and are thus
visible from outside a class' definition.
=end
# 5 What is inheritance?
=begin
Inheritance in general is a useful way to minimize the amount of redundant code we write, improve the flexibility of our code,
and can be helpful when we are modeling a naturally hierarchical domain. Ruby is known as a language that only
supports 'single-inheritance'; meaning that a child class can ONLY every have a single parent from which it
inherits. However, multiple classes can subclass from a single parent class (as is evident by how all user-defined
classes inherit from the Object class.

What we have described thus far is known as class inheritance, which is one of two forms of inheritance Ruby implements.
The other form is called "interface" inheritance. This form is what is achieved via mixin modules. When we `include`
a mixin to a class, we can say that that class inherits the interface defined in the included module. Interface
inheritance is the way in which Ruby achieves the functionality of "multiple inheritance" while strictly supporting
single inheritance.

We would lean toward class inheritance when there is a 'Is-A' relationship between two areas of our code (in this
case classes), and we would lean toward interface inheritance when there is a "Has-a" relationship at work in our code.
=end
# 6 What is polymorphism?
=begin
Polymorphism is when objects of different types to respond the same interface (e.g. method invocation)
and exhibit different implementations details.  Polymorphic behavior can be achieved in a number of ways: class inheritance + method
overriding, interface inheritance, or ducktyping.

An example of class inheritance be like the following:
=end
class Sport
  def stretch
    'general stretching routine'
  end
end

class BasketBall < Sport; end

class Soccer < Sport; end

class Running < Sport
  def stretch
    'running stretches' # polymorphism via method overriding + inheritance
  end
end
# [Sport.new, Running.new].each(&:stretch)

# 7 What are the benefits of class inheritance?
=begin
As mentioned previously, class inheritance lends itself well to
modeling naturally hierarchical domains where a general class
superclasses to a more specific type of the general class (the subclass).

With class inheritance, we can extract common behaviors to a superclass and make
fine-tuned decisions where we need in our subclasses. This reduces the amount of
redundant code we write and makes our code more flexible and maintainable as
our program grows in scale and complexity.
=end
# 8 Describe the code below in relation to ==,
class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new


# 9  Examine the code below. Identify all the superclasses. Include classes that would be searched in the method lookup path.
=begin
lowest subclass to highest superclass -> ->
SomethingElse -> AnotherThing -> Thing -> Object -> Kernel -> BasicObject
=end
class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end

# 10 Given the following code, determine the method lookup path that Ruby will use as a result of the call to the `fly` method?
=begin
When looking for `fly` Ruby will first search `Penguin`, then `Migratory`, then `Aquatic`, then `Bird`, then `Animal`, then
`Object`, then `Kernel`, then `BasicObject`. It will not resolve the lookup.
=end
module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
# pingu.fly

# 11 What will the following code output?
=begin
=> Daisy says moooooooooooo!
When we invoke `speak` on the `Cow` object `daisy`, `sound` is called on the calling object,
`daisy`.  The `sound` method defined on line 169 is found and invoked. When `super` is encountered,
Ruby searches for a method called `sound` in `Cow`'s parent class `Animal`. It finds it, and
directly references the calling object `daisy`'s instnace variable `@name` which returns the
value it references, which is then interpollated into the string within which it is used.
This string `Daisy says ` is then concatonated to the string `mooooooooooo!`, all of which is
returned on line 178.
=end
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
# daisy.speak

# 12 What is true about `max` and `molly` in relation to their states and behaviors?
=begin
The two `Cat` objects have the same set of behaviors but unique states.  As objects, each
inhabits its own unqiue location in memory (thus having unique object_ids). Since the values
which are referenced by their respective instance variables are not the same objects (i.e.
both sets are individual, unique string objects), and since the combination of an object's
i-vars and the values referenced by these i-vars comprise an object's state, their respective
states are thus unique.
=end
class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")
# 13  What are @name and @age in this code?
=begin
@name and @age are instance variables that, once initialized to a value, comprise the instantiated
object's state.
=end
# class Person
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# 14  what are ways to code Person class to get the desired result?
=begin
We could define an attr_accessor that would allow us to access and modify @name from
outside the class. Alternatively, we could define a getter and writer method named
`name` and `name=` which would do the same thing as the previous option. Since attributes
are getter and setter methods, we'd say that we could define some attributes that would
facilitate access and modification of the state of our `Person` object `kate`.
=end
# kate = Person.new
# kate.name = 'Kate'
# p kate.name # => 'Kate'

# 15 what code can replace the omitted code and get the desired result?

# class Person
#   attr_writer :first_name, :last_name

#   def full_name
#     "#{@first_name} #{@last_name}"
#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# p mike.full_name # => 'Michael Garcia'

# # 16 What code can you add to Student class to get the desired result?

# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end

#   def change_grade(desired_grade)
#     self.grade = desired_grade
#   end
# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# p priya.grade # => "A"


# # 17 On which lines in the following code does self refer to the instance of the MeMyselfAndI class
# referenced by i rather than the class itself?
=begin
Line 278. used as it is within an instance method, `self` refers to the calling object of the `myself` method,
which is the instance `i` of the `MeMyselfAndI` class.
=end
class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new
p i.myself

class Person
  def initialize(age)
    @age = age
  end
end

mac = Person.new(21)
seana = Person.new(21)

My definition of state: all an object's i-vars and the values referenced by the i-vars.

While they are different objects (inhabiting different locations in memory)