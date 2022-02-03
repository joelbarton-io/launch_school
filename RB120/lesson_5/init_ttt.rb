require 'pry'
module Displayable
  def show_result
    show_board

    case board.detect_winner
    when human.unique_mark    then puts "You won!"
    when computer.unique_mark then puts "Computer won!"
    when nil                  then puts "The board is full!"
    end

  end

  def welcome_message
    puts "Welcome to TTTGame."
  end

  def show_board
    system("clear")
    puts "You are #{human.unique_mark}. Computer is #{computer.unique_mark}."
    puts "     |     |     "
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}  "
    puts "     |     |     "
  end

  def farewell_message
    puts "Thanks for playing."
  end
end

class Board
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
    ]

  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new}
  end

  def get_square_at(key)
    @squares[key].mark
  end

  def set_square_at(key, mark)
    @squares[key].mark = mark
  end

  def unclaimed_squares
    @squares.keys.select {|key| @squares[key].unmarked?}
  end

  def full?
    unclaimed_squares.empty?
  end

  def detect_winner
    WINNING_LINES.each do |line|
      if @squares[line[0]].mark == TTTGame::HUMAN_MARKER && @squares[line[1]].mark == TTTGame::HUMAN_MARKER && @squares[line[2]].mark == TTTGame::HUMAN_MARKER
        return TTTGame::HUMAN_MARKER
      elsif @squares[line[0]].mark == TTTGame::COMPUTER_MARKER && @squares[line[1]].mark == TTTGame::COMPUTER_MARKER && @squares[line[2]].mark == TTTGame::COMPUTER_MARKER
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def someone_won?
    !!detect_winner
  end
end

class Square
  INITIAL_MARK = " "
  attr_accessor :mark

  def initialize(mark= INITIAL_MARK)
    @mark = mark
  end

  def unmarked?
    mark == INITIAL_MARK
  end

  def to_s
    @mark
  end
end

class Player
  attr_reader :unique_mark
  def initialize(unique_mark)
    @unique_mark = unique_mark
  end
end

class TTTGame
  include Displayable
  attr_reader :board, :human, :computer

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = "O"

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    welcome_message
    show_board
    loop do
      human_move
      break if board.someone_won? || board.full?

      computer_move
      show_board

      break if board.someone_won? || board.full?
    end
    show_result
    farewell_message
  end

  def computer_move
    board.set_square_at(board.unclaimed_squares.sample, computer.unique_mark)
  end

  def human_move
    puts "Choose a number (#{board.unclaimed_squares.join(', ')}): "
    choice = nil

    loop do
      choice = gets.chomp.to_i
      break if board.unclaimed_squares.include?(choice)
      puts "Invalid choice."
    end
    board.set_square_at(choice, human.unique_mark)
  end
end

game = TTTGame.new
game.play
