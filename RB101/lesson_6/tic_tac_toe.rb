WIN_CONDITIONS = {
  1 => [1, 2, 3], 2 => [4, 5, 6], 3 => [7, 8, 9],
  4 => [1, 4, 7], 5 => [2, 5, 8], 6 => [3, 6, 9],
  7 => [1, 5, 9], 8 => [3, 5, 7]
}

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

def prompt(message)
  puts ">>> #{message}"
end

def play_again?(answer)
  answer == "y"
end

def generate_computer_move(curr_board, number = 0)
  loop do
    number = (1..9).to_a.sample
    next if curr_board[number] == "x" || curr_board[number] == "o"
    break number
  end
  number
end

def win?(board_state, symbol)
  same_symbol = Proc.new { |el| board_state[el] == symbol }
  result = (1...8).any? { |number| WIN_CONDITIONS[number].all?(&same_symbol) }
  result
end

def generate_player_move(curr_board, user_input = 0)
  loop do
    prompt("enter a number between 1 and 9")
    user_input = gets.chomp.to_i
    if curr_board[user_input] == "x" || curr_board[user_input] == "o"
      prompt("box #{user_input} is already populated!")
      next
    end
    break system("clear")
  end
  user_input
end

rounds_played = 0

loop do
  puts "welcome to the tic-tac-toe game!"
  puts ""
  puts "..."
  puts ""
  board = initialize_board
  puts ""

  loop do
    player_move = generate_player_move(board)
    board[player_move] = "x"

    break prompt("user wins!") if win?(board, "x")
    break prompt("draw!") if board.all? { |_k, v| v == "x" || v == "o" }

    prompt("computer is choosing a quadrant...")
    computers_move = generate_computer_move(board)
    board[computers_move] = "o"
    prompt("computer chose quadrant #{computers_move}")
    show_board(board)

    break prompt("computer wins!") if win?(board, "o")
    break prompt("it's a draw!") if board.all? { |_k, v| v == "x" || v == "o" }
  end

  rounds_played += 1
  prompt("rounds played: #{rounds_played}")
  prompt("play another? (y/n)")
  user_decision = gets.chomp.downcase
  system("clear")

  next prompt("queueing up another round...") if play_again?(user_decision)
  break prompt("exiting now...")
end

puts "..."
prompt("the game has now exited")
