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
    if rock?
      return true if other_move.paper?
      return false
    elsif paper?
      return true if other_move.scissors?
      return false
    elsif scissors?
      return true if other_move.rock?
      return false
    end
  end

  def <(other_move)
    if rock?
      return true if other_move.scissors?
      return false
    elsif paper?
      return true if other_move.rock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return false
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name
  def initialize
    set_name
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
      puts "rock, paper, or scissors?"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "invalid input"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Beep', 'Boop', 'Bingbong', 'Lawrence'].sample
  end
  
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize 
    @human = Human.new
    @computer = Computer.new
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    if human.move < computer.move
      puts "#{human.name} won!"
    elsif human.move > computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Invalid input."
    end
    answer == 'y' ? true : false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def to_s
    human.to_s
  end

  def display_welcome_message
    puts "Welcome to RPS game #{human.name}!"
  end

  def display_goodbye_message
    puts "Thank you for playing!"
  end
end

RPSGame.new.play

=begin
To be honest, this felt needlessly compartmentalized.  The addition of three move 
methods, the Move class (enabling us to use a custom move objects), and the two 
<, > methods was a fairly serious trade off in terms of readability for me personally.

That being said, I think I learned a lot from seeing the use of the Move::VALUES 
constant in use; I haven't seen a namespace (?) used before.  Also, I could see that
this design is probably better if the scale of the project increases; it allows for

=end
