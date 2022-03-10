- [OOP](./concepts.md#oop)
- [abstraction](./concepts.md#abstraction)
- [classes and objects](./concepts.md#classes-and-objects)
- [attributes and instance variables and state](./concepts.md#attributes-and-instance-variables-and-state)
- [attr_*](./concepts.md#attr_*)
- [calling setters and getters](./concepts.md#calling-setters-and-getters)
- [instance methods versus class methods](./concepts.md#instance-methods-versus-class-methods)
- [method access control](./concepts.md#method-access-control)
- [referencing and setting instance variables vs. using getters and setters](./concepts.md#referencing-and-setting-instance-variables-vs-using-getters-and-setters)
- [polymorphism](./concepts.md#polymorphism)
- [encapsulation](./concepts.md#encapsulation)
- [modules](./concepts.md#modules)
- [method lookup path](./concepts.md#method-lookup-path)

- [collaborator objects](./concepts.md#collaborator-objects)
- [super](./concepts.md#super)
- [fake operators and equality](./concepts.md#fake-operators-and-equality)
- [reading OO code](./concepts.md#reading-oo-code)
- [goal of inheritance](./concepts.md#goal-of-inheritance)

1. What's the focus of the question? (intent)
2. What's the most simple way I can explain this that completely addresses the intent of the question.
# OOP

- bundling behavior with data

- objects are sending and receiving messages; implementation shouldn't be that visible to our objects (explicit, hardcoded implementation: assigment of variable)
- single responsibility for our methods (does print something or does return a meaningful value)
- strive to use inheritance and collaborator objects intelligently; meaningful connections

## benefits
- allows us to create containers for data; helps address issues of growing complexity by granting more fine-tuned control over where behavior and data is accessible;
- DRY code
# abstraction
- enables a separation of implementation and interface; complex aspects of implementation are hidden away and what we are left with is clean, easy-to-digest interface clients of a class use
- the whole ability to model real-world concepts or ideas is the backbone of OOP design and this is all because of abstraction (cars are complicated systems; yet easy to point at and use)
- the main benefits are the ability to write cleaner, more organized, less dependant code that's easier to maintain and think about at a higher level.

# classes and objects
### class
- used to specify the form (mold) of an object; combining data representation and methods for accessing and modifying that data all wrapped into one.

- where we define an object’s attributes and behaviors -> instance_variables and instance_methods as well as class methods and class variables
- can 'act' via class methods (which are inherited by all subclasses)
- Classes are used as blueprints for objects; they're where we define an object's behaviors and attributes.
- Ruby defines the attributes (attr getters/setters) and behaviors of its objects in classes.
- We also define class methods inside of classes and can instantiate objects from classes via the `::new` class method.
### object
- instance of a class; has a unique state and id

- instance variables track information related to the object (instance variables are scoped at the object-level), each instance of a class has its own unique copy of the specified i-vars

- the sum of which comprises its state, ‘acts’ via instance methods
### benefits of classes and objects
- encapsulation, polymorphic behavior, inheritance, working at a greater level of abstraction, and all the benefits of OO re: data privacy/hiding and access control

- using objects allows us to think at a higher level of abstraction; users of a class don’t have to know all the implementation details, they just access the public interface of the class. This has the benefit of preventing unintentional manipulation of data or invoking methods erroneously. → encapsulation of behavior (access control)
- classes allow us to model naturally hierarchical domains, group methods we want available to certain objects, implement polymorphic behavior via (class) inheritance and duck typing, and encapsulate behaviors
- objects encapsulate their own state, therefore we can expose state info if we have access to instance methods since instance variables are scoped at the object level and thus are accessible to instance methods of the object in question

### implementation
- classes store and encapsulate common behaviors; objects encapsulate state information

- the only way to access an object’s internal state is thru exposing some behavior available to the instance
```ruby
class Runner
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def run # a behavior available to all Runner objects
    p "#{@name} is running #{speed} MPH!"
  end

  def set_speed=(speed) # public method
    @speed = speed
  end

  private

  attr_reader :speed # private method (encapsulating behavior via MAC)
end

joe = Runner.new("Joel")
p joe.name  # expose state information about joe via getter method defined in the Runner class' public interface
joe.set_speed = 15  # assign @speed instance variable to a value; thus updating the state of joe
joe.run  # accessing state information (@name's value) and invoking private method speed; thus
joe.speed  # attempt to expose behavior from outside the class; observing method access control at work
```
# attributes and instance variables and state
- An instance variable is named by the class, but each object created from the class creates its own copy of the instance variable, and its value contributes to the overall state of the object.

- The instance variable is actually not a part of the class, and cannot be inherited. The subclass only knows about the variable name, and it uses that name as a reference to the value it points to.
- An attribute is an instance variable name along with it's value. It only does us any good if there is either an associated getter or setter method or both.
- The getter and setter methods are inherited, but the attribute behind these does not get inherited.
- Every object has a state. This is the collection of all instance variables and their values as defined for an individual object. It is part of the object, and not the class, and therefore is not inherited.
### excerpt from TRPL:

"These pairs of accessor methods are known as attributes and are distinct from instance variables. The methods defined by a class may have “public,” “protected,” or “private” visibility, which affects how and where they may be invoked."

### state and instance variables
- initialization is a prerequisite for an instance variable to be part of an object's state.
-
```ruby
class Parent
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Child < Parent; end
```
- Child INHERITS behaviors from Parent -> `name` and `initialize`

- methods allow us to expose the attributes of an object since `Child` inherits the behavior of `Parent` and since this (public) behavior facilitates access to an object's attributes, we can access state information of our objects
- if we understand attributes as the behaviors that facilitate

# attr_*
- an abbreviated way of writing setter and getter methods

- by defining `attr_*` methods, we automatically define instance variables of the same name
```ruby
class Person
  attr_accessor :name, :age
end
joel = Person.new # instantiate a new Person object
# --------------- uninitialized instance variables reference `nil`
p joel.name # nil
p joel.age # nil
# --------------- use setters to initialize them
joel.name = "Joel" # => Joel
joel.age = 25      # setter methods always return arg
# --------------- once initialized, our getters return the value associated with the attribute for the individual object that calls it (the method)
p joel # => #<Person:0x00007fb97380c5a8 @name="Joel", @age=25>
```
# calling setters and getters
# instance methods versus class methods
- both are inherited by subclasses

### instance
- defined for and called on instances of a class; available to objects of a class and any inheriting subclass’ object

- mechanism by which objects are encapsulated since the only way to expose an object's state is via instance methods

### class
- defined for and called on a classes; they are the behavior available to a class

- functionality that does not pertain to individual objects of the class
- use if the functionality doesn't deal with the states of indiv. objects
```ruby

class Person
  @@total_people = 0

  def initialize(name)
    @name = name
    @@total_people += 1
  end

  def self.total_people
    "total people: #{@@total_people}"
  end

  def print_name
    puts @name
  end
end

joe = Person.new("Joe")
sarah = Person.new("Sarah")
franz = Person.new("Franz")

p Person.total_people
[joe, sarah, franz].each(&:print_name)
```
# referencing and setting instance variables vs. using getters and setters
From outside the class, it is impossible to directly reference instance variables since i-vars are scoped at the level of the object. This is why we need getters and setters (attributes) to facilitate exposing, accessing, and modifying values stored as state in our objects. If an accessor is public, it can be invoked both inside and outside the class by objects of that class or subclass.

- within the class, acessors are preferred to explicitly accessing or assignment of instance variable
  - more flexible and easy-to-maintain code (single point of adjustment)
  - explicitly referencing instance variables doesn't have the built-in protection like an accessor does
  - guard clauses; option to further mediate how some information is exposed
  - using methods relies on sending messages which is preferred to explicit assignment
```ruby
class Fugitive
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def change_something
    @name = "Abagnale"
    @namee # if we had used a getter here, it would have thrown an error bc of our spelling error
  end

  def change_something_else
    @agee = 17
  end
end

frank = Fugitive.new("Frank", 21)

p frank.change_something
p frank.change_something_else
```
# polymorphism
- the ability of objects of different types to respond to the same interface

## benefits
- **benefits**: more readable, maintainable, & efficient code

- allows us to treat objects of different types as a single generic type of object with respect to invocation of the common interface. In other words, there’s a real sense in which I don’t really care what the object is so long as it can respond to the same method invocation with the same number of arguments.
- The real power of polymorphism is when we can produce different responses from a singular method call, with the response being determined by the type of object calling the method.
- If multiple objects of different types respond to the same interface (or “message”), we’ve got polymorphism, assuming their responses have similar intentions.

### via class inheritance
```ruby
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
[Sport.new, Basketball.new, Soccer.new, Running.new].each(&:stretch)
```
### via interface inheritance
```ruby
module Passable
  def pass; end
end

class Sport; end # superclass

class BasketBall < Sport # sub
  include Passable
end

class Soccer < Sport # sub
  include Passable
end

class Running < Sport; end # sub
```
### via duck-typing
```ruby
class SportsGame
  def play(attendees)
    attendees.each(&:attend)
  end
end

# define classes for each type of object that attends the sports game
class Athlete
  def attend
    puts "Plays Sport!"
  end
end

class Fan
  def attend
    puts "Cheers and eats popcorn!"
  end
end

class Vendor
  def attend
    puts "Sells hotdogs!"
  end
end

SportsGame.new.play([Athlete.new, Fan.new, Vendor.new]) # informal grouping based on their shared interface (attend)
```
- no formal relationship between classes/types; however if they can both respond to the same interface and are intentionally designed to behave polymorphic, then we have polymorphism via duck-typing

- A way for objects to behave polymorphically when they do not share methods via either interface or class inheritance.
- The idea is that you don't need to know the type of object in order to invoke an existing method on the object-if it can respond to a method, you can invoke that method on it.

# encapsulation
- is achieved by creating objects and exposing interfaces

- hiding pieces of functionality and data
- *class-level*: instance methods can only be exposed on instances of the class within which they were defined* (and upon instances of subclasses!)
- *object-level*: instance variables are encapsulated in the calling object of the method wherein they (the `@ivar`) were initialized

## benefits
- helps to ensure data cannot be modified or changed without obvious intent
- facilitates boundaries within our code; class-level, object-level

### quotes

- 'hiding something behind an interface'

- 'the object is an encapsulation of state and behavior'

- selectively exposing behaviors (classes and access control) and states (via methods);


```ruby
class Car
  def initialize(speed); @speed = speed; end

  def start_car # part of the public interface
    # invoke some private methods...
  end

  def drive; end # part of the public interface


  def check_speed
    puts "You are currently going #{speed}"

  private

  attr_reader :speed

  def battery; end

  def ignition_switch; end

  def starter_relay; end

  def battery_cables; end

  def starter_motor; end
end
```
The methods available to an instance of `Car` comprise the public interface of the class. Via method access control, all the specific implementation details involved with how to start a car are encapsulated, meaning that we cannot call them directly on an instance of our `Car` class. This is encapsulation of behavior at the class definition level; all the specific implementation re: how to start our car is encapsulated through the use of `private` and their functionality can only be exposed within the class itself by methods within the class.

## more encapsulation
- the only way to interact with objects is by invoking their methods; instance methods are the only way we can expose data (values) stored as state(referenced by instance variables which are scoped at the object-level).

- There is no way to access the instance variable directly except through the object (direct access must occur in instance methods defined within the class). This is useful because it allow us to set safeguards on data access in order to ensure it is always returned or changed in an appropriate manner.
# method access control
- designate the visibility of a method; encapsulation of behaviors
- allows us to limit what is included in our class' public interface, which is a goal of encapsulation and OO in general
## benefits
  - simplifies interaction with class by 'hiding' underlying complexity

  - Generally, it's a good idea to limit the number of methods that make up a class' public interface as it makes the class more simple to use while also preventing unintentional manipulation of data or the erroneous invocation of methods.
### public
- all the instance methods that comprise the public interface of a class
- all instance methods are public unless otherwise designated otherwise


### private
- doesn't allow for an explicit caller!

```ruby
class House
  attr_reader :owner, :price

  def initialize(owner, price)
    @owner = owner
    @price = price
  end

  def to_s
    "#{owner}'s house costs: $#{price}"
  end

  private :price
end
```
### protected
- working with multiple instances of a class

- “protected methods come in handy when we want to work with multiple instances of the same class within the same method call, but yet we don't want to expose the interface to the outside world”
- this type of visibility is most commonly implemented for comparison methods: `<=>`
- want to avoid exposing a class’ interface to the rest of our program
- inside class, a `protected` instance method behaves like a `public` method, but when we are *outside* of the class, a `protected` method behaves exactly like a `private` method
-
```ruby
class House
  attr_reader :owner, :price

  def initialize(owner, price)
    @owner = owner
    @price = price
  end

  def >(other)
    price > other.price
  end

  protected :price
end
joel = House.new("joel", 12)
rich = House.new("rich", 100)

p joel > rich
```
# modules
- They are used in three primary capacities. One: as namespaces, two: as mixins, and three: module methods. A module that's being used as a namespace is a container for a bunch of similar, or related classes whereas a mixin is a module that we use to give various classes desired behaviors, access to constants, and other functionality related concerns. We mix-in functionality to a class via interface inheritance.

- Modules cannot inherit from other modules nor can be used to instantiate objects.
- A common visual distinction between the two would be that a mixin module would follow the suffix "-able" naming convention while a namespace's name would typically relate to some shared trait or enclosing purpose that the classes contained therein have.

## used as a namespace
```ruby
module Sports
  class BasketBall; end

  class Soccer; end

  class Running; end
end
```
### benefits
- mixins are Ruby’s way of implementing multiple inheritance; we can include as many `mixins` as we need

- if we had two Classes of the same name that were unrelated, we could group these two classes in namespace modules to ensure that we don’t experience any name collisions and improve the organization of our code.


# method lookup path
- the ‘path’ Ruby takes while seeking to resolve a method invocation; Ruby searches for a method with the name of the invoked method, first in the class of the object we invoked the method on, then in any modules, then the superclass.

- important because of method overriding. Say we define a method in a class and later include a module into that class that has a method of the same name as the one we defined in our class. Now lets say we want to invoke the method defined in the included module. Because of the order in which the method lookup path searches, the method we defined in our class will be found first and thus called on our object. This was not the desired behavior and underlines the importance or impact that the method lookup path has on our code.
- also tightly related to polymorphism and inheritance.
```ruby
module Greetable
  def greet
    'hi there'
  end
end
class Being
  def greet
    "*complicated airflow*"
  end
end

class Person < Being
  include Greetable
  def greet
    'well hello there good sir!'
  end
end
p Person.new.greet # => well hello there good sir!
# Person#greet is found first and thus overrides Greetable#

```
# collaborator objects
- any object that makes up part of the state of another object

- represent the connections between various actors in a program

- mental model: *the collaborative relationship exists in the design (or intention) of our code*

- use methods of that collaborator wherever they meet (in any context where they exist).
```ruby
class Library
  attr_reader :book_shelf

  def initialize
    @book_shelf = []
  end

  def shuffle_books
    book_shelf.shuffle!
  end
end

class Book
  def initialize(name, page_count)
    @name = name
    @page_count = page_count
  end

  def turn_page; end

  def high_light; end
end

public_library = Library.new
notw = Book.new("Name of the Wind", 775) # using collaborators helps us abstract our thinking
public_library.book_shelf << notw
public_library.book_shelf.first.high_light
```

- ## Benefits →
  - modularize the problem domain into cohesive, connected abstract pieces

  - [practical] we can expose an object's behaviors from within another class
  - allows us to make meaningful associations between sections of a problem; 'HAS-A' relationships; a Library has Books
  - this allows us to model real-world relationships; a Library can 'contain' a Book via collaboration; thus we have access to the behaviors of the Book in different contexts
  - enables more abstract thinking; easier to communicate ideas without getting bogged down in implementation details (lateral thinking!)

- ## Detriments →
  - add more contingencies/dependancies in our code

  - can be harder to read/process at a glance

```ruby
class SoccerBall
  attr_accessor :moving

  def initialize(moving: false)
    @moving = moving
  end

  def to_s
    moving.to_s
  end
end

class SoccerPlayer
  include Comparable, Enumerable, Math
  attr_accessor :ball

  def initialize(name, ball)
    @name = name
    @ball = ball
  end

  def dribble
    ball.moving = true
  end

  def stop
    ball.moving = false
  end

  def to_s
    "#{@name} and his ball's state: #{ball}"
  end
end
```
# super
- The super keyword looks up the ancestors chain for the method name where super is called

- used when we don't want to altogether replace some behavior but augment it by adding some additional behavior (specified in the overriding method definition) while preserving the higher up method's original behavior.
- three implementations:
    1. `super` passes all `args` of its enclosing method to the superclass’ implementation
    2. `super()` passes exactly zero `args` to superclass’ implementation of the enclosing method
    3. `super(*args)` passes specified args to a superclass’ implementation of the enclosing method
- "specified arguments are sent up to the method defined higher in the class hierarchy"

### super
- passes all arguments provided it to the method in the superclass
```ruby
class Card
  def greet
    'Greetings!'
  end
end

class HolidayCard < Card
  def greet
    'Seasonal ' + super
  end
end
```
### super()
- passes exactly zero arguments to the method in the superclass
```ruby
class Card
  def greet
    'Greetings!'
  end
end

class HolidayCard < Card
  def greet(message)
    "Seasonal " + super() + ' ' + message
  end
end
p Card.new.greet                         # 'Greetings!'
p HolidayCard.new.greet('Merry Xmas!') # 'Seasonal Greetings! Merry Xmas!'
```
### super(*args)
- passes `*args` to superclass method
```ruby
class Card
  def greet(message)
    'Greetings!' + ' ' + message
  end
end

class HolidayCard < Card
  def greet(personal_message, date)
    date + "Seasonal " + super(personal_message)
  end
end
p Card.new.greet('Merry Xmas!')                         # 'Greetings! Merry Xmas!'
p HolidayCard.new.greet('Merry Xmas!', "March 3rd: ") # 'March 3rd: Seasonal Greetings! Merry Xmas!'
```
# method lookup path
- the ‘path’ Ruby takes while seeking to resolve a method invocation; Ruby searches for a method with the name of the invoked method, first in the class of the object we invoked the method on, then in any modules, then the superclass.

- important because of method overriding. Say we define a method in a class and later include a module into that class that has a method of the same name as the one we defined in our class. Now lets say we want to invoke the method defined in the included module. Because of the order in which the method lookup path searches, the method we defined in our class will be found first and thus called on our object. This was not the desired behavior and underlines the importance or impact that the method lookup path has on our code.
- also tightly related to polymorphism and inheritance.
```ruby
module Greetable
  def greet
    'hi there'
  end
end

class Person
  include Greetable
  def greet
    'well hello there good sir!'
  end
end
Person.new.greet # => well hello there good sir!
# Person#greet is found first and thus overrides Greetable#greet
```
# constant lookup path
- constants have lexical scope, meaning that when Ruby tries to resolve a constant lookup, it first searches all immediate enclosing lexical scopes, then if the structure that where the constant reference inherits, Ruby then searchs that structure's the inheritance hierarchy
- often need to use the constant resolution operator `::`, which specifies a particular namespace from which to begin its search
```ruby
module A
  # BEDTIME = 3
  # def bed_time
  #   p BEDTIME # p Child::BEDTIME
  # end
end

BEDTIME = 11

class GrandParent # looks in this class
  BEDTIME = 6
  include A
  def bed_time
    p BEDTIME # p Child::BEDTIME
  end
end

class Parent < GrandParent
  BEDTIME = 9
end

class Child < Parent
  BEDTIME = 7
end

Child.new.bed_time # => 7

```
# self

- special variable; describes the context of execution by referencing the object calling the currently executing code
- used to disambiguate when we are calling a setter method versus initializing a new local variable within some instance method
- a way of being explicit about what our program is referencing and what our intentions are as far as behavior
```ruby
class Person
  self

  def a_method
    self
  end

  def self.a_class_method
    self
  end

  def other_method(new_name)
    self.name = new_name
  end
end
```
# fake operators and equality
- many 'operators' are actually instance methods

- it is very common to define a custome `==` method for user-defined classes so that we can be specific about how we implement comparisons of instances of the class

- it is also common to define a custom <=> method, include Comparable and use the inherited methods from the mixin
```ruby
class House
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def ==(other)
    price == other.price
  end
end

my_house   = House.new(10)
your_house = House.new(11)
my_house == your_house
```
# reading OO code
# goal of inheritance
Inheritance lets us reduce writing duplicate code by only defining functionality in one place. By using classes and modules, we can establish formal relationships between various parts of our code, allowing us to define a class in terms of another class.
- with class inheritance, we extract some common behavior to a superclass that other, more specific types can subclass to and have access to the extracted behavior

- if we only want certain subclass to have some behavior, but not all, then interface inheritance is probably the right decision since we can selectively `include` that behavior where it's needed without writing code in multiple places

