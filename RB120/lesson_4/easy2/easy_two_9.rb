class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play; end;
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

=begin

the Bingo:play instance method would override the Game:play instance method.
Suppose we were to invoke `play` upon an instance of the class Bingo. Since we
are invoking `play` on an instance of the class Bingo, the play
defined in Bingo would be found first, thus overriding the play defined in Bingo's
superclass, Game.

didn't say -> "as soon as ruby finds a match for the invoked method, it uses it"
=end


