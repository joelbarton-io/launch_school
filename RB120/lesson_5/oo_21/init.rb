require 'pry'
require 'yaml'

PROMPTS = YAML.load_file('init.yml')

module UserExp
  def wipe
    system 'clear'
  end

  def delay(duration = 2)
    sleep(duration)
  end
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
  attr_accessor :busted

  def initialize
    @hand = []
    @busted = false
  end

  def busted?
    total > 21
  end

  def draw(drawn_card)
    hand << drawn_card
  end

  def raw_total
    current_total = 0
    hand.each do |card|
      current_total += card.value
    end
    current_total
  end

  def total
    raw_total = raw_total()
    return raw_total if number_of_aces.zero?
    number_of_aces.times do
      break if raw_total <= 21
      raw_total -= 11
    end
    raw_total
  end

  def ==(other)
    total == other.total
  end

  def >(other)
    total > other.total
  end

  def <(other)
    total < other.total
  end

  private

  attr_reader :hand

  def number_of_aces
    hand.select do |card|
      card.value == :Ace
    end.size
  end
end

class Player < Participant
  def initialize
    @name = retrieve_name()
    super()
  end

  def show
    talk(PROMPTS['your_hand'])
    hand.each do |card|
      puts card
    end
    nil
  end

  private

  def retrieve_name
    name = nil
    loop do
      talk(PROMPTS['request_name'])
      name = gets.chomp.capitalize
      talk(PROMPTS['confirm_name'])
      next wipe() unless gets.chomp.downcase == 'y'
      break
    end
    name.freeze
  end
end

class Dealer < Participant
  RANDOM_NAME = ['Beep', 'Boop', 'Bingbong', 'Lawrence']

  def initialize
    @name = retrieve_name()
    @busted = false
    super()
  end

  def show
    puts "#{name} shows:"
    puts ''
    puts hand.first
  end

  private

  def retrieve_name
    RANDOM_NAME.sample
  end
end

class Deck
  attr_reader :current

  def initialize
    @current = create
  end

  def deal!
    current.pop
  end

  private

  def create
    make_deck.shuffle
  end

  def make_deck
    Card::SUIT.each_with_object([]) do |suit, deck|
      Card::FACE.each do |face|
        deck << Card.new(suit, face.first, face.last)
      end
    end
  end

  def to_s
    puts "No peeking!"
  end
end

class Card
  attr_reader :value, :face

  SUIT = %w(Diamonds Hearts Clubs Spades)
  FACE = { Ace: 11,
           Two: 2,
           Three: 3,
           Four: 4,
           Five: 5,
           Six: 6,
           Seven: 7,
           Eight: 8,
           Nine: 9,
           Ten: 10,
           Jack: 10,
           Queen: 10,
           King: 10 }

  def initialize(suit, face, value)
    @suit = suit
    @face = face
    @value = value
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end

class Game
  include Talkable, UserExp

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    welcome()
    main_game()
    farewell()
  end

  private

  attr_reader :deck, :player, :dealer

  def main_game
    setup()
    show_initial_cards()
    player_takes_turn()
    return show_result() if player.busted

    wipe()
    dealer_takes_turn()
    show_result()
  end

  def setup
    2.times do
      player_draw_from_deck()
      dealer_draw_from_deck()
    end
    delay()
    wipe()
  end

  def show_initial_cards
    player.show
    talk(PROMPTS['line'])
    dealer.show
    talk(PROMPTS['line'])
  end

  def player_takes_turn
    loop do
      talk("Your current total: #{player.total}")
      break unless player_hits?
      talk(PROMPTS['hit'])
      dealer.show
      player_draw_from_deck()
      break player.busted = true if player_busted?
    end
  end

  def dealer_takes_turn
    talk(PROMPTS['to_dealer'])
    delay()
    loop do
      break if dealer.total >= 17
      dealer_draw_from_deck()
    end
    dealer.busted = true if dealer_busted?
  end

  def show_result
    if player.busted
      puts "#{player.name} busted so #{dealer.name} wins."
    elsif dealer.busted
      puts "#{dealer.name} busted so #{player.name} wins."
    else
      compare_totals()
    end
  end

  def compare_totals
    if player == dealer
      puts 'Tie'
    elsif player < dealer
      puts "#{dealer.name} won with #{dealer.total}"
    elsif player > dealer
      puts "#{player.name} won with #{player.total}"
    end
  end

  def dealer_busted?
    dealer.busted?
  end

  def player_busted?
    player.busted?
  end

  def player_hits?
    answer = nil
    loop do
      talk(PROMPTS['hit_or_stay'])
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      talk(PROMPTS['invalid_h_s'])
      delay()
      wipe()
      talk("Your current total: #{player.total}")
    end
    answer == 'h'
  end

  def player_draw_from_deck
    card_drawn = deck.deal!
    player.draw(card_drawn)
    puts "#{player.name} drew the #{card_drawn}"
    delay()
  end

  def dealer_draw_from_deck
    card_drawn = deck.deal!
    dealer.draw(card_drawn)
  end

  def welcome
    talk(PROMPTS['welcome'])
    delay()
    wipe()
  end

  def farewell
    talk(PROMPTS['farewell'])
  end
end

Game.new.play
