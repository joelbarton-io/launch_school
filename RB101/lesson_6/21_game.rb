def prompt(msg)
  puts "> #{msg}"
end

def delayed_clear(want_dots = true, want_clear = true)
  sleep(1)
  puts ""
  if want_dots
    15.times do
      sleep(0.1)
      print "."
    end
    sleep(1.2)
    puts ""
  end
  if want_clear
    system("clear")
    # sleep(1)
  end
end

def make_suit
  one_suit = (2..10).each_with_object({}) do |num, hsh|
    hsh[num.to_s] = num
  end
  ["Jack", "Queen", "King"].each do |el|
    one_suit[el] = 10
  end
  one_suit["Ace"] = 11   #some_method(curr_total of hand) =>returns either 1 or 11
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

def display_dealer_hand(dealer_hand)
  prompt("Dealer shows a #{dealer_hand[0][0]}.")
end

def display_user_hand(user_hand)
  prompt("You have: #{user_hand}, totalling: #{calculate_total(user_hand)}")
end

def bust?(hand, total = 0) # t/f
  hand.each do |el|
    total += el[1]
  end
  (total > 21)
end

def player_turn(dealer_hand, user_hand, deck)
  display_dealer_hand(dealer_hand)
  # delayed_clear(false, false)
  display_user_hand(user_hand)
  # delayed_clear(false, false)
  continue_to_dealer_turn = false

  loop do
    prompt("HIT?...or...STAY?")
    h_or_s = gets.chomp
    system("clear")
    case h_or_s
    when "h"
      user_hand << draw!(1, deck).flatten(1)
      prompt("User drew a #{user_hand.last.first}!")
      # delayed_clear()
      display_user_hand(user_hand)
      if bust?(user_hand)
        prompt("BUST!")
        # delayed_clear(false)
        break prompt("Dealer W.")
      end
    when 's'
      prompt("User STAYS at #{calculate_total(user_hand)}.")
      # delayed_clear(false, false)
      prompt("Passing to dealer.")
      # delayed_clear(true, false)
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
      prompt("Dealer STAYS at #{dealer_total}.")
      # delayed_clear(true, false)
      break dealer_total
    else
      prompt("Dealer HITS.")
      # delayed_clear(true, false)
      dealer_hand << draw!(1, deck).flatten(1)
      dealer_total = calculate_total(dealer_hand)
    end
  end
  continue_to_compare_totals ? dealer_total : nil
end

def declare_a_winner(user_final_score, dealer_final_score)
  prompt "User score: #{user_final_score}"
  prompt "Dealer score: #{dealer_final_score}"
  prompt "Tie." if user_final_score == dealer_final_score
  prompt "User W." if user_final_score > dealer_final_score
  prompt "Dealer W." if user_final_score < dealer_final_score
end

# ------------------------------********************************----------------------------

def play_round() # deck needs to carry over...
  working_deck = initialize_deck()
  # delayed_clear()
  prompt("Initial hands dealt.")
  # delayed_clear(false, false)
  mine = draw!(2, working_deck)
  dealers = draw!(2, working_deck)

  user_final_score = player_turn(dealers, mine, working_deck)

  if user_final_score
    prompt("Dealer must beat user score of #{user_final_score} to win.")
    # delayed_clear(true, false)
    dealer_final_score = dealer_turn(dealers, working_deck)

    if dealer_final_score
      declare_a_winner(user_final_score, dealer_final_score)
    end
  end
  # delayed_clear(true, false)
  prompt("Round over.")
end

def game
  prompt("Welcome, User!")
  # delayed_clear()
  prompt("Loading 21")

  loop do
    play_round()
    # delayed_clear(false, false)
    prompt("Play again?")
    run_it_back = gets.chomp
    # delayed_clear(false)
    break if run_it_back == "n"
  end
  prompt("Exited 21")
  # delayed_clear(true, true)
end

game()