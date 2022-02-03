=begin

class Steak
  def initialize(trait)
    @trait = trait
  end

  def style
    puts Traits::STYLE, Traits::DIET, Traits::SNACK
  end
end


module Traits
  STYLE = 'natural'
  DIET  = 'gluten free'
  SNACK = 'ready to eat'
end

kirk = Steak.new('thick')

kirk.style


Can I access a constant defined in an unincluded module from an object

class Shape
  SOME_CONSTANT = 10
end


class Triangle < Shape
  def initialize(sides)
    @sides = sides
  end

  def get_constant
    puts SOME_CONSTANT
  end



class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.inspect                  # => bark! bark! bark! bark!





class Person
  @name = "bob"              # class level initialization

  def get_name
    @name
  end
end

bob = Person.new
puts bob.class.public_methods            # => nil

=end

class Steak
 attr_reader :texture
 attr_writer :texture
  def initialize(texture)
    @texture = texture
  end

  def change_texture(texture)
    self.texture = texture
  end

  private

end

jerky = Steak.new("stringy")


puts jerky.texture

jerky.change_texture("sliced up")

puts jerky.texture