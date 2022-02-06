require 'pry'
require 'yaml'

PROMPTS = YAML.load_file('refactor_2_ttt.yml')

module Talk
  def prompt(input)
    puts input
  end
end

class Player
  attr_reader :unique_mark, :score, :name

  def initialize(unique_mark, name = assign_computer_name)
    @name = name
    @unique_mark = unique_mark
    @score = Score.new
  end

  private

  def assign_computer_name
    ['Beep', 'Boop', 'Bingbong', 'Lawrence'].sample
  end
end

class Score
  attr_accessor :current

  def initialize
    @current = ''
  end

  def increment
    if current == ''
      self.current += '>'
    else
      self.current.prepend(' ')
    end
  end
end

class Board
  include Talk
  attr_reader :squares

  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ].freeze

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    prompt(PROMPTS['two_pipes'])
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    prompt(PROMPTS['two_pipes'])
    prompt(PROMPTS['plus_line'])
    prompt(PROMPTS['two_pipes'])
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    prompt(PROMPTS['two_pipes'])
    prompt(PROMPTS['plus_line'])
    prompt(PROMPTS['two_pipes'])
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    prompt(PROMPTS['two_pipes'])
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

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
      return TTTGame::H_MARKER if indices.all? { |idx| @squares[line[idx]].mark == TTTGame::H_MARKER }
      return TTTGame::C_MARKER if indices.all? { |idx| @squares[line[idx]].mark == TTTGame::C_MARKER }
    end
    nil
  end

  def find_at_risk_square(line, curr_board, marker)
    if has_two_marks?(line, curr_board, marker)
      curr_board.squares.select do |k, v|
        line.include?(k) && v.mark == Square::INITIAL_MARK
      end.keys.first
    end
  end

  def has_two_marks?(line, curr_board, marker)
    curr_board.squares.values_at(*line).select do |sqr|
      sqr.mark == marker
    end.count == 2
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
  include Talk
  attr_reader :board, :human, :computer

  H_MARKER = 'X'.freeze
  C_MARKER = 'O'.freeze
  FIRST_TO_MOVE = H_MARKER # [H_MARKER, C_MARKER].sample
  MAX_SCORE = 5

  def initialize
    @board = Board.new
    @human = Player.new(H_MARKER, ask_human_for_their_name)
    @computer = Player.new(C_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    welcome_message
    main_game
    farewell_message
  end

  private

  def ask_human_for_their_name
    name = nil
    loop do
      prompt(PROMPTS['user_name'])
      name = gets.chomp.capitalize
      break board.clear if name
    end
    name
  end

  def human_declare_symbol
    symbol = nil
    loop do
      prompt(PROMPTS['user_symbol'])
      symbol = gets.chomp.to_s
      break board.clear if symbol
    end
    symbol
  end

  def main_game
    loop do
      display_board
      play_one_round
      display_result_and_increment_score
      break prompt(PROMPTS['game_over']) if max_score_reached?
      break unless play_again?
      reset
      display_play_again_message
      display_scores
    end
  end

  def display_board
    puts "#{human.name} is #{human.unique_mark}. #{computer.name} is #{computer.unique_mark}."
    puts ''
    board.draw
    puts ''
  end

  def play_one_round
    loop do
      # binding.pry
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_result_and_increment_score
    clear_screen_and_display_board
    case board.winning_marker
    when human.unique_mark
      increment_score_of(human)
      prompt(PROMPTS['h_won'])
    when computer.unique_mark
      increment_score_of(computer)
      prompt(PROMPTS['c_won'])
    when nil then prompt(PROMPTS['board_full'])
    end
  end

  def max_score_reached?
    human.score.current == MAX_SCORE || computer.score.current == MAX_SCORE
  end

  def play_again?
    answer = nil
    loop do
      prompt(PROMPTS['play_again'])
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    board.clear
  end

  def display_play_again_message
    prompt(PROMPTS['again!'])
    puts
  end

  def display_scores
    prompt(PROMPTS['text_score_board'])
    prompt(PROMPTS['insert_line'])
    puts "#{human.name[0]}: #{human.score.current}"
    puts "#{computer.name[0]}: #{computer.score.current}"
    prompt(PROMPTS['insert_line'])
  end

  def current_player_moves
    if human_turn?
      human_move
      @current_marker = C_MARKER
    else
      computer_move
      @current_marker = H_MARKER
    end
  end

  def human_turn?
    @current_marker == H_MARKER
  end

  def human_move
    puts "Choose a number (#{joinor(board.unclaimed_squares)}): "
    choice = nil

    loop do
      choice = gets.chomp.to_i
      break if board.unclaimed_squares.include?(choice)

      prompt(PROMPTS['invalid_choice'])
    end
    board[choice] = human.unique_mark
  end

  def computer_move
    square = nil
    # offense
    Board::WINNING_LINES.each do |line|
      square = board.find_at_risk_square(line, board, TTTGame::C_MARKER)
      break if square
    end
    # defense
    if !square
      Board::WINNING_LINES.each do |line|
        square = board.find_at_risk_square(line, board, TTTGame::H_MARKER)
        break if square
      end
    end
    # middle
    if !square
      square = 5 if board.squares[5].mark == Square::INITIAL_MARK
    end
    # random
    if !square
      square = board.unclaimed_squares.sample
    end
    board[square] = computer.unique_mark
  end

  def joinor(left_over_squares, divider = ', ', final_divider = 'or')
    case left_over_squares.size
    when 1 then left_over_squares.first
    when 2 then left_over_squares.join(" #{final_divider} ")
    else
      left_over_squares[-1] = "#{final_divider} #{left_over_squares.last}"
      left_over_squares.join(divider)
    end
  end

  def increment_score_of(player_who_won)
    player_who_won.score.increment
  end

  def clear_screen_and_display_board
    board.clear
    display_board
  end

  def welcome_message
    puts "Welcome to TTTGame #{human.name}!"
  end

  def farewell_message
    prompt(PROMPTS['thankyou'])
  end
end

TTTGame.new.play
