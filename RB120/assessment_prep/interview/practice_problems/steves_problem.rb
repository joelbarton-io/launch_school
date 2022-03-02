# # class AnimalClass
# #   attr_accessor :name, :animals

# #   def initialize(name)
# #     @name = name
# #     @animals = []
# #   end

# #   def <<(animal)
# #     animals << animal
# #   end

# #   def +(other_class)
# #     # [] << self << other_class
# #     [self] + [other_class]
# #   end
# # end

# # class Animal
# #   attr_reader :name

# #   def initialize(name)
# #     @name = name
# #   end
# # end

# # mammals = AnimalClass.new('Mammals')
# # mammals << Animal.new('Human')
# # mammals << Animal.new('Dog')
# # mammals << Animal.new('Cat')

# # birds = AnimalClass.new('Birds')
# # birds << Animal.new('Eagle')
# # birds << Animal.new('Blue Jay')
# # birds << Animal.new('Penguin')

# # some_animal_classes = mammals + birds
# # p some_animal_classes # [] single, contains all elements from both animal arrays

# # =begin
# # What is output? Is this what we would expect when using AnimalClass#+? If not, how could we adjust
# # the implementation of AnimalClass#+ to be more in line with what we'd expect the method to return?
# # =end

# # Modify the given code to achieve the expected output

# # question
# # class FishAliens
# #   def initialize(age, name)
# #     @age = age
# #     @name = name
# #   end

# #   protected

# #   attr_reader :age, :name
# # end

# # class Jellyfish < FishAliens; end

# # class OctoAlien < FishAliens; end

# # fish = Jellyfish.new(100, "Fish")
# # alien = OctoAlien.new(75, "Roger")

# #                       # Expected output:
# # p fish == alien       # => false

# # answer:
# # Create a comparison to see if the ages of JellyFish and OctoAlien are the same.
# class FishAliens
#   def initialize(age, name)
#     @age = age
#     @name = name
#   end

#   def compare_age(other)
#     age == other.age
#   end

#   # protected methods that are defined in a superclass are inherited by subclasses and can be invoked but instances of _all_ inheriting subclasses

#   protected

#   attr_reader :age, :name
# end

# class Jellyfish < FishAliens
# # if we define protected methods in a subclass, instances from other subclasses cannot access them

#   # def ==(other)
#   #   age == other.age
#   # end

#   # protected

#   # attr_reader :age, :name
# end

# class OctoAlien < FishAliens
#   # def ==(other)
#   #   age == other.age
#   # end

#   # protected

#   # attr_reader :age, :name
# end

# fish = Jellyfish.new(100, "Fish")
# alien = OctoAlien.new(75, "Roger")

# p fish == alien # => returns false when comparison and getters defined in superclass
# # raises an error when comparison and getters defined separately in subclasses

=begin
classes, behaviors

There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists straighten teeth.
All of these aforementioned specialties are dentists. All dentists graduated from dental school.  Oral surgeons place implants.
General dentists fill teeth

nouns:office,dentists,othodontists, general dentist,oral surgeons, specialties, dental school,
verbs: fill teeth,pull teeth,straighten teeth,place implants
=end

module Pullable # mixin
  def pull_teeth; end
end

module MedicalProfession # 'container' -> using a module as a namespace
  class Dentist
    def i_am_a
      puts self.class
    end
  end

  class Surgeon; end
end

class Dentist
  def graduated; end
end

object = MedicalProfession::Dentist.new
p object.class # => MedicalProfession::Dentist
p Dentist.new.class # Dentist
object.i_am_a # => MedicalProfession::Dentist

class Orthodontist < Dentist
  def straighten_teeth; end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implants; end
end

class GeneralDentist < Dentist
  include Pullable

  def fill_teeth; end
end

[GeneralDentist.new, OralSurgeon.new, Orthodontist.new].each(&:graduated) # polymorphism? via class inheritance? (is-a relationship)
[GeneralDentist.new, OralSurgeon.new].each(&:pull_teeth) # has-a relationship, polymorphism via ... interface inheritance

# inheritance via 3 ways
# inheritance == class inheritance in Ruby
# composition == interface inheritance Ruby
