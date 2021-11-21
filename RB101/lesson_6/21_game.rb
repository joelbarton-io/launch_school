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
  prompt("Your hand: #{user_hand}, for a total of #{calculate_total_of(user_hand)}")
  delayed_clear(false, false)
end

def make_suit
  one_suit = (2..10).each_with_object({}) do |num, suit|
    suit[num.to_s] = num
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

def draw!(amount, deck, hand = [])
  amount.times do
    a_random_index = (0...deck.length).to_a.sample
    hand.push(deck.delete_at(a_random_index))
  end
  hand
end

def how_many_aces(hand, ace_count = 0)
  hand.each do |card|
    ace_count += 1 if card.first == "Ace"
  end
  ace_count
end

def calculate_total_of(hand) # definitely split up into two methods
  ace_count = how_many_aces(hand)
  raw_total = hand.inject(0) { |sum, card| sum + card[1] }

  case ace_count
  when 0
    raw_total
  when 1
    if raw_total <= 21
      raw_total
    else
      (raw_total -= (10 * ace_count))
    end
  else
    loop do
      raw_total -= 10
      break raw_total if raw_total <= 21
    end
    raw_total
  end
end

# def total_includes_aces(number_of_aces, crude_total)
# end

def bust?(hand)
  calculate_total_of(hand) > 21
end

def player_turn(dealer_hand, user_hand, deck, continue_to_dealer_turn = false)
  display_dealer_hand(dealer_hand)
  display_user_hand(user_hand)

  loop do
    prompt("HIT? => [h]") # h or s, then hit enter
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
      prompt("User STAYS at #{calculate_total_of(user_hand)}.")
      prompt("Passing to dealer.")
      delayed_clear()
      break continue_to_dealer_turn = true
    end
  end
  continue_to_dealer_turn ? calculate_total_of(user_hand) : nil
end

def dealer_turn(dealer_hand, deck, continue_to_compare_totals = true)
  dealer_total = calculate_total_of(dealer_hand)

  loop do
    if bust?(dealer_hand)
      prompt("BUST! User W!")
      break continue_to_compare_totals = false
    elsif dealer_total >= 17
      prompt("Dealer STAYS at #{dealer_total}.")
      delayed_clear(true, false)
      break dealer_total
    else
      prompt("Dealer HITS!")
      delayed_clear(true, false)
      dealer_hand << draw!(1, deck).flatten(1)
      dealer_total = calculate_total_of(dealer_hand)
    end
  end
  continue_to_compare_totals ? dealer_total : nil
end

def declare_the_winner(user_final_score, dealer_final_score)
  prompt "User score: #{user_final_score}"
  prompt "Dealer score: #{dealer_final_score}"
  prompt "Tie." if user_final_score == dealer_final_score
  prompt "User W." if user_final_score > dealer_final_score
  prompt "Dealer W." if user_final_score < dealer_final_score
end

def play_one_round(working_deck = initialize_deck()) # deck can be passed to consecutive rounds
  prompt("Hands are being dealt.")
  delayed_clear(true, false)
  my_hand = draw!(2, working_deck)
  dealers_hand = draw!(2, working_deck)

  user_final_score = player_turn(dealers_hand, my_hand, working_deck)

  if user_final_score
    prompt("Dealer must beat user score of #{user_final_score} to win!")
    delayed_clear(true, false)
    dealer_final_score = dealer_turn(dealers_hand, working_deck)

    if dealer_final_score
      declare_the_winner(user_final_score, dealer_final_score)
    end
  end
  prompt("Round is now over.")
  delayed_clear(false, false)
  working_deck
end

def game
  prompt("Welcome, User!")
  delayed_clear(true, false)
  prompt("Loading up 21")
  delayed_clear(true)
  passed_deck = play_one_round()

  loop do
    prompt("Play again? (all keys except [n] will queue up another round)")
    play_another = gets.chomp
    delayed_clear(false)

    break if play_another == "n"
    prompt("Remaining cards in the deck: #{passed_deck.size}")
    play_one_round(passed_deck)
  end
  prompt("Exiting 21")
  delayed_clear(true, false)
  prompt("Thank you for playing!")
end

game()
