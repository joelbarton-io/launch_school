=begin
module A
  CONSTANT = self
  def a
    puts CONSTANT
  end

  module B
    def b
      puts CONSTANT
    end

    module C
      def c
        puts CONSTANT
      end

      module D
        def d
          puts CONSTANT
        end

        class Klass
        end
      end
    end
  end
end

instance = A::B::C::D::Klass.new
instance.a
instance.b
instance.c
instance.d
# What are some of the differences between constant lookup and method lookup?
# Talk through an example of each in the above code.




# What does the below code output? How can you fix it so we get the desired results?


class Animal
  @@sound = nil # pre-runtime?  THIS IS THE ONLY COPY

  def speak
    p @@sound
  end
end

class Cat < Animal
  @@sound = 'Meow!'
end

class Dog < Animal
  @@sound = 'WOOF Woof'

  def change_sound
    @@sound = "Meow!"
  end
end

# pre instantiation        @@sound = nil
fido = Dog.new #   @@sound = 'Woof Woof!'
felix = Cat.new # @@sound = 'Meow!'

fido.speak
felix.speak

fido.change_sound

fido.speak
felix.speak


# speak is inherited;
# @name is initialized to 'fido'
# reassign @@sound to 'Woof Woof!'

# instance variables are scoped at the object level!  Every object has its own unique i-vars
# @@sound's value depends on the most recent reassignment
# treacherous!

# O.E. When is it appropriate to use a module?  Give some examples.

class Animal
  # def initialize # code breaks Argument error
  # end
end

class Bear < Animal
  attr_reader :color

  # def initialize
  #   super
  #   @color = "Black"
  # end
end

bear = Bear.new
p bear.color # => "Black"

# p bear.class.private_methods
# [:initialize, :inherited, :remove_const, :method_added, :method_removed, :method_undefined, ...

p BasicObject.instance_methods
# [:!, :==, :!=, :equal?, :instance_eval, :instance_exec, :__id__, :__send__]



four players (goalie, attacker, midfielder, defender)
all players jerseys are blue except the goalies which is white with blue stripes
all players can shoot and run
attacker can lob the ball
midfielder should be able to pass
defender should be able to block
ref wears black, can run and whistle
=end
