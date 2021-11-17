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
  one_suit["ace"] = 11   #some_method(curr_total of hand) =>returns either 1 or 11
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

def how_many_aces(hand) # => integer
  ace_count = 0

  hand.each do |card|
    if card.first == "ace"
      ace_count += 1
    end
  end
  ace_count
end

def calculate_total(hand, total = 0)
  ace_count = how_many_aces(hand)

  hand.each do |card|
    total += card[1]
  end
  ace_count > 1 ? total - (10 * (ace_count - 1)) : total
end

def display_both_hands(dealer_hand, user_hand)
  prompt("Dealer has a #{dealer_hand[0][0]} and [REDACTED].")
  puts ""
  puts "..."
  puts ""
  prompt("Your hand: #{user_hand}, totalling: #{calculate_total(user_hand)}")
end

def bust?(hand, total = 0) # t/f
  hand.each do |el|
    total += el[1]
  end
  (total > 21)
end

def player_turn(dealer_hand, user_hand, deck)
  # system("clear")
  display_both_hands(dealer_hand, user_hand)

  loop do
    prompt("[h]it?...or...[s]tay?")
    case gets.chomp
    when "h"
      user_hand << draw!(1, deck).flatten(1)
      puts "You drew a #{user_hand.last.first}"
      display_both_hands(dealer_hand, user_hand)
      break prompt("BUST! Dealer wins...") if bust?(user_hand)
    when 's'
      prompt("No more cards for me!")
      break prompt("Passing to dealer...")
      # used to invoke dealer_turn here with dealer hand and deck
    end
  end
end


# multiple aces? if true,
# one needs to be reassigned to count as 1



def dealer_turn(dealer_hand, deck)
  dealer_total = calculate_total(dealer_hand)

  until dealer_total >= 17 do
    break prompt("BUST! Player wins!!!") if bust?(dealer_hand)
    dealer_hand << draw!(1, deck).flatten(1)
    dealer_total = calculate_total(dealer_hand)
  end
  dealer_hand
end


puts "game on!"

# initalize deck and two-card hands:
working_deck = initialize_deck()
mine = draw!(2, working_deck)
dealers = draw!(2, working_deck)


# play game
player_turn(dealers, mine, working_deck)

# dealer_turn(dealer_hand, deck)






# verifying that ace calculation works, it does...
# ace_deck = []
# 26.times do
#   ace_deck.push(['ace', 11])
#   ace_deck.push(['3', 3])
# end


# ace_hand = draw!(4, ace_deck)

# prompt("hand: #{ace_hand} and total: #{calculate_total(ace_hand)}")