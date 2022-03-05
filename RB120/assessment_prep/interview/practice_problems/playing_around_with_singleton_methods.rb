class Dog
  attr_reader :name, :breed

  def self.speak
    "Woof Woof!"
  end

  def initialize(name, breed)
    @name  = name
    @breed = breed
  end
end

doge = Dog.new("Lucky", "Shiba Inu")

def doge.speak # defined in the the singleton class of `doge`!
  %w(so very many much wow).sample
end

def doge.pose # defining another method in the singleton class `doge`!
  puts "#{speak} downward dog!"
end

p doge.class # Dog
p doge.class.speak # Woof Woof!
doge.pose # wow downward dog!

p doge.singleton_methods
