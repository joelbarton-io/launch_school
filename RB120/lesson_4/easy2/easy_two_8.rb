class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play
# method from the Game class?

=begin
we would specify that Bingo inherits from Game by placing < Game next to the class
name in the class definition.  This will enable class inheritance. 

=end