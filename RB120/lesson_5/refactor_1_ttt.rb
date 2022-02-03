class Player
  attr_reader :unique_mark, :score

  def initialize(unique_mark)
    @unique_mark = unique_mark
    @score = Score.new
  end
end

class Score
  INITIAL_SCORE = 0
  attr_accessor :current

  def initialize
    @current = INITIAL_SCORE
  end

  def increment
    self.current += 1
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

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts '     |     |     '
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts '     |     |     '
    puts '-----+-----+-----'
    puts '     |     |     '
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts '     |     |     '
    puts '-----+-----+-----'
    puts '     |     |     '
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts '     |     |     '
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
      if indices.all? { |idx| @squares[line[idx]].mark == TTTGame::HUMAN_MARKER }
        # increment human win in score board
        return TTTGame::HUMAN_MARKER
      elsif indices.all? { |idx| @squares[line[idx]].mark == TTTGame::COMPUTER_MARKER }
        # increment human win in score board
        return TTTGame::COMPUTER_MARKER
      end
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

class LeaderBoard

end
class TTTGame
  attr_reader :board, :human, :computer

  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  FIRST_TO_MOVE = HUMAN_MARKER

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    welcome_message
    main_game
    farewell_message
  end

  private

  def main_game
    loop do
      display_board
      play_one_round
      display_result
      break unless play_again?
      reset
      display_play_again_message
      display_scores
    end
  end

  def display_board
    puts "You are #{human.unique_mark}. Computer is #{computer.unique_mark}."
    puts ''
    board.draw
    puts ''
  end

  def play_one_round
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.unique_mark    then puts 'You won the round!'
    when computer.unique_mark then puts 'Computer won the round!'
    when nil                  then puts 'The board is full!'
    end
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
    @current_marker = FIRST_TO_MOVE
    board.clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts
  end

  def display_scores
    puts 'ScoreBoard'
    puts '----------'
    puts "H: #{human.score.current}"
    puts "C: #{computer.score.current}"
    puts '----------'
    puts
  end

  def current_player_moves
    if human_turn?
      human_move
      @current_marker = COMPUTER_MARKER
    else
      computer_move
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def computer_move
    board[board.unclaimed_squares.sample] = computer.unique_mark
  end

  def human_move
    puts "Choose a number (#{joinor(board.unclaimed_squares)}): "
    choice = nil

    loop do
      choice = gets.chomp.to_i
      break if board.unclaimed_squares.include?(choice)

      puts 'Invalid choice.'
    end
    board[choice] = human.unique_mark
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

  def welcome_message
    puts 'Welcome to TTTGame.'
  end

  def farewell_message
    puts 'Thanks for playing.'
  end

  def clear_screen_and_display_board
    board.clear
    display_board
  end
end

game = TTTGame.new
game.play


=begin
- keeping score
  - i decided to ignore the suggestion to avoid using an instance or global variable here.
  Using an instance variable makes a lot of sense in this context.
  I decided to define a new class Score, with a few attributes

 everytime an outcome has been reached (either computer or player have won, we want to update our scoreboard)
 Is this a player attribute? This makes more sense than storing it in an instance variable of either of the
 Board or TTTGame classes. This way, Player and LeaderBoard can collaborate.  After a fair bit of sandbox
 experimentation, I managed to establish the relationship I wanted between Score and Player objects.

 The next major challenge was deciding where it made the most sense to invoke TTTGame#increment_score_of(player).
 Following the general flow of the program, it wasn't immediately obvious where to place the method.

 The placement of the current score breakdown felt fairly straightforward: if we're starting a new round,
 tell the human user the current score. The obvious location is to invoke TTTGame#display_score is after the
 TTTGame#display_play_again_message method call.
=end
