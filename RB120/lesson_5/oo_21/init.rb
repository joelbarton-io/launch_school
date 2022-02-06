require 'pry'
require 'yaml'

PROMPTS = YAML.load_file('init.yml')
=begin
Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.
=end

module Displayable

end
module Talkable
  def talk(text)
    puts text
    puts ''
  end
end

class Participant
  include Talkable
  attr_reader :name

  def initialize
    @hand = []
  end

  def busted?
  end

  def hit
  end

  def stay
  end

  def draw(card)
    hand << card
  end

  private

  attr_reader :hand
end

class Player < Participant

  def initialize
    @name = retrieve_name()
    super()
  end

  def show
    puts "#{name}'s hand contains: "
    puts hand
  end

  private

  def retrieve_name
    name = nil
    loop do
      talk(PROMPTS['request_name'])
      name = gets.chomp.capitalize
      talk(PROMPTS['confirm_name'])
      next unless gets.chomp.downcase == 'y'
      break
    end
    name.freeze
  end
end

class Dealer < Participant

  def initialize
    @name = retrieve_name()
    super()
  end

  def show
    puts "#{name} shows: "
    puts hand.first
  end

  private

  def retrieve_name
    ['Beep', 'Boop', 'Bingbong', 'Lawrence'].sample.freeze
  end
end


class Deck
  attr_reader :deck

  def initialize
    @deck = create_deck()
  end

  def deal!
    deck.pop
  end

  private

  def create_deck()
    make_deck.shuffle
  end

  def make_deck
    deck = []
    Card::SUIT.each do |suit|
      Card::FACE.each do |face|
        deck << Card.new(suit, face.first, face.last)
      end
    end
    deck
  end

  def to_s
    puts "No peeking!"
  end
end

class Card
  SUIT = %w(Diamonds Hearts Clubs Spades)
  FACE = {Ace:    11,
          Two:    2,
          Three:  3,
          Four:   4,
          Five:   5,
          Six:    6,
          Seven:  7,
          Eight:  8,
          Nine:   9,
          Ten:    10,
          Jack:   10,
          Queen:  10,
          King:   10
         }
  def initialize(suit, face, value)
    @suit = suit
    @face = face
    @value = value
  end

  def to_s
    "#The #{@face} of #{@suit}"
  end

end

class Game
  attr_reader :current, :player, :dealer

  def initialize
    @current = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    deal_cards_to_both_players(2)
    binding.pry
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  private

  def deal_cards_to_both_players(count = 1) # why is this method in the Game class?
    count.times do
      player.draw(current.deal!)
      dealer.draw(current.deal!)
    end
  end
end

Game.new.start
