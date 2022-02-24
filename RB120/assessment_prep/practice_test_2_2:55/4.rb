class AnimalClass
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  def +(other_class)
    [] << self << other_class
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes

=begin
What is output? Is this what we would expect when using AnimalClass#+?
If not, how could we adjust the implementation of AnimalClass#+ to be more
in line with what we'd expect the method to return?


Line 38 prints an array of `Animal` objects to the screen. Based on the code, it seems that this is
not the desired behavior.  It would be preferable to have two `AnimalClass` objects that have both
a name and an array of `Animal` objects.

A better implementation would be the following:

def +(other_class)
   [] << self << other_class
end

This way, we would have an array of `AnimalClass` objects that contain two discrete instances
in addition to their `@name`s and `@anmimals.`
=end
