def prompt(msg)
  puts "> #{msg}"
end

def delayed_clear(want_dots = true, want_clear = true)
  sleep(0.33)
  puts ""
  if want_dots
    15.times do
      sleep(0.05)
      print "."
    end
    sleep(1)
    puts ""
  end
  if want_clear
    system("clear")
    # sleep(1)
  end
end

def display_dealer_hand(dealer_hand)
  prompt("Dealer shows #{dealer_hand[0][0]}.")
  delayed_clear(true, false)
end

def display_user_hand(user_hand)
  prompt("Your hand: #{user_hand}, totalling: #{calculate_total(user_hand)}")
  delayed_clear(false, false)
end

def make_suit
  one_suit = (2..10).each_with_object({}) do |num, hsh|
    hsh[num.to_s] = num
  end
  ["Jack", "Queen", "King"].each do |el|
    one_suit[el] = 10
  end
  one_suit["Ace"] = 11
  one_suit
end

def initialize_deck(deck = [])
  4.times do
    deck.push(make_suit().to_a) # hash to array
  end
  deck.flatten(1)
end

def draw!(n, deck, hand = [])
  n.times do
    a_random_index = (0...deck.length).to_a.sample
    hand.push(deck.delete_at(a_random_index))
  end
  hand
end

def how_many_aces(hand, ace_count = 0) # => integer
  hand.each do |card|
    ace_count += 1 if card.first == "ace"
  end
  ace_count
end

def calculate_total(hand)
  ace_count = how_many_aces(hand)
  raw_total = hand.inject(0) { |sum, card| sum + card[1] }

  case ace_count
  when 0
    raw_total
  when 1
    raw_total if raw_total <= 21
    (raw_total -= (10 * ace_count))
  else
    loop do
      raw_total -= 10
      break raw_total if raw_total <= 21
    end
    raw_total
  end
end

def bust?(hand) # t/f
  calculate_total(hand) > 21
end

def player_turn(dealer_hand, user_hand, deck, continue_to_dealer_turn = false)
  display_dealer_hand(dealer_hand)
  display_user_hand(user_hand)

  loop do
    prompt("HIT? => [h]") # still no argument validation here
    prompt("STAY? => [s]")
    h_or_s = gets.chomp
    delayed_clear()

    case h_or_s
    when "h"
      user_hand << draw!(1, deck).flatten(1)
      prompt("User drew a #{user_hand.last.first}!")
      display_user_hand(user_hand)
      display_dealer_hand(dealer_hand)
      if bust?(user_hand)
        prompt("BUST!")
        break prompt("Dealer W.")
      end
    when 's'
      prompt("User STAYS at #{calculate_total(user_hand)}.")
      prompt("Passing to dealer.")
      delayed_clear()
      break continue_to_dealer_turn = true
    end
  end
  continue_to_dealer_turn ? calculate_total(user_hand) : nil
end

def dealer_turn(dealer_hand, deck, continue_to_compare_totals = true)
  dealer_total = calculate_total(dealer_hand)
  loop do
    if bust?(dealer_hand)
      prompt("BUST! User W!")
      break continue_to_compare_totals = false
    elsif dealer_total >= 17
      prompt("Dealer STAYS at #{dealer_total}.")
      delayed_clear(true, false)
      break dealer_total
    else
      prompt("Dealer HITS.")
      delayed_clear(true, false)
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

def play_round(working_deck = initialize_deck()) # deck passed
  prompt("Hands dealt.")
  delayed_clear(true, false)
  mine = draw!(2, working_deck)
  dealers = draw!(2, working_deck)
  user_final_score = player_turn(dealers, mine, working_deck)
  if user_final_score
    prompt("Dealer must beat user score of #{user_final_score} to win!")
    delayed_clear(true, false)
    dealer_final_score = dealer_turn(dealers, working_deck)
    declare_a_winner(user_final_score, dealer_final_score) if dealer_final_score
  end
  prompt("Round is over.")
  delayed_clear(false, false)
  working_deck
end

def game
  prompt("Welcome, User!")
  delayed_clear(true, false)
  prompt("Loading 21")
  delayed_clear(true)
  passed_deck = play_round()

  loop do
    prompt("Play again? (all keys but [n] will queue another round)")
    run_it_back = gets.chomp
    delayed_clear(false)

    break if run_it_back == "n"
    prompt("Remaining cards #{passed_deck.size}")
    play_round(passed_deck)
  end
  prompt("Exited 21")
end

game()
