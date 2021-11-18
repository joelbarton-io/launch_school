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
  display_both_hands(dealer_hand, user_hand)
  continue_to_dealer_turn = false

  loop do
    prompt("[h]it?...or...[s]tay?")
    h_or_s = gets.chomp
    system("clear")
    case h_or_s
    when "h"
      user_hand << draw!(1, deck).flatten(1)
      prompt("You drew a #{user_hand.last.first}!")
      delayed_clear()
      display_both_hands(dealer_hand, user_hand)
      break prompt("BUST! Dealer W!") if bust?(user_hand)

    when 's'
      prompt("User stays with a score of #{calculate_total(user_hand)}.")
      prompt("Passing to dealer...")
      delayed_clear()
      break continue_to_dealer_turn = true

    end
  end
  continue_to_dealer_turn ? calculate_total(user_hand) : nil
end

def dealer_turn(dealer_hand, deck)
  dealer_total = calculate_total(dealer_hand)
  continue_to_compare_totals = true

  loop do
    if bust?(dealer_hand)
      prompt("BUST! User W!")
      break continue_to_compare_totals = false
    elsif dealer_total >= 17
      prompt("Dealer stays with a score of #{dealer_total}.")
      break dealer_total
    else
      prompt("Dealer HITS.")
      delayed_clear()
      dealer_hand << draw!(1, deck).flatten(1)
      dealer_total = calculate_total(dealer_hand)
    end
  end
  continue_to_compare_totals ? dealer_total : nil
end

def declare_a_winner(user_final_score, dealer_final_score)
  prompt "User score: #{user_final_score}"
  prompt "Dealer score: #{dealer_final_score}"
  prompt "Tie game." if user_final_score == dealer_final_score
  prompt "User wins." if user_final_score > dealer_final_score
  prompt "Dealer wins." if user_final_score < dealer_final_score
end

def delayed_clear(dot = 10)
  dot.times do
    sleep(0.2)
    puts "."
  end
  system("clear")
end

# ------------------------------********************************----------------------------

def play_round
  system("clear")
  prompt("Welcome!")
  delayed_clear()
  prompt("Loading 21...")
  delayed_clear()
  prompt("Initializing deck...")
  working_deck = initialize_deck()
  delayed_clear()
  prompt("Initial hands have been dealt")
  mine = draw!(2, working_deck)
  dealers = draw!(2, working_deck)

  user_final_score = player_turn(dealers, mine, working_deck)

  if user_final_score
    prompt("Dealer must beat user score of #{user_final_score} to win...")
    delayed_clear()
    dealer_final_score = dealer_turn(dealers, working_deck)
    if dealer_final_score
      declare_a_winner(user_final_score, dealer_final_score)
    end
  end
  puts "Round ended."
end

play_round()