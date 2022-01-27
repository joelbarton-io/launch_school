class Player
  attr_accessor :move, :player_type, :name
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?(player_type)
      n = ''
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, you must enter a name."
      end
      self.name = n
    else
      self.name = ['Beep', 'Boop', 'Bingbong', 'Lawrence'].sample
    end
  end

  def human?(player_type)
    @player_type == 'human'
  end

  def choose
    if human?(player_type)
      choice = nil
      loop do 
        puts "rock, paper, or scissors?"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "invalid input"
      end
      self.move = choice
    else 
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize 
    @human = Player.new('human')
    @computer = Player.new('computer')
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    puts compare(human, computer)
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

  def compare(human, computer)
    case
    when human.move     ==  computer.move                                  then "It's a tie!"
    when human.move     ==  'rock'      &&  computer.move  ==  'scissors'  then "#{human.name} won!"
    when human.move     ==  'paper'     &&  computer.move  ==  'rock'      then "#{human.name} won!"
    when human.move     ==  'scissors'  &&  computer.move  ==  'paper'     then "#{human.name} won!"
    when computer.move  ==  'rock'      &&  human.move     ==  'scissors'  then "#{computer.name} won!"
    when computer.move  ==  'paper'     &&  human.move     ==  'rock'      then "#{computer.name} won!"
    when computer.move  ==  'scissors'  &&  human.move     ==  'paper'     then "#{computer.name} won!"
    end
  end

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