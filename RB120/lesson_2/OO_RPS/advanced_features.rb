module Displayable
  def display_welcome_message
    puts "Welcome to RPS game #{human.name}!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner(winner)
    puts "#{winner.name} won!"
  end

  def make_line
    max = ["#{human.name}: #{human.score.current}",
           "#{computer.name}: #{computer.score.current}"].max_by(&:size).size
    "+#{'-' * max}+"
  end

  def display_current_score
    puts make_line
    puts " #{human.name}: #{human.score.current}"
    puts " #{computer.name}: #{computer.score.current}"
    puts make_line
  end

  def display_final_scores
    puts "Final Score: #{human.score.current}-#{computer.score.current}"
  end

  def display_goodbye_message
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

  def to_s
    "#{name} has #{current} points."
  end

  private

  attr_accessor :score, :name
end

class RPSGame
  include Clearable, Displayable

  attr_accessor :human, :computer

  def initialize(rounds)
    @rounds = rounds
    @human = Human.new
    @computer = Computer.new
  end

  def start_game
    display_welcome_message
    clear_and_pause_for(1.5)
    play_round
    display_final_scores
    display_goodbye_message
  end

  private

  attr_reader :rounds

  def play_round
    loop do
      human.choose
      computer.choose
      display_moves
      clear_and_pause_for(1.5)
      determine_winner
      break if reached_ten?
      break unless play_again?
    end
  end

  def a_win_for(winner)
    winner.score.increment
    display_round_winner(winner)
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
    clear_and_pause_for(1.75)
    display_current_score
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp
      break if ['y', 'n', 'yes', 'YES', 'no', 'NO'].include?(answer.downcase)
      puts "Invalid input."
    end
    answer == 'y' || answer == 'yes' || answer == 'YES'
  end

  def reached_ten?
    (human.score.current == rounds) || (computer.score.current == rounds)
  end

  def to_s
    human.to_s
  end
end

RPSGame.new(3).start_game
