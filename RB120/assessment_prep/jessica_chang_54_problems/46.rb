class Parent
  DISTANCE = 10 # established pre-runtime

  def initialize(name)
    @name = name
  end

  def how_far_he_ran
    puts "#{@name} ran #{self.class::DISTANCE} miles" # Child::DISTANCE
  end
end

class Child < Parent
  DISTANCE = 15
end

joe = Parent.new("joe")
sean = Child.new("sean")

joe.how_far_he_ran #  => looks in parent for 'DISTANCE' which is 10
sean.how_far_he_ran # => 'sean ran 15'

# lexical (positional) -> class/interface inheritance

# book rec the happiness advantage; sean baker
