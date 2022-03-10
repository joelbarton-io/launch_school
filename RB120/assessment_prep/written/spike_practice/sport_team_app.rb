=begin
four players (goalie, attacker, midfielder, defender)
all players jerseys are blue except the goalies which is white with blue stripes
all players can shoot and run
attacker can lob the ball
midfielder should be able to pass
defender should be able to block
ref wears black, can run and whistle

athlete, player, ref,

pass, lob, block, whistle, shoot
=end

# module Wearable
#   def jersey
#     puts "My jersey is the color #{color}!"
#   end
# end

# class Athlete
#   include Wearable

#   attr_reader :position

#   def initialize(position= self.class)
#     @position = position
#   end

#   def run
#     puts "#{self.class} is running!"
#   end
# end

# class Player < Athlete
#   def color
#     'Blue'
#   end

#   def shoot
#     puts "#{position} shot the ball!"
#   end
# end

# class Referee < Athlete
#   def color
#     'Black'
#   end

#   def whistle
#     puts "#{self.class} blew the whistle!"
#   end
# end

# class Goalie < Player
#   def color
#     "White with #{super} stripes"
#   end
# end

# class Midfielder < Player; end

# class Defender < Player; end

# class Attacker < Player; end

# ref        = Referee.new
# goalie     = Goalie.new
# attacker   = Attacker.new
# defender   = Defender.new
# midfielder = Midfielder.new

# [ref, goalie, attacker, defender, midfielder].each(&:jersey)
# [ref, goalie, attacker, defender, midfielder].each(&:run)
# [goalie, attacker, defender, midfielder].each(&:shoot)
# [ref].each(&:whistle)

