
# require 'pry'
# class Practice
#   @@class_var = 'class var'

#   attr_accessor  :name
#   def initialize(name)
#     @name = name
#     self.name = 'Jake'
#   end

#   def to_s
#     "@@class_var: #{@@class_var} and @name: #{@name} "
#   end
# end
# derek = Practice.new("derek")


# p derek
# class Klass
#     attr_reader :age

#     def initialize(name, age)
#         @name = name
#         @age = age
#     end

#     def what_is_name
#         name
#     end

#     private
#     attr_reader :name
# end

# joel = Klass.new("joel", 85)

# p joel.what_is_name # exposing behavior with a method being called on object
# p joel.age # exposing state (internal rep of object) with attr_*

# =begin
# class/object
#     -> blueprint for object, defines what an object is (attributes-> state info-> instance variables), how it iteracts (behavior) with code
#     -> instance of class, made up of attributes defined in class def
#         -> anything that can be said to have a value associated with it
# =end


# class Animal

#   def initialize(name, breed)
#     @name = name
#     @breed = breed
#   end

#   def speak
#     puts "#{name} barks!" # exposing behavior
#   end
#   private

#   attr_reader :name # exposing the value stored in @name
# end

# bud = Animal.new("Bud", "Bulldog")

# bud.speak
# bud.name

# class Car
#   def initialize(speed); @speed = speed; end

#   def start_car # part of the public interface
#     # invoke a bunch of private methods related to starting a car
#   end

#   def drive # part of the public interface
#     # implement drive functionality
#   end

#   def check_speed
#     puts "You are currently going #{speed}"

#   private # encapsulated behavior only exposed with the class definition

#   attr_reader :speed

#   def battery; end

#   def ignition_switch; end

#   def starter_relay; end

#   def battery_cables; end

#   def starter_motor; end
# end

# objects encapsulating state?

=begin

- storing information in variables

- storing values of attributes in `@instance_variables`
- 'attribute'
=end

# class Klass
#   def initialize(name, hair_color)
#     @name = name  # attribute @name is accessible throughout the class
#     @hair_color = hair_color # @hair_color -> 'attribute signifier'; value of variable is an attribute of Klass objects
#   end
# end

# steve = Klass.new("Steve", 'Blue')

# Klass.new("JHoeo", 'Red')

=begin

There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists straighten teeth.
All of these aforementioned specialties are dentists. All dentists graduated from dental school.  Oral surgeons place implants.
General dentists fill teeth

=end

# Dentist, Receiver, Teeth, Dental others
# pull teeth, straigthen teeth, fill teeth, place implants


# module Pullable
#   def pull; end
# end

# class Office
#   def initialize()
# end

# class Dentist
#   DENTAL_SCHOOL = true

#   def show_credential; end
# end

# class OralSurgeons < Dentist
#   include Pullable
#   def place_implant; end
# end

# class Orthodontists < Dentist
#   def straighten; end
# end

# class GeneralDentist < Dentist
#   include Pullable

#   def fill; end
# end

# class Receiver; end

# class Teeth; end


=begin
Implement a chess game that includes a Board two Player objects a core Chess class and Piece objects

general behaviors
Pieces should be able to move
Board should be shareable or viewable by both players
Player objects should be able to make moves and view the current state of the board
Each time you start a new game, the board should be established as a fresh board

Core collaborators?  What are the main relationships? What classes do we want to associate tightly?

Trade-offs of collaborator objects? (closely associating multiple classes)
=end

# class Chess
#   def initialize
#     @user = User.new
#     @computer = Computer.new
#     @board = Board.new
#   end

#   def update_board
#   end

#   def reset_board
#   end
# end

# class Board
#   def create_board
#     # board of tiles 8x8
#   end

#   def display_board
#   end

#   def unoccupied_tiles
#   end
# end

# class Tile
#   def occupied?
#   end

#   def unoccupied?
#   end

#   def occupied_by
#     # return white or black
#   end
# end

# class Player
#   def make_move
#   end


# end

# class User < Player
#   def pick_piece_color
#   end
# end

# class Computer < Player
#   def pick_computers_piece_color
#   end
# end

# class Set
#   def create_set_of_pieces
#   end
# end

# class Piece
#   def move
#   end
# end

# what is considered the 'public interface' of the below?

# class Person
#   attr_reader :name
#   @instance
#   @@count # points at nil when unintialized

#   def initialize(name)
#     @name = name
#     @@count += 1
#   end

#   def self.count
#    @@count
#   end

#   def greet # part of public interface
#     puts 'hello'
#   end
# end

# Person.new("Joel")
# p Person.count


# class Person
#   attr_reader :name

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# joel = Person.new("Joel", 25)

# joel.define_singleton_method(:age) { @age }

# p joel.instance_variables
# p joel.methods
# p joel.age

# def self.greet
#   puts "greet from #{self}"
# end

# self.greet

# class Person
#   attr_accessor :name, :back_pack
#   def initialize(name, back_pack)
#     @name = name
#     @backpack
#   end

#   def <<(other)
#     self.back_pack << other
#   end
# end

# joel = Person.new("joel", nil)
# joel.back_pack = Person.new("friend", nil)

# p joel



# module A
#   def assign_age=(age)
#     @age = age
#   end

#   def display_age
#     p @age
#   end
# end

# class Person
#   include A

#   def initialize(name)
#     @name = name
#   end
# end

# class Child < Person; end

# joe = Child.new("Joe")
# joe.assign_age = 25

# p joe.instance_variables


