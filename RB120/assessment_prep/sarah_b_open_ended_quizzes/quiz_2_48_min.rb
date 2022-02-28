# 1 Examine the code and make the needed changes to return the desired statements
class Cat
  @@total_cats = 0

  def initialize(name)
    @@total_cats += 1
    @name = name
  end

  def jump
    "#{@name} is jumping!"
  end

  def self.total_cats
    @@total_cats
  end

  def to_s
    @name
  end
end

# mitzi = Cat.new('Mitzi')
# p mitzi.jump # => "Mitzi is jumping!"
# p Cat.total_cats # => 1
# p "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"

# 2  Examine the Code and add code so the student object's state matches the shown state
# class Student
#   def initialize(name, grade: nil)
#     @grade = grade
#     @name = name
#   end
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

# 3 We now want to add some attr_* methods to our Student class so that we can access and update the state of a Student object. Examine the following Ruby code, add appropriate code to define getters and setters to make examples run as expected.

# class Student
#   attr_accessor :grade, :name

#   def initialize(name, age, grade: nil)
#     @grade = grade
#     @age = age
#     @name = name
#   end
# end

# jon = Student.new('John', 22)
# p jon.name # => 'John'
# jon.name = 'Jon'
# jon.grade = 'B'
# p jon.grade # => 'B'

# 4 Fix the code so that the last two statements return the expected values

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# p sir_gallant.name # => "Sir Gallant"
# p sir_gallant.speak # => "Sir Gallant is speaking."


# 5 Let's add a Thief class as a subclass of Character. You must make some changes to the code so that the last two statements
# return the values shown in the comments. What changes do you need to make?

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} is speaking."
#   end
# end

# class Thief < Character
#   def speak
#     "#{@name} is whispering..."
#   end
# end

# sneak = Thief.new("Sneak")
# p sneak.name # => "Sneak"
# p sneak.speak # => "Sneak is whispering..."


# 6 Make changes to the code to make the last statements return the expected values.

# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     super + "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak # => "Sheep says baa!"
# p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# p Cow.new.speak # => "Cow says mooooooo!"


# 7  What are collaborator objects in Ruby?
=begin
state is the sum total of an objects' instance variable and their values.

An object can be said to be a collaborator object if it is referenced by a different object's instance variable and thus
stored as state in that different object.  Technically, all objects in the ruby standard libary (e.g. Strings, Integers, Arrays, etc)
are collaborators if they meet the aforementioned specification; however, it's not very useful to talk about these types of objects
as being collaborators.  Therefore, we typically reserve the term 'collaborator object' for instances of user-defined classes only.
=end

# 8  Identify all cusmtom collaborator objects in the example

# class Person
#   def initialize(name)
#     @name = name
#   end
# end

# class Cat
#   def initialize(name, owner)
#     @name = name
#     @owner = owner
#   end
# end

# sara = Person.new("Sara")
# fluffy = Cat.new("Fluffy", sara)

=begin
The `Person` object referenced by `sara` is a collaborator object of the `Cat` instance `fluffy` since `sara` is referenced `fluffy`'s
instance variable `@owner` and thus part of `fluffy`'s state.
=end
# 9 What are the differences between classes and modules?
=begin
- inheritance, instantiation, use.

We can instantiate objects from classes; classes can inherit from other classes.  Unlike classes, modules cannot inherit the behavior
of other modules and cannot be used to instantiate objects.

User-defined classes are used as blueprints or outlines for custom objects; this is their primary purpose. Modules on the other hand
have a different purpose.  The two primary purposes of modules are their use as "mixins" and their use as "namespaces".

Both have their roles to play within the context of inheritance.  Classes are said to inherit behaviors from superclasses.  This is
called class inheritance.  Modules (and the interface they store) can be `include`d in classes, this is called interface inheritance.

Using modules for namespacing entails grouping a set of related classes together under unifying principle or concept in the form
of a module name.  This action essentially places "space" between the various class "names" that are present in our code.
=end

# 10 create a spike for the following

# A restaurant has a head chef, 3 regular chefs, and a pastry chef. There are also 2 waiters and a MaitreD. The headchef and
# the MaitreD can supervise. All the chefs can cook. Waiters can speak to the customer and take food orders. The MaitreD can also
#  speak to customers. (from RB 120 Quiz#2 Q10)

=begin
Restaurant, Chef, Waiter, MaitreD,

supervise, cook, speak, take order, speak

=end
# module Restaurant
#   module Speakable
#     def speak; end
#   end

#   module Supervisable
#     def supervise; end
#   end

#   class Chef
#     def cook; end
#   end

#   class PastryChef < Chef; end

#   class HeadChef < Chef
#     include Speakable
#     include Supervisable
#   end

#   class Waiter
#     include Speakable

#     def take_order; end
#   end

#   class MaitreD
#     include Speakable
#     include Supervisable
#   end
# end

# 11- 14 info
# You're designing a Recipe Book application. You've identified some classes that you need:

# RecipeBook
# Recipe
# StarterRecipe
# MainCourseRecipe
# DessertRecipe
# Ingredient
module Conversion; end

class Recipe
  include Conversion
end

class Ingredient
  include Conversion
end

class StarterRecipe < Recipe; end

class MainCourseRecipe < Recipe; end

class DessertRecipe < Recipe; end

class RecipeBook

end

# Each Recipe Book has (contains as state) one or more recipes. Starter recipes, main course recipes, and dessert recipes
#   are all recipe types and share some characteristics but not others. Recipes have one or more ingredients.

# You decide that the application also needs a Conversion module that contains some temperature and
#   measurement conversion methods required by Recipe and Ingredient objects.

# 11 What kind of Object Oriented relationship should exist between RecipeBook and MainCourseRecipe?
#   -> MainCourseRecipe objects should be collaborator objects of RecipeBook objects

# 12 What kind of Object Oriented relationship should exist between Ingredient and Conversion?
#   -> Interface inheritance; we include `Conversion`'s interface into the Ingredient class

# 13 What kind of Object Oriented relationship should exist between Recipe and DessertRecipe?
#   -> Class inheritance; DessertRecipe is a more specific type of Recipe, therefore it should subclass to Recipe.

# 14 What kind of Object Oriented relationship should exist between RecipeBook and Ingredient?
#   -> Ingredient objects are collaborator object of Recipe objects and Recipe objects are collaborator objects of RecipeBook objects.

# bonus: create a spike for the Recipe book application
