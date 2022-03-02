=begin
# Problem received from Raul Romero
class Human
  attr_reader :name

  def initialize(name="Dylan")
    @name = name
  end

  def hair_colour(color)
    color = 'blonde' if color == ""
    "Hi my name is #{name} and I have #{color} hair."
  end

  def self.hair_colour(color)
    color = 'blonde' if color == ""
    "Hi my name is Dylan and I have #{color} hair."
  end
end

puts Human.new("Jo").hair_colour("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

# "Hi my name is #{name} and I have #{hair_color}"
puts Human.hair_colour("")
# Should "Hi, my name is Dylan and I have blonde hair."

# reflection: I didn't realize that line 24 was class method; my eyes just brushed over it too quickly. I also misspelled 'colour'



class Human
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def +(other_human_object)
    self.name + other_human_object.name
  end

  def equal?(other_human_object)
    # self.class == other_human_object.class
    self.instance_of?(other_human_object.class) # better than comparing class names
  end

  protected :name
end

gilles = Human.new("gilles")
anna = Human.new("anna")

puts anna.equal?(gilles) # => true (should return this value.)
puts anna + gilles # should output 'annagilles'

# override `BasicObject#equal?` to check if they are of instances of the same class, implement a custom `+` instance method concontanates each instances value referenced by their unique @name i-vars



module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters

  def initialize(name)
    #
    self.name # = name # @name = 'barb'
    @characters = []
  end

  def display
    name #
  end

  protected

  attr_reader :name
  attr_writer :name
end

class Monster < Characters
  include Attackable

  def initialize(name)
    super # super pass all args in `Monster#initialize` to `Characters#initialize`
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self)
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb') # @characters = []
rob = Monster.new('monst') #
conan.characters << rob # works

p conan # Barbarian...fjsldkf @characters = [Monster...fdj> @characters = []]
p conan.display # nil since @name was never initialized

# Without running the code, describe what the above outputs and why?

# reflection: a lot to navigate; understood the problem well, but jumped the gun wrt running the code.


# give class Barbarian the functionality of the Monster instance method attack

# If you used class inheritance, now try doing it without class inheritance directly.
# If you used modules, now try not using modules
# If you used duck typing, now don't use duck typing

# module Attackable
#   def attack
#     "attacks!"
#   end
# end

class Monster
  # include Attackable
  def attack
    "attacks!"
  end
end

class Barbarian # < Monster
  # include Attackable
  def attack
    'attacks slightly differently!'
  end
end

[Monster.new, Barbarian.new].each(&:attack) # duck typing


# ----------------------------------------------



# # Without adding any methods below, implement a solution.

# =begin
# - include a module via interface inheritance
# =end
# module CompareDiffClassObjects
#   def >(other_obj)
#     field1 > other_obj.field1
#   end
# end

# module CompareSameClassObjects
#   def >(other_obj)
#     field2 > other_obj.field2
#   end
# end

# class ClassA
#   attr_reader :field1, :field2

#   def initialize(num)
#     @field1 = "xyz"
#     @field2 = num
#   end

#   include CompareDiffClassObjects
#   include CompareSameClassObjects
# end

# class ClassB
#   attr_reader :field1

#   def initialize
#     @field1 = "abc"
#   end

#   include CompareDiffClassObjects
# end

# obj1 = ClassA.new(50)
# obj2 = ClassA.new(25)
# obj3 = ClassB.new

# p obj1 > obj2 # => true  ... two objects of the same class
# p obj2 > obj3 # => false ... two objects of different classes (both have field1 reader attribute)

# DNF!


# Unknown
class BenjaminButton
  attr_accessor :actual_age, :appearance_age

  def initialize
    @actual_age = 0
    @appearance_age = 100
  end

  def get_older
    self.actual_age += 1
    self.appearance_age -= 1
  end

  def die
    self.actual_age = 100
    self.appearance_age = 0
  end
end

class BenjaminButton
end


benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1
p benjamin.actual_age # => 1

benjamin.get_older
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0



# ----------------------------------------------



class Wizard
  attr_reader :name, :hitpoints

  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end

  def fireball
    "casts Fireball for 500 damage!"
  end
end

class Summoner < Wizard
  attr_reader :souls

  def initialize(name, hitpoints)
    super(name, hitpoints)
    @souls = []
  end

  def soul_steal(character)
    @souls << character
    souls
  end
end

gandolf = Summoner.new("Gandolf", 100)
p gandolf.name # => "Gandolf"

voldimort = Wizard.new("voldimort", 200)
p voldimort.fireball #=> "casts fireball for 500 damage!"

p gandolf.hitpoints #=> 100

p gandolf.soul_steal(voldimort) #=> [#<Wizard:0x000055d782470810 @name="voldimort", @hitpoints=200>]

p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"

# reflection, very easy, the language and explanation came easy to me

# ----------------------------------------------

# module Assaultable
#   def attacks
#     puts 'attacks'
#   end
# end
class Character
  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end

  def attacks
    puts 'attacks'
  end
end

class Barbarian < Character
  # include Assaultable

  # def initialize(name, hitpoints)
  #   @name = name
  #   @hitpoints = hitpoints
  # end

end

class Monster < Character
  # include Assaultable

  # def initialize(name, hitpoints)
  #   @name = name
  #   @hitpoints = hitpoints
  # end
end


conan = Barbarian.new("Conan", 50)
zombie = Monster.new("Fred", 100)

conan.attacks
zombie.attacks

# We expected the code to output
#=> "attacks!"
#=> "attacks!"

#=> Instead we raise an error.  What would be the best way to fix this implementation? Why?


# ----------------------------------------------

# What does the below code output? How can you fix it so we get the desired results?

class Animal
  # @@sound = nil

  def initialize(name)
    @name = name
  end

  def speak
    puts "#{@name} says #{@sound}"
  end
end

class Dog < Animal
  def initialize(name)
    super
    @sound = 'Woof Woof!'
  end
end

class Cat < Animal
  def initialize(name)
    super
    @sound = 'Meow!'
  end
end

fido = Dog.new('Fido')
felix = Cat.new('Felix')

                    # Expected Output:
fido.speak          # => Fido says Woof Woof!
felix.speak         # => Felix says Meow!

# actual output =>  # Fido says Meow!
              # =>  # Felix says Meow!

# assuming we aren't allowed to replace @@sound with @sound, impossible given the hierarchy established.  Even if we move the @@sound = outside of the two initialize methods in Dog and Cat, we still get undesirable behavior.
# reflection: could have also used a SOUND constant and access it via `::` inside of `Animal#speak` like `self.class::SOUND`


# ----------------------------------------------
# GROCERY STORE PROBLEM

# GOAL:
# Create an application that allows you to add "products" to a shopping basket.
# So define the CLASSES for each product (make 3).
# Products should have a name and a price (an integer).
# Add products to the shopping basket
# At checkout calculate total_price of ALL products.

class ShoppingBasket
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_products(products)
    products.each do |item|
      basket << item
    end
  end
end

class CheckoutDesk
  def total_price(items)
    total = 0
    items.basket.each do |product|
      total += product.price
    end
    p total
  end
end

# three product classes

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Vegetable < Product; end

class Meat < Product; end

class Dairy < Product; end

celery    = Vegetable.new("celery", 1)
steak     = Meat.new("steak", 20)
cheese    = Dairy.new("cheese", 11)
my_basket = ShoppingBasket.new
groceries = [celery, steak, cheese]
checkout  = CheckoutDesk.new

my_basket.add_products(groceries)
checkout.total_price(my_basket)


# reflection: smooth process, no unexpected hiccups.
# ShoppingBasket class collaborates with the three subclasses of Product and their objects
# CheckoutDesk class collaborates with the ShoppingBasket class and its objects
=end
