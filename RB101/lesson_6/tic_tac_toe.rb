WIN_CONDITIONS = {
  1 => [1, 2, 3], 2 => [4, 5, 6], 3 => [7, 8, 9],
  4 => [1, 4, 7], 5 => [2, 5, 8], 6 => [3, 6, 9],
  7 => [1, 5, 9], 8 => [3, 5, 7]
}

USER, COMPUTER = "x", "o"

SCORE = {:user=> 0, :computer=> 0}

def show_board(brd)
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "-----+-----+-----"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "-----+-----+-----"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
end

def initialize_board
  new_board = (1..9).each_with_object({}) do |num, hsh|
    hsh[num] = " "
  end
  new_board
end

def example_board
  new_board = (1..9).each_with_object({}) do |num, hsh|
    hsh[num] = num
  end
  new_board
end

def prompt(message)
  puts ">>> #{message}"
end

def play_again?(answer)
  answer == "y"
end

def insert_break
  0.upto(5) { puts '.' }
  puts ""
end

def continue? # => t/f
  prompt("ENTER to continue")
  answer = gets.chomp
  answer == ""
end

def generate_computer_move(curr_board, number = nil)
  loop do
    number = (1..9).to_a.sample
    next if curr_board[number] == USER || curr_board[number] == COMPUTER
    break number
  end
  number
end

def valid_user_input?(input) # => t/f
  (1..9).to_a.include?(input)
end

def player_move!(curr_board, user_input = nil)
  loop do
    prompt("INPUT a number to claim a square!")
    user_input = gets.chomp.to_i
    next prompt("invalid input") unless valid_user_input?(user_input)
    next prompt("box #{user_input} is already populated!") if curr_board[user_input] == USER ||
    curr_board[user_input] == COMPUTER

    break system("clear")
  end
  user_input
end

def a_win?(board_state, symbol) # this is my most opaque method, i think. returns => t/f
  same_symbol = Proc.new { |el| board_state[el] == symbol }
  result = (1..8).any? { |number| WIN_CONDITIONS[number].all?(&same_symbol) }
  result
end

def five_wins?(score)
  score.any? do |_k, v|
    v >= 5
  end
end
loop do
  system("clear")
  prompt("    lets   ")
  prompt("  <[play]> ")
  prompt("Tic-Tac-Toe")
  puts ""
  system("clear") if continue?()

  board = initialize_board()
  prompt("with a grid as our board...")
  puts ""
  show_board(board)
  puts ""
  system("clear") if continue?()

  prompt("and DIGITS as SQUARES...")
  puts ""
  board = example_board
  show_board(board)
  puts ""
  system("clear") if continue?()

  prompt("Care to play?")
  insert_break()
  next system("clear") unless continue?()

  rounds_played = 0
  loop do
    system("clear")
    # prompt("#{score}")
    board = initialize_board()

    loop do
      prompt("score: #{SCORE[:user]}-#{SCORE[:computer]}")
      player_move = player_move!(board)
      board[player_move] = USER

      if a_win?(board, USER)
        SCORE[:user] += 1
        break prompt("user wins!")
      end
      break prompt("draw!") if board.all? { |_k, v| v == USER || v == COMPUTER }

      computers_move = generate_computer_move(board)
      board[computers_move] = COMPUTER
      prompt("computer chose square #{computers_move}")
      show_board(board)

      if a_win?(board, COMPUTER)
        SCORE[:computer] += 1
        break prompt("computer wins!")
      end
      break prompt("it's a draw!") if board.all? { |_k, v| v == USER || v == COMPUTER }
    end

    rounds_played += 1
    break prompt("final score: #{SCORE[:user]}-#{SCORE[:computer]}")if five_wins?(SCORE)
    prompt("rounds played: #{rounds_played}")
    prompt("play another? (y/n)")
    user_decision = gets.chomp.downcase
    system("clear")

    next prompt("queueing up another round...") if play_again?(user_decision)
    break prompt("exiting now...")
  end
  break prompt("thank you for playing!")
end