# class Runner
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def run
#     p "#{@name} is running #{speed} MPH!"
#   end

#   def set_speed=(speed)
#     @speed = speed
#   end

#   private

#   attr_reader :speed
# end

# joe = Runner.new("Joel")
# p joe.name # expose state information about joe via methods defined in the Runner class' public interface
# joe.set_speed = 15 # assign the @speed instance variable to a value; thus updating the state of joe
# joe.run # accessing state information (@name's value) and invoking private method speed; thus
# joe.speed # attempting to expose behavior from outside the class and observing the benefits of our encapsulation of behavior (method access control)

# class Person
# # ---------- by defining `attr_*` methods, we automatically define instance variables of the same name
#   attr_accessor :name, :age
# end
# joel = Person.new # instantiate a new Person object
# # --------------- uninitialized instance variables reference `nil`
# p joel.name # nil
# p joel.age # nil
# # --------------- use setters to initialize them
# joel.name = "Joel" # => Joel
# joel.age = 25      # setter methods always return arg
# # --------------- once initialized, we can access
# p joel # => #<Person:0x00007fb97380c5a8 @name="Joel", @age=25>

# class Person
#   @@total_people = 0

#   def initialize(name)
#     @name = name
#     @@total_people += 1
#   end

#   def self.total_people
#     "total people: #{@@total_people}"
#   end

#   def print_name
#     puts @name
#   end
# end

# joe = Person.new("Joe")
# sarah = Person.new("Sarah")
# franz = Person.new("Franz")

# p Person.total_people
# [joe, sarah, franz].each(&:print_name)
# module A
#   def greet
#     puts "#{self.class} named #{name} says hi!"
#   end

#   class Person
#     include A
#     attr_reader :name

#     def initialize(name)
#       @name = name
#     end
#   end
# end

# joel = A::Person.new("Joel")

# joel.greet

# class Fugitive
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def change_something
#     @name = "Abagnale"
#     @namee #if we had used a getter here, it would have thrown an error bc of our spelling error
#   end

#   def change_something_else
#     @agee = 17
#   end
# end

# frank = Fugitive.new("Frank", 21)

# p frank.change_something
# p frank.change_something_else

# dwarf.rb
# class Dwarf
#   include Comparable

#   def initialize(name, age, beard_strength)
#     @name           = name
#     @age            = age
#     @beard_strength = beard_strength
#   end

#   attr_reader :name, :age, :beard_strength
#   public    :name
#   private   :age
#   protected :beard_strength

#   # Comparable module will use this comparison method for >, <, ==, etc.
#   def <=>(other_dwarf)
#     # One dwarf is allowed to call this method on another
#     beard_strength <=> other_dwarf.beard_strength
#   end

#   def greet
#     "Lo, I am #{name}, and have mined these #{age} years.\
#        My beard is #{beard_strength} strong!"
#   end

#   def blurt
#     # Not allowed to do this: private methods can't have an explicit receiver
#     "My age is #{self.age}!"
#   end
# end

# require 'pry'; pry.start


# gloin = Dwarf.new('Gloin', 253, 7)
# gimli = Dwarf.new('Gimli', 62,  9)

# gloin > gimli         # false
# gimli > gloin         # true

# gimli.name            # 'Gimli'
# gimli.age             # NoMethodError: private method `age'
#                          called for #<Dwarf:0x007ff552140128>

# gimli.beard_strength # NoMethodError: protected method `beard_strength'
#                         called for #<Dwarf:0x007ff552140128>

# gimli.greet          # "Lo, I am Gimli, and have mined these 62 years.\
#                            My beard is 9 strong!"

# gimli.blurt          # private method `age' called for #<Dwarf:0x007ff552140128>

=begin
What are some rules/guidelines when writing programs in OOP?

- bundle common behaviors (classes, modules)
- DRY code; reduce repetition
- objects are sending and receiving messages; implementation shouldn't be that visible to our objects (explicit, hardcoded implementation: assigment of variable)
- single responsibility for our methods (does print something or does return a meaningful value)
- strive for using inheritance intelligently, meaningfully

=end

# class Animal
#   def initialize(name)
#     @name = name
#   end

#   def move
#     puts "walks"
#   end

#   def speak
#     puts "sounds #{@name}"
#   end
# end

# class Dog < Animal

# end

# class Cat < Animal
# end

# class Fish < Animal
#   def move
#     puts "swim"
#   end
# end

# class Animal
#   def move
#     puts "walks"
#   end
# end

# class Dog < Animal
#   def move
#     puts 'boisterous vibration'
#   end
# end

# class Cat < Animal
#   def move
#     puts 'disaffected saunter'
#   end
# end

# [Animal.new, Dog.new, Cat.new].each(&:move)

# module A
#   @ivar = 'instance var in A'
#   puts @ivar
# end
class Student
  attr_reader :name, :fives, :tens, :twenties

  def initialize(name, fives, tens, twenties)
    @name = name
    @fives = fives
    @tens = tens
    @twenties = twenties
  end
end
cam = Student.new("Cameron", 2, 2, 0)
geoff = Student.new("Geoff", 0, 3, 0)
phil = Student.new("Phil", 2, 2, 1)

def most_money(students)
  return students.first.name if students.size == 1

  money = students.each_with_object([]) do |student, money|
    money << [student.fives * 5, student.tens * 10, student.twenties * 20].sum
  end
  students[index_of(money.max)].name
  
end

p most_money([cam, geoff, phil]) == "Phil"
# p most_money([cam, geoff]) == "all"
# p most_money([geoff]) == "Geoff"
