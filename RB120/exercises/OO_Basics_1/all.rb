# 1
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

# 2 / 4 / 5 / 6 / 7 / 8 / 9 / 10

module Walkable 
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat 
  include Walkable
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}."
  end
end

# 3
kitty = Cat.new("Sophie")
kitty.greet 
kitty.walk 
# 

#
#
