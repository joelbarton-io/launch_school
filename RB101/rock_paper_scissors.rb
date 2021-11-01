VALID_ANSWERS = %w(r p s)

def prompt(message) puts "=> #{message} " end

def print_prompt(message) print "=> #{message} " end

def valid?(answer)
  VALID_ANSWERS.include?(answer.downcase)
end

# def win?(first, second)
# end

def compare(name, user, computer)
  return "Huh, it's a tie" if user == computer

  return "#{name} " if user == 'p' && computer == 'r' ||
  user == 'r' && computer == 's' ||
  user == 's' && computer == 'p'

  return 'Computer' if computer == 'p' && user == 'r' ||
  computer == 'r' && user == 's'
  computer == 's' && user == 'p'
end

def greet
  prompt("...Hello there!")
  prompt("Welcome to Rock Paper Scissors!")
end

def get_name
  prompt("...Enter you name below.")
  gets.chomp.capitalize()
end

greet()
user_name = get_name()

loop do
  print_prompt("Your move, #{user_name}! \n r -> rock \n p -> paper \n s -> scissors \n =>")
  user_input = gets.chomp()
  next prompt("INVALID USER INPUT!!!") unless valid?(user_input)

  computer_choice = VALID_ANSWERS.sample
  prompt("computer's choice: #{computer_choice}")
  prompt("And the winner is... #{compare(user_name, user_input, computer_choice)}")

  prompt("Play again? Type 'y'")
  play_again = gets.chomp.downcase()
  play_again == 'y' ? next : break
end

prompt("#{user_name} has exited the game.")
