module Displayable
  def welcome_message
    puts "Welcome to RPS game #{human.name}!"
  end

  def show_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def round_winner(winner)
    puts "#{winner.name} won!"
  end

  def draw_line
    max = ["#{human.name}: #{human.score.current}",
           "#{computer.name}: #{computer.score.current}"].max_by(&:size).size
    "+#{'-' * max}+"
  end

  def current_score
    puts draw_line
    puts " #{human.name}: #{human.score.current}"
    puts " #{computer.name}: #{computer.score.current}"
    puts draw_line
  end

  def final_score
    puts "Final Score: #{human.score.current}-#{computer.score.current}"
  end

  def farewell_message
    puts "Thank you for playing! Goodbye now."
  end
end

module Clearable
  def clear_and_pause_for(time)
    sleep(time)
    system("clear")
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = Score.new
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose one of the following: 'rock', 'paper', or 'scissors'."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "invalid input"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Beep', 'Boop', 'Bingbong', 'Lawrence', 'Sylvia'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']
  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def >(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def <(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def to_s
    @value
  end
end

class Score
  def initialize
    @score = 0
  end

  def current
    score
  end

  def increment
    self.score += 1
  end

  private

  attr_accessor :score, :name

  def to_s
    "#{name} has #{current} points."
  end
end

class RPSGame
  include Clearable, Displayable

  SLEEP_DURATION = 1.33
  attr_reader :human, :computer

  def initialize(rounds)
    @rounds = rounds
    @human = Human.new
    @computer = Computer.new
  end

  def start_game
    welcome_message
    clear_and_pause_for(SLEEP_DURATION)
    play_round
    final_score
    farewell_message
  end

  private

  attr_reader :rounds

  def play_round
    loop do
      human.choose
      computer.choose
      show_moves
      clear_and_pause_for(SLEEP_DURATION)
      determine_winner
      break if reached_specified_round_limit?
      break unless play_again?
    end
  end

  def a_win_for(winner)
    winner.score.increment
    round_winner(winner)
  end

  def determine_winner
    if human.move < computer.move
      a_win_for(human)
    elsif human.move > computer.move
      a_win_for(computer)
    else
      puts "It's a tie."
    end
  end

  def play_again?
    clear_and_pause_for(SLEEP_DURATION)
    current_score
    answer = nil
    loop do
      puts "Keep playing?"
      answer = gets.chomp
      break if ['y', 'n', 'yes', 'no'].include?(answer.downcase)
      puts "Invalid input."
    end
    answer == 'y' || answer == 'yes'
  end

  def reached_specified_round_limit?
    (human.score.current == rounds) || (computer.score.current == rounds)
  end

  def to_s
    human.to_s
  end
end

RPSGame.new(3).start_game

=begin

I chose to create a Score class from which I could instantiate score objects.
My rationale for this decision is maintaining consistency.  Since I'm using a
Move object to handle all move-related actions, using a Score object felt right.

I noticed my RPSGame class getting fairly bloated with display-ish methods that
were heavy with puts statements, string interpolations, and method chaining.  This
was leading to quite a few ABC-complexity issues (one method scored above 40!) along
with general loss of readability/maintainability.  I decided to extract every method
that involved displaying final result/current scores/etc. into a Displayable module.

I wanted to keep things simple with this assigment and focus on thinking about spending
time thinking about the core OO concepts.

One of the issues I see in my code is some redundancy in some of my methods in the Displayable
module. In general, this doesn't feel like that much of a problem.  It's likely better to
have too many methods than too few taking on too much responsibility.


=end