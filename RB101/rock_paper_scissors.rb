# game flow

# the user makes a choice
# the computer makes a choice
# the winner is displayed

# Problem
#   input => rock, or paper, or scissors from user
#   output => winner's name is displayed

# Examples/Test Cases
#   user inputs: rock
#   computer makes move: is paper
#   displays message that user won round

# Data Structure
#   array with options for computer
#   basic variable storage

# Algorithm
#   prompt user
#   store choice, validate
#     if valid => break
#     else => display error message, next

#   computer selection
#   store choice

#   compare user and computer choices
#   output winner

#   ask if play again?
# Code with INTENT

def prompt(message) puts "=> #{message} " end

def print_prompt(message) print "=> #{message} " end

def valid?(answer, options)
  options.include?(answer.downcase)
end

def computer_chooses(options)
  options.sample()
end

def compare(name, user, computer)
  return "Huh, it's a tie" if user == computer
  return "#{name} " if user == 'p' && computer == 'r'
  return "#{name} " if user == 'r' && computer == 's'
  return "#{name} " if user == 's' && computer == 'p'

  return 'Computer' if computer == 'p' && user == 'r'
  return 'Computer' if computer == 'r' && user == 's'
  return 'Computer' if computer == 's' && user == 'p'
end

def greet
  prompt("...Hello there!")
  prompt("Welcome to Rock Paper Scissors!")
end

def get_name
  prompt("...Enter you name below.")
  gets.chomp.capitalize()
end

def game(user_name)
  valid_answers = %w(r p s)

  loop do
    print_prompt("Your move, #{user_name}! \n r -> rock \n p -> paper \n s -> scissors \n =>")
    user_input = gets.chomp()
    next prompt("INVALID USER INPUT!!!") unless valid?(user_input, valid_answers)

    computer_choice = computer_chooses(valid_answers)
    prompt("computer's choice: #{computer_choice}")
    prompt("And the winner is... #{compare(user_name, user_input, computer_choice)}")

    prompt("Play again? Type 'y'")
    play_again = gets.chomp.downcase()
    play_again == 'y' ? next : break
  end
  prompt("#{user_name} has exited the game.")
end

greet()
name = get_name()
game(name)
