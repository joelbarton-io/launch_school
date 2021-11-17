def prompt(msg)
  puts ">>> #{msg}"
end

def make_suit
  one_suit = (2..10).each_with_object({}) do |num, hsh|
    hsh[num.to_s] = num
  end
  ["jack", "queen", "king"].each do |el|
    one_suit[el] = 10
  end
  one_suit["ace"] = 1   #some_method(curr_total of hand) =>returns either 1 or 11
  one_suit
end

def initialize_deck(deck = [])
  4.times do
    deck.push(make_suit.to_a) # hash to array
  end
  deck.flatten(1)
end

def draw!(n, deck, hand = [])   # n cards, working deck, working hand
  n.times do
    a_random_index = (0...deck.length).to_a.sample
    hand.push(deck.delete_at(a_random_index))
  end
  hand
end

def display_both_hands(dealer_hand, user_hand)
  prompt("Dealer has: #{dealer_hand[0][0]} and unknown.")
  puts ""
  prompt("Your hand: #{user_hand}")
end

def bust?(hand, total = 0) # t/f
  hand.each do |el|
    total += el[1]
  end
  (total > 21)
end

def player_turn(dealer_hand, user_hand, deck)
  loop do
    prompt("[h]it?...or...[s]tay?")
    case gets.chomp
    when "h"
      user_hand << draw!(1, deck).flatten(1)
      puts "You drew a #{user_hand.last[0]}"
      prompt("Your current hand: #{user_hand}")
      break prompt("BUST! Dealer wins...") if bust?(user_hand)
    when 's'
      prompt("No more cards for me!")
      prompt("Passing to dealer...")

      break dealer_turn(dealer_hand, deck)
    end
  end
end

def dealer_turn(dealer_hand, deck)
  # hit until total >= 17
  loop do
    break prompt("BUST! Player wins!!!") if bust?(dealer_hand)
    dealer_hand << draw!(1, deck).flatten(1)
  end
end

puts "game on!"

working_deck = initialize_deck()

mine = draw!(2, working_deck)
dealers = draw!(2, working_deck)

display_both_hands(dealers, mine)

player_turn(dealers, mine, working_deck)

def ace_value(total)
end
