require 'pry'

class GuessingGame

  def initialize(lower_bound, upper_bound)
    reset(lower_bound, upper_bound)
  end

  def play
    loop do
      play_one_round()
      reset()
    end
  end

  private

  attr_accessor :guess_count

  def reset(lower_bound, upper_bound)
    @span = Range.new(lower_bound, upper_bound).to_a
    @guess_count = (Math.log2(@span.size).to_i + 1)
    @target = @span.sample
  end

  def play_one_round
    loop do
      break out_of_guesses() if guess_count == 0
      guess = user_guesses()
      break if got_it_right?(guess)
    end
  end

  def out_of_guesses
    puts
    puts "You have no more guesses. You lost!"
  end

  def got_it_right?(guess)
    if guess == @target
      puts "That's the number!"
      return true
    elsif guess < @target
      puts "Your guess is too low."
    elsif guess > @target
      puts "Your guess is too high."
    end
  end

  def user_guesses
    answer = nil
    loop do
      break if guess_count == 0
      remaining_guesses()
      range_prompt()
      decrement_guess_count()
      answer = gets.chomp
      break if valid_integer?(answer)
      puts "Invalid guess."
    end
    answer.to_i
  end

  def decrement_guess_count(amount=1)
    self.guess_count = guess_count - amount
  end

  def remaining_guesses
    puts "You have #{guess_count} guesses remaining."
  end

  def range_prompt
    puts "Enter a number between #{@span.first} and #{@span.last}: "
  end

  def valid_integer?(candidate)
    candidate.to_i.to_s == candidate
  end
end

game = GuessingGame.new(1, 10)
game.play