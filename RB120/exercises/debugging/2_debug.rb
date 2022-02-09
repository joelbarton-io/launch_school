class Animal
  def initialize(diet, superpower)
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
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')


# Songbird inherits from bird, bird inherits from animal. In order to avoid this error, we need to specify on line 37, the # of arguments
# being passed to the initialize constructor defined on on lines 2-5.  Without specifying that super should pass 2 arguments (diet and superpower)
# the super tries to pass all available arguments (diet, superpower, and song) to Animal#initialize (which was defined to take only two).
# This fact is the cause of the error. Once we modify line 37, the code runs as intended.
puts robin