VALID_ANSWERS = %i(r p sc l sp)

def update_score_board(boolean, current_score) 
  boolean ? current_score[:user] += 1 : current_score[:computer] += 1
end 

# def game_over?() # returns a boolean
#   ((score[:user] > 2) || (score[:computer] > 2)) ? true : false 
# end 

def prompt(message) puts "=> #{message} " end

def valid?(answer) VALID_ANSWERS.include?(answer) end

def user_win?(mine, computers) # returns true or false
  moves_hash = {
    :r =>  ['l', 'sc'],
    :p => ['r', 'sp'],
    :sc => ['p', 'l'],
    :l => ['sp', 'p'],
    :sp => ['r', 'sc'] 
  }
  moves_hash[mine].include?(computers.to_s) ? true : false
end 

# game from scratch
score = {
  :user => 0,
  :computer => 0
}

loop do
  prompt("What is your move?")
  user_move = gets.chomp.downcase.to_sym
  next prompt("input invalid") unless valid?(user_move)

  computer_move = VALID_ANSWERS.sample
  next prompt("Tie!") if computer_move == user_move # Tie node

  boolean_result = user_win?(user_move, computer_move) # clear winner
  
  update_score_board(boolean_result, score) # i: true/false SIDE EFFECT

  prompt("next round")
end

print score


# prompt(moves_hash['p'.to_sym].include?('r'))




# r -> l, sc
# l -> sp, p 
# sp -> r, sc
# sc -> p, l
# p -> r, sp



#additions: keeps score, when player or computer reaches 
#           3 wins, declare winner and display final score
