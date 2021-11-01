# r -> l, sc
# l -> sp, p
# sp -> r, sc
# sc -> p, l
# p -> r, sp

VALID_ANSWERS = %i(r p sc l sp)

def update_score_board(boolean, current_score) # updates current_score
  boolean ? current_score[:user] += 1 : current_score[:computer] += 1
end

def game_over?(current_score) # returns a boolean
  (current_score[:user] > 2) || (current_score[:computer] > 2) ? true : false
end

def prompt(message) puts "=> #{message} " end

def valid?(answer) VALID_ANSWERS.include?(answer) end

# def tie?(current_score) current_score[:ties] += 1 end

def declare_winner(final_score)
  final_score.max_by { |_k, v| v }
end

def user_win?(user, computer) # returns true or false
  moves_hash = {
    r: ['l', 'sc'],
    p: ['r', 'sp'],
    sc: ['p', 'l'],
    l: ['sp', 'p'],
    sp: ['r', 'sc']
  }
  moves_hash[user].include?(computer.to_s) ? true : false
end

score = {
  user: 0,
  computer: 0
}

loop do
  prompt("What is your move?")
  user_move = gets.chomp.downcase.to_sym
  next prompt("input invalid") unless valid?(user_move)

  computer_move = VALID_ANSWERS.sample
  prompt("Computer: #{computer_move}")

  next prompt("Tie!\nScore Board: #{score}") if computer_move == user_move

  result_of_round = user_win?(user_move, computer_move)   # CLEAR WIN: boolean

  update_score_board(result_of_round, score)              # SIDE EFFECT

  break if game_over?(score)                              # GAMEOVER

  prompt("Score Board: #{score}")
  prompt("...next round")
end

puts "Winner: #{declare_winner(score)}"
