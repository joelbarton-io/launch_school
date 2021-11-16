def initialize_deck(deck = [])
  4.times do
    deck.push(make_suit)
  end
  deck
end

def make_suit
  one_suit = (2..10).each_with_object({}) do |num, hsh|
    hsh[num] = num
  end
  [:jack, :queen, :king].each do |el|
    one_suit[el] = 10
  end
  one_suit[:ace] = 1 #some_method(curr_total of hand) =>returns either 1 or 11
  one_suit
end

def draw_one
end

def draw_two(deck, total = 0)

end

def deal(deck, player_hand = [], dealer_hand = []) # initialize player/dealer hands, modify the deck
  player_hand.push()
end


puts "game on!"

fresh_deck = initialize_deck()
deal(fresh_deck)




















def ace_value(total)
end

def prompt(msg)
  puts ">>> #{msg}"
end

def hit?
end

def player_turn # if bust, dealer wins
end

# invocation is predicated on a player bust
def dealer_turn # hit until total >= 17
end

def a_win?() # declares winner
end