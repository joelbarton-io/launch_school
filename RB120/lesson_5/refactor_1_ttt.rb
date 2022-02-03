class Player
  attr_reader :unique_mark

  def initialize(unique_mark)
    @unique_mark = unique_mark
  end
end

class Board
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ].freeze

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts '     |     |     '
    puts "  #{get_square_at(1)}  |  #{get_square_at(2)}  |  #{get_square_at(3)}  "
    puts '     |     |     '
    puts '-----+-----+-----'
    puts '     |     |     '
    puts "  #{get_square_at(4)}  |  #{get_square_at(5)}  |  #{get_square_at(6)}  "
    puts '     |     |     '
    puts '-----+-----+-----'
    puts '     |     |     '
    puts "  #{get_square_at(7)}  |  #{get_square_at(8)}  |  #{get_square_at(9)}  "
    puts '     |     |     '
  end

  def get_square_at(key)
    @squares[key].mark
  end

  def []=(key, mark)
    @squares[key].mark = mark
  end

  def unclaimed_squares
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unclaimed_squares.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    indices = [0, 1, 2]

    WINNING_LINES.each do |line|
      return TTTGame::HUMAN_MARKER    if indices.all? { |idx| @squares[line[idx]].mark == TTTGame::HUMAN_MARKER }
      return TTTGame::COMPUTER_MARKER if indices.all? { |idx| @squares[line[idx]].mark == TTTGame::COMPUTER_MARKER }
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def clear
    system 'clear'
  end
end

class Square
  INITIAL_MARK = ' '.freeze
  attr_accessor :mark

  def initialize(mark = INITIAL_MARK)
    @mark = mark
  end

  def unmarked?
    mark == INITIAL_MARK
  end
  

  def to_s
    @mark
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    welcome_message
    display_board
    loop do
      play_one_round
      break unless play_again?
      reset
      display_play_again_message
    end
    farewell_message
  end

  def play_one_round
    loop do
      human_move
      break if board.someone_won? || board.full?

      computer_move
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
    display_result
  end

  def play_again?
    answer = nil
    loop do
      puts 'Play again? (y/n)'
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
    end
    answer == 'y'
  end

  def reset
    board.reset
    board.clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def computer_move
    board[board.unclaimed_squares.sample] = computer.unique_mark
  end

  def human_move
    puts "Choose a number (#{board.unclaimed_squares.join(', ')}): "
    choice = nil

    loop do
      choice = gets.chomp.to_i
      break if board.unclaimed_squares.include?(choice)

      puts 'Invalid choice.'
    end
    board[choice] = human.unique_mark
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.unique_mark    then puts 'You won!'
    when computer.unique_mark then puts 'Computer won!'
    when nil                  then puts 'The board is full!'
    end
  end

  def welcome_message
    puts 'Welcome to TTTGame.'
  end

  def display_board
    puts "You are #{human.unique_mark}. Computer is #{computer.unique_mark}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    board.clear
    display_board
  end

  def farewell_message
    puts 'Thanks for playing.'
  end
end

game = TTTGame.new
game.play
