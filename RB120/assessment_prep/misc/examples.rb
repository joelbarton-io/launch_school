
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

class Fugitive
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def change_something
    @name = "Abagnale"
    @namee #if we had used a getter here, it would have thrown an error bc of our spelling error
  end

  def change_something_else
    @agee = 17
  end
end

frank = Fugitive.new("Frank", 21)

p frank.change_something
p frank.change_something_else
