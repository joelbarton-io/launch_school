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

module Talkable
  def talk(text)
    puts ''
    puts text
    puts ''
  end
end

class Participant
  include Talkable
  # attr_accessor :hit, :stay, :total

  def initialize
  end

  def busted?
  end
end

class Player < Participant
  def initialize
    @name = user_name()
  end

  private

  def user_name
    name = nil
    loop do
      prompt(PROMPTS['request_name'])
      name = gets.chomp.capitalize
      prompt(PROMPTS['confirm_name'])
      next unless gets.chomp.downcase == 'y'
      break
    end
    name
  end
end

class Dealer < Participant
end


class Deck
  def initialize
    @deck = create
  end

  private

  def create
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
  FACE = {ace:    11,
          two:    2,
          three:  3,
          four:   4,
          five:   5,
          six:    6,
          seven:  7,
          eight:  8,
          nine:   9,
          ten:    10,
          jack:   10,
          queen:  10,
          king:   10
         }
  def initialize(suit, face, value)
    @suit = suit
    @face = face
    @value = value
  end

  def to_s
    "#The {@face} of #{@suit} with a value of #{@value}"
  end
end


class Game

  def initialize
    @deck = Deck.new
    @human = Player.new
    @computer = Player.new
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
