1. What's the focus of the question? (intent)
2. What's the most simple way I can explain this that completely addresses the intent of the question.

# classes and objects
### class
- blueprint for objects;
- where we define an object’s attributes and behaviors -> instance_variables and instance_methods
- can 'act' via class methods (which are inherited by subclasses)
### object
- instance of a class; has a unique state and id
- instance variables track information related to the object (instance variables are scoped at the object-level)
- the sum of which comprises its state, ‘acts’ via instance methods
### benefits of classes and objects
- open up a new world of possibilities; encapsulation, polymorphic behavior, inheritance, working at a greater level of abstraction, and all the benefits of OO re: data privacy/hiding and access control

- using objects allows us to think at a higher level of abstraction; users of a class don’t have to know all the implementation details, they just access the public interface of the class. This has the benefit of preventing unintentional manipulation of data or invoking methods erroneously. → encapsulation of behavior (access control)

- classes allow us to model naturally hierarchical domains, group methods we want available to certain objects, implement polymorphic behavior via (class) inheritance and duck typing, and encapsulate behaviors

- objects encapsulate their own state, therefore we can expose state info if we have access to instance methods since instance variables are scoped at the object level and thus are accessible to instance methods of the object in question

### implementation
- classes encapsulate common behaviors; objects encapsulate state information
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
# attr_* -> s/getters

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
# polymorphism

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

-> if blanking, think of a bunch of different professionals who all `work`

no formal relationship between classes/types; however if they can both respond to some interface, we can use them polymorphically

-> A way for objects to behavior polymorphically when they do not share methods via either interface or class inheritance.

The idea is that you don't need to know the type of object in order to invoke an existing method on the object-if it can respond to a method, you can invoke that method on it.

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

SportsGame.new.play([Athlete.new, Fan.new]) # informal grouping based on the fact that both
```

# encapsulation

- selectively exposing behaviors (classes and access control) and states (via methods)

- the only way to interact with objects is by invoking their methods; instance methods are the only way we can expose information stored as state(referenced by instance variables which are scoped at the object-level).
- There is no way to access the instance variable directly except through the object (direct access must occur in instance methods defined within the class). This is useful because it allow us to set safeguards on data access in order to ensure it is always returned or changed in an appropriate manner.
```ruby
class Car
  def initialize(speed); @speed = speed; end

  def start_car # part of the public interface
    # invoke a bunch of private methods related to starting a car
  end

  def drive # part of the public interface
    # implement drive functionality
  end

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

# method access control
- access modifiers; further encapsulate behaviors
- allows us to limit what is included in our class' public interface, which is a goal of encapsulation and OO in general
  -> simplifies how users interact with class

### public
- all the instance methods that comprise the public interface of a class

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
- when we want to work with multiple instances of a class but also want to avoid exposing a class’ interface to the rest of our program
- inside class, a `protected` instance method behaves like a `public` method, but when we are *outside* of the class, a `protected` method behaves exactly like a `private` method
- “protected methods come in handy when we want to work with multiple instances of the same class within the same method call, but yet we don't want to expose the interface to the outside world.”
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

# collaborator objects

- any object that makes up part of the state of another object (of a different class); the mechanism by which this (formal) relationship is established is through the use of `@instance_variables`.  A collaborator object is the value referenced by another object’s instance variable
- With regard to actual objects in memory, *collaboration* occurs when one object is added to the state of another object (i.e., when a method is invoked on an object). However, a more helpful mental model is: *the collaborative relationship exists in the design (or intention) of our code*
- at a macro level, collaborator objects represent the connections or relationships between various composite parts of your program

- 1. B → they modularize the problem domain into cohesive connected pieces that are more abstracted than just basic data-structures and standard library types
2. D → they add more contingency to our code; can be harder to read/process at a glance
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
# method lookup path
```ruby
class Klass
  include Enumerable
  include Comparable
end

class UnterKlass < Klass; end

UnterKlass.new.ancestors # [UnterKlass, Klass, Comparable, Enumerable, Object, Kernel, BasicObject]
```
# super
- looks for a method with the same name as the one where it is being used within the inheritance hierarchy of the calling object's class
- The super keyword looks up the ancestors chain for the method name where super is called

- three implementations:
    1. `super` passes all `args` of its enclosing method to the superclass’ implementation
    2. `super()` passes exactly zero `args` to superclass’ implementation of that method
    3. `super(*args)` passes specified args to superclass’ implementation of method
### super
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
