# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end

# Cat.generic_greeting


# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name


# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify

# 4
# class Cat
#   attr_reader :name

#   def self.generic_greeting
#     puts "Hello from the Cat class!"
#   end

#   def personal_greeting
#     puts "#{name} is happy you're here!"
#   end

#   def initialize(name)
#     @name = name
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting

# 5

# class Cat
#   @@total_cats = 0
#   def initialize
#     @@total_cats += 1
#   end

#   def self.total
#     puts @@total_cats
#   end
# end

# kitty1 = Cat.new
# kitty2 = Cat.new

# Cat.total

# 6
# create Cat class
# with instance method greet
# should include name of cat and color of cat (as constant)
# class Cat
#   attr_reader :name
#   COLOR = 'chartreuse'
#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}, my color is #{COLOR}! I am beautiful!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

# 7
# print out I'm sophie when it invokes puts kitty

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s 
#     "I'm #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty

# 8 def initialize is unnecessary here because we never supply new any arguments to begin with
# class Person
#   attr_accessor :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

# 9 When to use self ???  ***********************************

# class Person
#   attr_writer :secret
#   def share_secret
#     puts secret
#   end
#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret 


# 10 protected methods allow access between class instances, private methods do not


class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end
  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)