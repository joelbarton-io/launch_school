class Animal
  def initialize(diet, superpower) # argument error here since we're passing the wrong # of args: 3 not 2
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower) # wrong implementation of `super`; need to specify the proper # of args(2)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

unicornfish = Fish.new(:herbivore, 'breathe underwater') # works
penguin = FlightlessBird.new(:carnivore, 'drink sea water') # works
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# The code above raises an exception. Examine the error message and alter the code so that it runs
# without error.
